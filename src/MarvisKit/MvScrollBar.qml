import QtQuick
import QtQuick.Controls

ScrollBar {
    id: root

    implicitWidth: root.orientation === Qt.Vertical ? 10 : 120
    implicitHeight: root.orientation === Qt.Horizontal ? 10 : 120
    padding: 2
    policy: ScrollBar.AsNeeded
    interactive: true

    background: Rectangle {
        radius: 5
        antialiasing: true
        color: root.hovered || root.pressed ? "#f3f5f7" : Qt.rgba(243 / 255, 245 / 255, 247 / 255, 0)
        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }

    contentItem: Rectangle {
        implicitWidth: root.orientation === Qt.Vertical ? 6 : 80
        implicitHeight: root.orientation === Qt.Horizontal ? 6 : 80
        radius: 3
        antialiasing: true
        color: root.pressed ? "#b7c0ca" : root.hovered ? "#cfd6dd" : "#dde2e7"
        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
