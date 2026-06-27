import QtQuick

Rectangle {
    id: root

    property real value: 0.42
    property string text: ""

    implicitHeight: 10
    radius: 5
    antialiasing: true
    color: "#dde2e7"
    clip: true

    Rectangle {
        width: Math.max(0, Math.min(1, root.value)) * root.width
        height: parent.height
        radius: parent.radius
        antialiasing: true
        color: "#050505"
        Behavior on width { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
    }
}
