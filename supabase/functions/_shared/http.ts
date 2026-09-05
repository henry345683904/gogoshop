const DEFAULT_SITE_URL = "https://gogoshop.nz/";
const LEGACY_SITE_ORIGIN = "https://henry345683904.github.io";
const ALLOWED_ORIGINS = new Set([
  "https://gogoshop.nz",
  "https://www.gogoshop.nz",
  LEGACY_SITE_ORIGIN,
  "http://127.0.0.1:8769",
  "http://localhost:8769"
]);

export function siteUrl(): string {
  const configured = Deno.env.get("SITE_URL")?.trim();
  if (!configured) return DEFAULT_SITE_URL;
  try {
    const url = new URL(configured);
    return url.origin === LEGACY_SITE_ORIGIN ? DEFAULT_SITE_URL : url.toString();
  } catch {
    return DEFAULT_SITE_URL;
  }
}

export function requestOriginAllowed(request: Request): boolean {
  const origin = request.headers.get("origin");
  if (!origin) return true;
  return ALLOWED_ORIGINS.has(origin) || origin === new URL(siteUrl()).origin;
}

export function corsHeaders(request: Request): HeadersInit {
  const origin = request.headers.get("origin");
  const allowedOrigin = origin && requestOriginAllowed(request)
    ? origin
    : new URL(siteUrl()).origin;
  return {
    "Access-Control-Allow-Origin": allowedOrigin,
    "Access-Control-Allow-Headers": "authorization, apikey, content-type, x-client-info",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Vary": "Origin"
  };
}

export function jsonResponse(
  request: Request,
  body: Record<string, unknown>,
  status = 200
): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: {
      ...corsHeaders(request),
      "Content-Type": "application/json"
    }
  });
}
