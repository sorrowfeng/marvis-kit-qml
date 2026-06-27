import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string iconText: ""
    property string title: ""
    property string subtitle: ""
    property bool selected: false
    signal clicked()

    implicitHeight: 48
    radius: 10
    antialiasing: true
    color: selected ? "#ecebea" : mouse.containsMouse ? "#f1f3f4" : "transparent"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 10
        spacing: 10

        Text { text: root.iconText; color: "#6f7782"; font.pixelSize: 14; Layout.preferredWidth: 16; horizontalAlignment: Text.AlignHCenter }
        Column {
            Layout.fillWidth: true
            spacing: 3
            Text { text: root.title; color: "#202124"; font.pixelSize: 13; font.weight: root.selected ? Font.Bold : Font.Normal; elide: Text.ElideRight; width: parent.width }
            Text { visible: root.subtitle.length > 0; text: root.subtitle; color: "#8c939c"; font.pixelSize: 11; elide: Text.ElideRight; width: parent.width }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }

    Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
}
