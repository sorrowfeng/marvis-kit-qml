import QtQuick

Rectangle {
    id: root

    property string text: ""
    property bool open: false

    implicitWidth: Math.max(180, label.implicitWidth + 36)
    implicitHeight: 44
    radius: 22
    antialiasing: true
    color: "#202124"
    opacity: open ? 1 : 0
    y: open ? 0 : 8

    Text {
        id: label
        anchors.centerIn: parent
        text: root.text
        color: "#ffffff"
        font.pixelSize: 13
    }

    Behavior on opacity { NumberAnimation { duration: 160; easing.type: Easing.OutCubic } }
    Behavior on y { NumberAnimation { duration: 160; easing.type: Easing.OutCubic } }
}
