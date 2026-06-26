import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: root

    property string iconText: ""
    property string variant: "secondary"
    property bool accent: false
    property bool quiet: false
    property bool pill: true

    readonly property bool primaryStyle: root.variant === "primary" || root.accent
    readonly property bool dangerStyle: root.variant === "danger"
    readonly property bool ghostStyle: root.variant === "ghost" || root.quiet

    implicitHeight: 36
    implicitWidth: Math.max(76, contentRow.implicitWidth + 30)
    padding: 0
    scale: down ? 0.97 : hovered ? 1.015 : 1

    MarvisPalette { id: p }

    background: Rectangle {
        radius: root.pill ? height / 2 : 10
        color: {
            if (!root.enabled) return "#f0f1f2"
            if (root.primaryStyle) return root.down ? "#151515" : p.action
            if (root.dangerStyle) return root.down ? "#c9363b" : p.danger
            if (root.ghostStyle) return root.hovered || root.down ? p.hover : "transparent"
            return root.down ? "#e9ecef" : root.hovered ? "#f7f8fa" : p.panel
        }
        border.width: root.primaryStyle || root.dangerStyle || root.ghostStyle ? 0 : 1
        border.color: p.line
        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }

    contentItem: RowLayout {
        id: contentRow
        anchors.centerIn: parent
        spacing: 8

        Text {
            visible: root.iconText.length > 0
            text: root.iconText
            color: root.primaryStyle || root.dangerStyle ? "#ffffff" : p.muted
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Text {
            text: root.text
            color: root.primaryStyle || root.dangerStyle ? "#ffffff" : root.enabled ? p.ink : p.faint
            font.pixelSize: 13
            font.weight: Font.DemiBold
            elide: Text.ElideRight
        }
    }

    Behavior on scale { NumberAnimation { duration: 140; easing.type: Easing.OutCubic } }
}
