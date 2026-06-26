qt_add_executable(MarvisKitGallery WIN32
    src/AppController.cpp
    src/AppController.h
    src/main.cpp
)

qt_add_qml_module(MarvisKitGallery
    URI MarvisKitGallery
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/TitleBar.qml
        qml/Sidebar.qml
        qml/ChatScreen.qml
        qml/ComposerBar.qml
        qml/LibraryScreen.qml
    RESOURCES
        assets/ambient-bg.png
        assets/cover-pc.png
        assets/marvis-avatar.png
)

target_link_libraries(MarvisKitGallery
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
        MarvisKit
        MarvisKitplugin
)

if(WIN32)
    target_link_libraries(MarvisKitGallery PRIVATE Dwmapi)
endif()

qt_import_qml_plugins(MarvisKitGallery)

target_compile_definitions(MarvisKitGallery
    PRIVATE
        QT_NO_KEYWORDS
)
