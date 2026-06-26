import QtQuick
import QtQuick.Controls

TextArea {
    id: root

    implicitHeight: 104
    padding: 14
    color: "#202124"
    placeholderTextColor: "#a5abb2"
    selectionColor: "#cfe0ff"
    selectedTextColor: "#202124"
    font.pixelSize: 13
    wrapMode: TextArea.Wrap

    background: Rectangle {
        radius: 14
        color: root.activeFocus ? "#ffffff" : "#f7f8fa"
        border.width: 1
        border.color: root.activeFocus ? "#c8dcff" : "#eceff2"
    }
}
