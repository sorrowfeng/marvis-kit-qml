# Getting Started

MarvisKit is distributed as a CMake-based QML module. The simplest integration path is to vendor this repository and add `src/MarvisKit` from your application CMake project.

## Build The Gallery

```powershell
cmake -S . -B build -DMARVIS_KIT_BUILD_EXAMPLES=ON
cmake --build build --config Release
```

The gallery executable is `MarvisKitGallery`.

Use `--kit` to open the component catalog page directly:

```powershell
.\build\Release\MarvisKitGallery.exe --kit
```

## Add The QML Module

```cmake
add_subdirectory(path/to/marvis-kit-qml/src/MarvisKit)

target_link_libraries(YourApp
    PRIVATE
        MarvisKit
        MarvisKitplugin
)

qt_import_qml_plugins(YourApp)
```

If your application links QML modules statically, import the plugin in C++:

```cpp
#include <QtQml/qqmlextensionplugin.h>

Q_IMPORT_QML_PLUGIN(MarvisKitPlugin)
```

## Import From QML

```qml
import MarvisKit 1.0 as Kit

Kit.MvPanel {
    title: "Settings"
    subtitle: "Desktop controls with a soft MarvisKit style."

    Kit.MvButton {
        text: "Save"
        accent: true
    }
}
```
