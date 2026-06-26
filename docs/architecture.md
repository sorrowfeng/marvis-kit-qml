# Architecture

MarvisKit is split into a reusable QML module and a gallery application.

## QML Module

`src/MarvisKit` contains the library. Components should be generic and application-independent. The module is registered as:

```qml
import MarvisKit 1.0
```

The module is built with `qt_add_qml_module`, which produces:

- `MarvisKit`: the backing library
- `MarvisKitplugin`: the QML plugin target

Applications that consume the module statically should link both targets and import the plugin from C++.

## Gallery

`examples/gallery` is a reference desktop app. It demonstrates:

- A frameless Qt Quick window.
- Windows rounded-corner integration through DWM and a rounded `QWindow` mask.
- A Marvis-like app shell with sidebar, title bar, chat screen, composer, preview panel, and control catalog.

Gallery-specific code belongs in `examples/gallery`, not in the reusable module.

## Styling

The visual language is intentionally restrained:

- Gray-white canvas and panels
- Soft borders
- Large rounded corners
- Short, quiet animations
- Black action buttons only for primary commands
- Accent blue for status and selection

Keep new components aligned with these principles unless a future theme system is introduced.
