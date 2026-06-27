import QtQuick

Item {
    id: root

    property bool running: true
    property color color: "#2f7cff"

    implicitWidth: 24
    implicitHeight: 24

    Rectangle {
        width: 20
        height: 20
        radius: 10
        antialiasing: true
        anchors.centerIn: parent
        color: "transparent"
        border.width: 3
        border.color: "#dce8ff"
    }

    Rectangle {
        width: 8
        height: 8
        radius: 4
        antialiasing: true
        color: root.color
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
    }

    RotationAnimator on rotation {
        running: root.running
        from: 0
        to: 360
        duration: 900
        loops: Animation.Infinite
    }
}
