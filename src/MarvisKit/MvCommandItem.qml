import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string iconText: ""
    property string title: ""
    property string subtitle: ""
    property var shortcut: []
    property bool selected: false
    signal triggered()

    implicitHeight: 54
    radius: 12
    antialiasing: true
    color: selected ? "#edf4ff" : mouse.pressed ? "#e7ebef" : mouse.containsMouse ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        Text {
            text: root.iconText
            color: root.selected ? "#2f7cff" : "#66707b"
            font.pixelSize: 15
            Layout.preferredWidth: 20
            horizontalAlignment: Text.AlignHCenter
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 2
            Text { text: root.title; color: "#202124"; font.pixelSize: 13; font.weight: Font.DemiBold; Layout.fillWidth: true; elide: Text.ElideRight }
            Text { visible: root.subtitle.length > 0; text: root.subtitle; color: "#8c939c"; font.pixelSize: 11; Layout.fillWidth: true; elide: Text.ElideRight }
        }

        MvShortcut {
            visible: root.shortcut.length > 0
            keys: root.shortcut
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.triggered()
    }

    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
}
