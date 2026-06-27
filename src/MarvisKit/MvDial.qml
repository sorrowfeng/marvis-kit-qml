import QtQuick
import QtQuick.Controls

Dial {
    id: root

    implicitWidth: 92
    implicitHeight: 92
    from: 0
    to: 100
    value: 50
    stepSize: 1

    background: Item {
        id: dialBackground

        Rectangle {
            id: dialFace
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height) - 8
            height: width
            radius: width / 2
            antialiasing: true
            color: "#ffffff"
            border.width: 1
            border.color: root.pressed ? "#c8dcff" : "#e6ebef"

            Rectangle {
                id: dialNeedle
                width: 4
                height: parent.height / 2 - 13
                radius: 2
                antialiasing: true
                color: "#050505"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 12
                transform: [
                    Rotation {
                        origin.x: dialNeedle.width / 2
                        origin.y: dialFace.height / 2 - dialNeedle.y
                        angle: root.angle
                    }
                ]
            }
        }
    }

    handle: Rectangle {
        id: handleItem

        x: dialBackground.x + dialBackground.width / 2 - width / 2
        y: dialBackground.y + dialBackground.height / 2 - height / 2
        width: 16
        height: 16
        radius: 8
        antialiasing: true
        color: root.pressed ? "#2f7cff" : "#ffffff"
        border.width: 1
        border.color: root.pressed ? "#2f7cff" : "#cfd6dd"
        scale: root.pressed ? 1.08 : 1
        transform: [
            Translate {
                y: -Math.min(dialBackground.width, dialBackground.height) * 0.36 + handleItem.height / 2
            },
            Rotation {
                angle: root.angle
                origin.x: handleItem.width / 2
                origin.y: handleItem.height / 2
            }
        ]

        Behavior on scale { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
