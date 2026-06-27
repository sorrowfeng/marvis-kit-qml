import QtQuick
import QtQuick.Controls

Button {
    id: root

    property string iconText: ""
    property bool selected: false

    implicitWidth: 32
    implicitHeight: 32
    padding: 0
    scale: down ? 0.96 : 1

    MarvisPalette { id: p }

    background: Rectangle {
        radius: height / 2
        antialiasing: true
        color: root.selected ? p.accentSoft : root.hovered ? p.hover : "transparent"
        border.width: root.selected ? 1 : 0
        border.color: "#cfe0ff"
        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }

    contentItem: Text {
        text: root.iconText
        color: root.selected ? p.accent : p.muted
        font.pixelSize: 14
        font.weight: Font.DemiBold
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Behavior on scale { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
}
