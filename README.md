# MarvisKit QML

MarvisKit QML is an unofficial Qt Quick/QML control library for building quiet, rounded, low-saturation desktop interfaces inspired by Marvis-style desktop product UI.

This project is not affiliated with Tencent or the official Marvis product. It is a standalone open-source UI kit and gallery example.

## Features

- Native Qt Quick controls with a soft gray-white desktop visual language.
- Reusable QML module: `import MarvisKit 1.0`.
- Gallery app that demonstrates a Marvis-like desktop shell, sidebar, chat surface, document preview, and component catalog.
- Controls for normal desktop applications: buttons, icon buttons, text fields, text areas, search fields, panels, cards, badges, toggles, checkbox/radio controls, sliders, segmented controls, combo boxes, tabs, progress, spinner, toast, dialog, table, toolbar, menu button, list items, breadcrumbs, avatars, and status dots.
- Windows gallery chrome with transparent background, rounded window mask, and DWM rounded-corner preference.

## Requirements

- Qt 6.9 or newer
- CMake 3.24 or newer
- A C++20 compiler

## Build

```powershell
cmake -S . -B build -DMARVIS_KIT_BUILD_EXAMPLES=ON
cmake --build build --config Release
```

On Windows with a local Qt install:

```powershell
& "C:\Qt\6.9.1\msvc2022_64\bin\qt-cmake.bat" -S . -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

Run the gallery:

```powershell
.\build\Release\MarvisKitGallery.exe
.\build\Release\MarvisKitGallery.exe --kit
```

## Use In Your App

Add the library directory from CMake:

```cmake
add_subdirectory(path/to/marvis-kit-qml/src/MarvisKit)

target_link_libraries(YourApp
    PRIVATE
        MarvisKit
        MarvisKitplugin
)

qt_import_qml_plugins(YourApp)
```

For static QML plugin imports, add this in your app entry point:

```cpp
#include <QtQml/qqmlextensionplugin.h>

Q_IMPORT_QML_PLUGIN(MarvisKitPlugin)
```

Then import the module in QML:

```qml
import MarvisKit 1.0 as Kit

Kit.MvButton {
    text: "Open"
    accent: true
}
```

## Repository Layout

```text
src/MarvisKit/          Reusable QML control module
examples/gallery/       Desktop gallery app and Marvis-like shell
docs/                   Usage, component, and architecture notes
.github/workflows/      CI build workflow
```

## Documentation

- [Getting Started](docs/getting-started.md)
- [Components](docs/components.md)
- [Architecture](docs/architecture.md)

## License

MIT. See [LICENSE](LICENSE).
