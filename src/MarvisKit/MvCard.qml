import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string title: ""
    property string subtitle: ""
    property bool interactive: false
    default property alias content: body.data

    implicitHeight: Math.max(96, column.implicitHeight + 34)
    radius: 18
    color: mouse.containsMouse && interactive ? "#ffffff" : "#fdfdfc"
    border.width: 1
    border.color: mouse.containsMouse && interactive ? "#dce3ea" : "#eceff2"
    y: mouse.containsMouse && interactive ? -2 : 0

    Rectangle {
        z: -1
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        radius: root.radius
        color: "#10000000"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: root.interactive
        acceptedButtons: Qt.NoButton
    }

    ColumnLayout {
        id: column
        anchors.fill: parent
        anchors.margins: 18
        spacing: 12

        ColumnLayout {
            visible: root.title.length > 0 || root.subtitle.length > 0
            spacing: 4
            Layout.fillWidth: true

            Text {
                text: root.title
                visible: root.title.length > 0
                color: "#202124"
                font.pixelSize: 16
                font.weight: Font.Bold
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            Text {
                text: root.subtitle
                visible: root.subtitle.length > 0
                color: "#66707b"
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            id: body
            spacing: 10
            Layout.fillWidth: true
        }
    }

    Behavior on y { NumberAnimation { duration: 160; easing.type: Easing.OutCubic } }
    Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
}
