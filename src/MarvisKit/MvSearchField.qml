import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    property alias text: input.text
    property alias placeholderText: input.placeholderText

    implicitHeight: 38
    radius: 10
    antialiasing: true
    color: input.activeFocus ? "#ffffff" : "#f7f8fa"
    border.width: 1
    border.color: input.activeFocus ? "#c8dcff" : "#eceff2"
    Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
    Behavior on border.color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 10
        spacing: 8

        Text {
            text: "⌕"
            color: "#707781"
            font.pixelSize: 13
        }

        TextField {
            id: input
            placeholderText: "Search"
            color: "#202124"
            placeholderTextColor: "#8d949e"
            font.pixelSize: 12
            background: Item {}
            padding: 0
            Layout.fillWidth: true
        }
    }
}
