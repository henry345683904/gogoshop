# GO GO SHOP Manager for Windows

Private desktop manager for the GO GO SHOP storefront and admin console.

The app opens the live website at `https://gogoshop.nz` and uses a separate persistent login session. This means website and Supabase updates remain available without rebuilding the application.

## Build

From this folder:

```powershell
pnpm install
pnpm run build
```

The installer and portable executable are written to `dist/`.

## Use

- Start the app and sign in with the existing administrator password.
- Use the top `GO GO SHOP` menu to switch between Admin and Storefront.
- Use `Check for website updates` after a website deployment.

The app is intended for the store owner only and is not a public customer application.
