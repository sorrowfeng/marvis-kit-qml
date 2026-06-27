import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property color swatchColor: "#2f7cff"
    property string label: ""
    property bool selected: false
    signal clicked(color swatchColor)

    implicitWidth: 96
    implicitHeight: 38
    radius: 12
    antialiasing: true
    color: mouse.pressed ? "#e7ebef" : mouse.containsMouse || selected ? "#f7f8fa" : "#ffffff"
    border.width: selected ? 1 : 0
    border.color: "#cfe0ff"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 8

        Rectangle {
            width: 18
            height: 18
            radius: 9
            antialiasing: true
            color: root.swatchColor
        }

        Text {
            text: root.label
            color: "#343a43"
            font.pixelSize: 12
            Layout.fillWidth: true
            elide: Text.ElideRight
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked(root.swatchColor)
    }

    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
}
