import QtQuick
import QtQuick.Controls

Slider {
    id: root

    implicitHeight: 32
    from: 0
    to: 100
    value: 50

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: root.availableWidth
        height: 6
        radius: 3
        color: "#dde2e7"

        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            radius: 3
            color: "#050505"
        }
    }

    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: 20
        height: 20
        radius: 10
        color: "#ffffff"
        border.width: 1
        border.color: "#cfd6dd"
    }
}
