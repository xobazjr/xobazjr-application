# xobazjr_application

Flutter application with a web build configured for Vercel.

## Deploy to Vercel

Import this GitHub repository in Vercel and set the **Root Directory** to
`xobazjr_application`. The checked-in `vercel.json` installs the pinned Flutter
SDK, builds the web app, serves `build/web`, and routes client-side paths to
Flutter's `index.html`.

The web build currently has no external service credentials or environment
variables configured. Add Vercel environment variables if the app starts using
private services or build-time configuration.

## Local development

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter web deployment](https://docs.flutter.dev/deployment/web)
