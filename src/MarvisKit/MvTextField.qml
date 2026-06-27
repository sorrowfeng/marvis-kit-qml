import QtQuick
import QtQuick.Controls

TextField {
    id: root

    implicitHeight: 40
    leftPadding: 14
    rightPadding: 14
    color: "#202124"
    placeholderTextColor: "#a5abb2"
    selectionColor: "#cfe0ff"
    selectedTextColor: "#202124"
    font.pixelSize: 13

    background: Rectangle {
        radius: 12
        antialiasing: true
        color: root.activeFocus ? "#ffffff" : "#f7f8fa"
        border.width: 1
        border.color: root.activeFocus ? "#c8dcff" : "#eceff2"
        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
        Behavior on border.color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }
}
