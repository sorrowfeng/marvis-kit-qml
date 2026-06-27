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
    property int contentHorizontalPadding: 18

    readonly property bool primaryStyle: root.variant === "primary" || root.accent
    readonly property bool dangerStyle: root.variant === "danger"
    readonly property bool ghostStyle: root.variant === "ghost" || root.quiet

    implicitHeight: 36
    implicitWidth: Math.max(76, buttonContent.implicitWidth + root.contentHorizontalPadding * 2)
    padding: 0
    scale: down ? 0.985 : 1

    MarvisPalette { id: p }

    background: Rectangle {
        radius: root.pill ? height / 2 : 10
        antialiasing: true
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

    contentItem: Item {
        id: buttonContent
        implicitWidth: contentRow.implicitWidth
        implicitHeight: contentRow.implicitHeight

        Row {
            id: contentRow
            anchors.centerIn: parent
            spacing: 8

            Text {
                visible: root.iconText.length > 0
                text: root.iconText
                color: root.primaryStyle || root.dangerStyle ? "#ffffff" : p.muted
                font.pixelSize: 13
                font.weight: Font.DemiBold
                height: Math.max(18, implicitHeight)
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                text: root.text
                color: root.primaryStyle || root.dangerStyle ? "#ffffff" : root.enabled ? p.ink : p.faint
                font.pixelSize: 13
                font.weight: Font.DemiBold
                height: Math.max(18, implicitHeight)
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }

    Behavior on scale { NumberAnimation { duration: 140; easing.type: Easing.OutCubic } }
}
