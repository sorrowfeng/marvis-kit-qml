import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string title: ""
    property string subtitle: ""
    property string iconText: "□"
    property int depth: 0
    property bool expanded: false
    property bool selected: false
    property bool hasChildren: false
    signal clicked()
    signal toggled(bool expanded)

    implicitHeight: subtitle.length > 0 ? 46 : 34
    radius: 10
    antialiasing: true
    color: selected ? "#edf4ff" : mouse.pressed ? "#e7ebef" : mouse.containsMouse ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10 + root.depth * 18
        anchors.rightMargin: 10
        spacing: 8

        Text {
            text: root.hasChildren ? "⌄" : ""
            rotation: root.expanded ? 0 : -90
            color: "#9aa1a9"
            font.pixelSize: 11
            Layout.preferredWidth: 12
            horizontalAlignment: Text.AlignHCenter
            Behavior on rotation { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
        }

        Text {
            text: root.iconText
            color: root.selected ? "#2f7cff" : "#66707b"
            font.pixelSize: 13
            Layout.preferredWidth: 16
            horizontalAlignment: Text.AlignHCenter
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 1
            Text { text: root.title; color: "#202124"; font.pixelSize: 12; font.weight: root.selected ? Font.DemiBold : Font.Normal; Layout.fillWidth: true; elide: Text.ElideRight }
            Text { visible: root.subtitle.length > 0; text: root.subtitle; color: "#8c939c"; font.pixelSize: 10; Layout.fillWidth: true; elide: Text.ElideRight }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if (root.hasChildren) {
                root.expanded = !root.expanded
                root.toggled(root.expanded)
            }
            root.clicked()
        }
    }

    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
}
