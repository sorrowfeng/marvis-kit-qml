import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property int value: 0
    property int from: 0
    property int to: 100
    property int step: 1
    property string suffix: ""
    signal valueChangedByUser(int value)

    function clamp(nextValue) {
        return Math.max(root.from, Math.min(root.to, nextValue))
    }

    implicitWidth: 150
    implicitHeight: 38
    radius: 19
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#e5e9ed"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 3
        spacing: 3

        StepButton {
            label: "−"
            enabled: root.value > root.from
            onClicked: {
                root.value = root.clamp(root.value - root.step)
                root.valueChangedByUser(root.value)
            }
        }

        Text {
            text: root.value + root.suffix
            color: "#202124"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
        }

        StepButton {
            label: "+"
            enabled: root.value < root.to
            onClicked: {
                root.value = root.clamp(root.value + root.step)
                root.valueChangedByUser(root.value)
            }
        }
    }

    Behavior on border.color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }

    component StepButton: Rectangle {
        id: button

        property string label: ""
        signal clicked()

        Layout.preferredWidth: 32
        Layout.fillHeight: true
        radius: 16
        antialiasing: true
        color: !enabled ? Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0) : mouse.pressed ? "#e7ebef" : mouse.containsMouse ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)

        Text {
            anchors.centerIn: parent
            text: button.label
            color: button.enabled ? "#202124" : "#b5bbc2"
            font.pixelSize: 16
            font.weight: Font.DemiBold
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            enabled: button.enabled
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: button.clicked()
        }

        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
