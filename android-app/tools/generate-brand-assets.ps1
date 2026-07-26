param(
    [string]$ResourceRoot = (Join-Path $PSScriptRoot "..\android\app\src\main\res"),
    [string]$SourcePath = (Join-Path $PSScriptRoot "..\brand\app-icon-source.png"),
    [string]$WebAssetRoot = (Join-Path $PSScriptRoot "..\..\assets")
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

function Save-ResizedImage {
    param(
        [System.Drawing.Image]$Source,
        [string]$Path,
        [int]$Width,
        [int]$Height,
        [double]$Scale = 1,
        [System.Drawing.Color]$Background = [System.Drawing.Color]::Transparent
    )

    $bitmap = [System.Drawing.Bitmap]::new($Width, $Height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.Clear($Background)
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality

    $targetWidth = [int][Math]::Round($Width * $Scale)
    $targetHeight = [int][Math]::Round($Height * $Scale)
    $targetX = [int][Math]::Round(($Width - $targetWidth) / 2)
    $targetY = [int][Math]::Round(($Height - $targetHeight) / 2)
    $graphics.DrawImage($Source, $targetX, $targetY, $targetWidth, $targetHeight)

    $directory = Split-Path -Parent $Path
    if (-not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory | Out-Null
    }
    $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
}

if (-not (Test-Path $SourcePath)) {
    throw "App icon source not found: $SourcePath"
}

$source = [System.Drawing.Image]::FromFile((Resolve-Path $SourcePath))
$densities = @{
    "mipmap-mdpi" = 48
    "mipmap-hdpi" = 72
    "mipmap-xhdpi" = 96
    "mipmap-xxhdpi" = 144
    "mipmap-xxxhdpi" = 192
}

foreach ($entry in $densities.GetEnumerator()) {
    $directory = Join-Path $ResourceRoot $entry.Key
    $size = [int]$entry.Value
    Save-ResizedImage -Source $source -Path (Join-Path $directory "ic_launcher.png") -Width $size -Height $size
    Save-ResizedImage -Source $source -Path (Join-Path $directory "ic_launcher_round.png") -Width $size -Height $size
    Save-ResizedImage -Source $source -Path (Join-Path $directory "ic_launcher_foreground.png") -Width ([int]($size * 2.25)) -Height ([int]($size * 2.25)) -Scale 0.72
}

$splashBackground = [System.Drawing.ColorTranslator]::FromHtml("#FFFFFF")
Get-ChildItem -Path $ResourceRoot -Recurse -Filter "splash.png" | ForEach-Object {
    $existing = [System.Drawing.Image]::FromFile($_.FullName)
    $width = $existing.Width
    $height = $existing.Height
    $existing.Dispose()
    $scale = ([Math]::Min($width, $height) * 0.22) / $width
    Save-ResizedImage -Source $source -Path $_.FullName -Width $width -Height $height -Scale $scale -Background $splashBackground
}

Save-ResizedImage -Source $source -Path (Join-Path $WebAssetRoot "app-icon.png") -Width 1024 -Height 1024
Save-ResizedImage -Source $source -Path (Join-Path $WebAssetRoot "app-icon-512.png") -Width 512 -Height 512
Save-ResizedImage -Source $source -Path (Join-Path $WebAssetRoot "app-icon-192.png") -Width 192 -Height 192
Save-ResizedImage -Source $source -Path (Join-Path $WebAssetRoot "apple-touch-icon.png") -Width 180 -Height 180

$source.Dispose()
Write-Output "Generated GO GO SHOP Android and web icons from app-icon-source.png."
