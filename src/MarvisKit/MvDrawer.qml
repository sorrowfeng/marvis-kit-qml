import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: root

    default property alias content: body.data
    property string title: ""
    property string edge: "right"
    property real overlayInset: 8
    property real overlayRadius: 36
    property color overlayColor: "#33000000"
    readonly property real visibleX: edge === "right" && parent ? parent.width - width - overlayInset : overlayInset
    readonly property real hiddenX: edge === "right" && parent ? parent.width - overlayInset : overlayInset - width

    modal: true
    dim: true
    focus: true
    width: 360
    height: parent ? Math.max(0, parent.height - overlayInset * 2) : 640
    x: visibleX
    y: parent ? overlayInset : 0
    padding: 0
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    Overlay.modal: Rectangle {
        anchors.fill: parent
        anchors.margins: root.overlayInset
        radius: root.overlayRadius
        antialiasing: true
        color: root.overlayColor
    }

    enter: Transition {
        NumberAnimation { property: "x"; from: root.hiddenX; to: root.visibleX; duration: 220; easing.type: Easing.OutCubic }
        NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 160; easing.type: Easing.OutCubic }
    }

    exit: Transition {
        NumberAnimation { property: "x"; from: root.visibleX; to: root.hiddenX; duration: 180; easing.type: Easing.InCubic }
        NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 130; easing.type: Easing.InCubic }
    }

    background: Rectangle {
        color: "#ffffff"
        border.width: 1
        border.color: "#e6ebef"
        antialiasing: true
        radius: 0
        topLeftRadius: root.edge === "left" ? root.overlayRadius : 0
        bottomLeftRadius: root.edge === "left" ? root.overlayRadius : 0
        topRightRadius: root.edge === "right" ? root.overlayRadius : 0
        bottomRightRadius: root.edge === "right" ? root.overlayRadius : 0
    }

    contentItem: ColumnLayout {
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 58
            Layout.leftMargin: 18
            Layout.rightMargin: 14
            spacing: 8

            Text {
                text: root.title
                color: "#202124"
                font.pixelSize: 15
                font.weight: Font.Bold
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            MvIconButton {
                iconText: "×"
                onClicked: root.close()
            }
        }

        Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 1; color: "#eceff2" }

        ColumnLayout {
            id: body
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 18
            spacing: 12
        }
    }
}
