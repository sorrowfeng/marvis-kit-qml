import QtQuick
import QtQuick.Controls

MvButton {
    id: root

    property var options: ["Rename", "Duplicate", "Delete"]
    signal selected(string option)

    text: "Menu"
    iconText: "⌄"

    onClicked: menu.open()

    Menu {
        id: menu
        y: root.height + 4

        Repeater {
            model: root.options
            MenuItem {
                text: modelData
                onTriggered: root.selected(modelData)
            }
        }
    }
}
