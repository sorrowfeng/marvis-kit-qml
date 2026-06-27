import QtQuick

Rectangle {
    id: root

    property alias text: label.text
    property color fill: "#f3f4f6"
    property color foreground: "#66707b"

    implicitWidth: Math.max(40, label.implicitWidth + 16)
    implicitHeight: 24
    radius: 12
    antialiasing: true
    color: fill

    Text {
        id: label
        anchors.centerIn: parent
        color: foreground
        font.pixelSize: 11
        font.weight: Font.DemiBold
        elide: Text.ElideRight
        maximumLineCount: 1
    }
}
