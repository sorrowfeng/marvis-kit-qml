import QtQuick
import QtQuick.Controls

Popup {
    id: root

    property string text: ""

    padding: 9
    modal: false
    focus: false
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    transformOrigin: Item.Top

    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 120; easing.type: Easing.OutCubic }
        NumberAnimation { property: "scale"; from: 0.98; to: 1; duration: 120; easing.type: Easing.OutCubic }
    }

    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 80; easing.type: Easing.OutCubic }
        NumberAnimation { property: "scale"; from: 1; to: 0.98; duration: 80; easing.type: Easing.OutCubic }
    }

    background: Rectangle {
        radius: 12
        antialiasing: true
        color: "#202124"
    }

    contentItem: Text {
        text: root.text
        color: "#ffffff"
        font.pixelSize: 12
        wrapMode: Text.WordWrap
    }
}
