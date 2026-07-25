from __future__ import annotations

import io
import json
import sys
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from PIL import Image, ImageFile


ImageFile.LOAD_TRUNCATED_IMAGES = True

CATALOG_PATH = Path(sys.argv[1] if len(sys.argv) > 1 else "imports/1688-products.json").resolve()
ASSET_ROOT = Path(sys.argv[2] if len(sys.argv) > 2 else "assets/1688").resolve()
MAX_EDGE = 1200
WEBP_QUALITY = 78
WORKERS = 10


def candidates(url: str) -> list[str]:
    urls = [url]
    if url.endswith("_.webp"):
        urls.append(url[: -len("_.webp")])
    if "_sum.jpg" in url:
        urls.append(url.replace("_sum.jpg", ".jpg"))
    return list(dict.fromkeys(urls))


def fetch_image(url: str) -> bytes:
    last_error: Exception | None = None
    for candidate in candidates(url):
        for attempt in range(3):
            try:
                request = urllib.request.Request(
                    candidate,
                    headers={
                        "Accept": "image/avif,image/webp,image/apng,image/*,*/*;q=0.8",
                        "Referer": "https://detail.1688.com/",
                        "User-Agent": (
                            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                            "AppleWebKit/537.36 Chrome/138.0 Safari/537.36"
                        ),
                    },
                )
                with urllib.request.urlopen(request, timeout=25) as response:
                    content_type = response.headers.get("Content-Type", "")
                    body = response.read()
                if not content_type.startswith("image/") or len(body) < 256:
                    raise ValueError(f"Unexpected response {content_type}, {len(body)} bytes")
                return body
            except (OSError, ValueError, urllib.error.URLError) as error:
                last_error = error
                if attempt < 2:
                    time.sleep(0.4 * (attempt + 1))
    raise RuntimeError(f"Unable to download {url}: {last_error}")


def convert_image(body: bytes, destination: Path) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    with Image.open(io.BytesIO(body)) as source:
        source.seek(0)
        source.thumbnail((MAX_EDGE, MAX_EDGE), Image.Resampling.LANCZOS)
        has_alpha = "A" in source.getbands()
        image = source.convert("RGBA" if has_alpha else "RGB")
        temporary = destination.with_suffix(".tmp")
        image.save(
            temporary,
            format="WEBP",
            quality=WEBP_QUALITY,
            method=6,
            exact=has_alpha,
        )
        temporary.replace(destination)


def cache_one(task: tuple[str, int, str]) -> tuple[str, int, str, str | None]:
    offer_id, index, url = task
    relative = Path("assets") / "1688" / offer_id / f"{index + 1:02d}.webp"
    destination = ASSET_ROOT / offer_id / f"{index + 1:02d}.webp"
    try:
        if destination.exists():
            with Image.open(destination) as existing:
                existing.verify()
        else:
            convert_image(fetch_image(url), destination)
        return offer_id, index, relative.as_posix(), None
    except Exception as error:  # noqa: BLE001 - preserve all failed URLs in the report
        if destination.exists():
            destination.unlink()
        return offer_id, index, "", str(error)


def main() -> None:
    catalog = json.loads(CATALOG_PATH.read_text(encoding="utf-8"))
    products = catalog.get("products", [])
    tasks: list[tuple[str, int, str]] = []
    original_images: dict[str, list[str]] = {}

    for product in products:
        offer_id = str(product["offerId"])
        variant_images = [item.get("image", "") for item in product.get("variants", [])]
        images = list(dict.fromkeys(filter(None, [*product.get("images", []), *variant_images])))
        original_images[offer_id] = images
        tasks.extend((offer_id, index, url) for index, url in enumerate(images))

    results: dict[str, dict[int, str]] = {}
    failures: list[dict[str, str | int]] = []
    with ThreadPoolExecutor(max_workers=WORKERS) as executor:
        futures = {executor.submit(cache_one, task): task for task in tasks}
        completed = 0
        for future in as_completed(futures):
            offer_id, index, local_path, error = future.result()
            completed += 1
            if local_path:
                results.setdefault(offer_id, {})[index] = local_path
            else:
                failures.append(
                    {
                        "offerId": offer_id,
                        "url": original_images[offer_id][index],
                        "error": error or "Unknown error",
                    }
                )
            if completed % 100 == 0 or completed == len(tasks):
                print(f"Processed {completed}/{len(tasks)} images")

    products_without_local_images: list[str] = []
    for product in products:
        offer_id = str(product["offerId"])
        local_images = [path for _, path in sorted(results.get(offer_id, {}).items())]
        if local_images:
            product["images"] = local_images
        else:
            products_without_local_images.append(offer_id)
            product["images"] = original_images[offer_id]

    catalog["imageCache"] = {
        "generatedAt": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "cached": sum(len(images) for images in results.values()),
        "failed": len(failures),
        "productsWithoutLocalImages": products_without_local_images,
    }
    CATALOG_PATH.write_text(f"{json.dumps(catalog, ensure_ascii=False, indent=2)}\n", encoding="utf-8")
    report_path = CATALOG_PATH.with_name("1688-image-cache-report.json")
    report_path.write_text(
        f"{json.dumps({'failures': failures}, ensure_ascii=False, indent=2)}\n",
        encoding="utf-8",
    )
    print(
        f"Cached {catalog['imageCache']['cached']} images; "
        f"{len(failures)} failed; {len(products_without_local_images)} products have no local image."
    )


if __name__ == "__main__":
    main()

