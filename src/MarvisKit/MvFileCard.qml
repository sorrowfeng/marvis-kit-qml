import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string title: ""
    property string subtitle: ""
    property string iconText: "□"
    property string fileType: ""
    property color accentColor: "#2f7cff"
    property bool selected: false
    signal clicked()

    implicitHeight: 64
    radius: 12
    color: root.selected ? "#edf4ff" : mouse.containsMouse ? "#eeeeed" : "#f5f5f4"
    border.width: root.selected ? 1 : 0
    border.color: "#cfe0ff"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 12

        Rectangle {
            width: 38
            height: 38
            radius: 10
            color: "#e7f1ff"
            Text {
                anchors.centerIn: parent
                text: root.fileType.length > 0 ? root.fileType : root.iconText
                color: root.accentColor
                font.pixelSize: root.fileType.length > 0 ? 11 : 16
                font.weight: Font.Bold
            }
        }

        Column {
            spacing: 3
            Layout.fillWidth: true
            Text { text: root.title; color: "#202124"; font.pixelSize: 13; font.weight: Font.DemiBold; elide: Text.ElideRight; width: parent.width }
            Text { text: root.subtitle; color: "#8c939c"; font.pixelSize: 11; elide: Text.ElideRight; width: parent.width }
        }

        Text { text: "···"; color: "#202124"; font.pixelSize: 17; font.weight: Font.Bold }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
