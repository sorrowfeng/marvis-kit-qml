import QtQuick
import QtQuick.Controls

RangeSlider {
    id: root

    implicitHeight: 34
    from: 0
    to: 100
    first.value: 25
    second.value: 75
    stepSize: 1

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: root.availableWidth
        height: 6
        radius: 3
        antialiasing: true
        color: "#dde2e7"

        Rectangle {
            x: root.first.visualPosition * parent.width
            width: Math.max(0, root.second.visualPosition * parent.width - x)
            height: parent.height
            radius: 3
            antialiasing: true
            color: "#050505"
            Behavior on x { NumberAnimation { duration: 90; easing.type: Easing.OutCubic } }
            Behavior on width { NumberAnimation { duration: 90; easing.type: Easing.OutCubic } }
        }
    }

    first.handle: Rectangle {
        x: root.leftPadding + root.first.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: 20
        height: 20
        radius: 10
        antialiasing: true
        color: root.first.pressed ? "#f7f8fa" : "#ffffff"
        border.width: 1
        border.color: root.first.pressed ? "#9fbfff" : "#cfd6dd"
        scale: root.first.pressed ? 1.05 : 1
        Behavior on scale { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }

    second.handle: Rectangle {
        x: root.leftPadding + root.second.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: 20
        height: 20
        radius: 10
        antialiasing: true
        color: root.second.pressed ? "#f7f8fa" : "#ffffff"
        border.width: 1
        border.color: root.second.pressed ? "#9fbfff" : "#cfd6dd"
        scale: root.second.pressed ? 1.05 : 1
        Behavior on scale { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
