import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property string text: ""
    property color color: "#12a174"

    spacing: 7

    Rectangle {
        width: 7
        height: 7
        radius: 4
        antialiasing: true
        color: root.color
        Layout.alignment: Qt.AlignVCenter
    }

    Text {
        text: root.text
        color: "#66707b"
        font.pixelSize: 12
        Layout.alignment: Qt.AlignVCenter
    }
}
