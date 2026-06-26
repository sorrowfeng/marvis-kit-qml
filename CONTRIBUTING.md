# Contributing

Thanks for helping improve MarvisKit QML.

## Development

1. Install Qt 6.9 or newer and CMake 3.24 or newer.
2. Configure the project with `MARVIS_KIT_BUILD_EXAMPLES=ON`.
3. Build the gallery before opening a pull request.
4. Keep new controls small, composable, and consistent with the existing palette.

## Control Guidelines

- Prefer QML-only controls unless C++ is needed for native window or platform integration.
- Keep component APIs predictable: `text`, `title`, `subtitle`, `iconText`, `selected`, `checked`, and `clicked` should behave consistently.
- Use restrained color and motion. Animations should feel fast and quiet.
- Avoid app-specific logic in `src/MarvisKit`; put app behavior in `examples/gallery`.

## Pull Requests

- Include a short summary of the visual or behavioral change.
- Mention any new component API.
- Add or update gallery usage when adding a control.
- Run a local build before submitting.
