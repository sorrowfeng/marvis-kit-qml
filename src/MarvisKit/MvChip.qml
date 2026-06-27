import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string text: ""
    property bool selected: false
    property bool removable: false
    property string variant: "neutral"
    signal clicked()
    signal removed()

    readonly property color baseColor: {
        if (root.variant === "accent") return "#edf4ff"
        if (root.variant === "success") return "#eaf8f2"
        if (root.variant === "warning") return "#fff4e4"
        if (root.variant === "danger") return "#fff0f0"
        return "#f3f4f6"
    }
    readonly property color activeColor: {
        if (root.variant === "accent") return "#dfeaff"
        if (root.variant === "success") return "#d9f1e7"
        if (root.variant === "warning") return "#ffe8c2"
        if (root.variant === "danger") return "#ffe0e0"
        return "#e9ecef"
    }
    readonly property color textColor: {
        if (root.variant === "accent") return "#2f7cff"
        if (root.variant === "success") return "#16885e"
        if (root.variant === "warning") return "#b86b13"
        if (root.variant === "danger") return "#d34242"
        return "#66707b"
    }

    implicitWidth: row.implicitWidth + 18
    implicitHeight: 30
    radius: 15
    antialiasing: true
    color: mouse.pressed || root.selected ? root.activeColor : mouse.containsMouse ? "#f7f8fa" : root.baseColor
    border.width: root.selected ? 1 : 0
    border.color: root.textColor
    scale: mouse.pressed ? 0.985 : 1

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 7

        Text {
            text: root.text
            color: root.textColor
            font.pixelSize: 12
            font.weight: root.selected ? Font.DemiBold : Font.Normal
        }

        Text {
            visible: root.removable
            text: "×"
            color: root.textColor
            font.pixelSize: 13
            font.weight: Font.Bold
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if (root.removable && mouse.x > root.width - 28) {
                root.removed()
            } else {
                root.selected = !root.selected
                root.clicked()
            }
        }
    }

    Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
    Behavior on scale { NumberAnimation { duration: 110; easing.type: Easing.OutCubic } }
}
