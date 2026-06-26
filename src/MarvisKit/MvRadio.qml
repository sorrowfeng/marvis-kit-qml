import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property bool checked: false
    property string text: ""
    signal selected()

    implicitWidth: row.implicitWidth
    implicitHeight: 24

    RowLayout {
        id: row
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 9

        Rectangle {
            width: 18
            height: 18
            radius: 9
            Layout.alignment: Qt.AlignVCenter
            color: "#ffffff"
            border.width: 1
            border.color: root.checked ? "#050505" : "#d8dee4"

            Rectangle {
                width: 8
                height: 8
                radius: 4
                anchors.centerIn: parent
                visible: root.checked
                color: "#050505"
            }
        }

        Text {
            text: root.text
            color: "#343a43"
            font.pixelSize: 13
            Layout.alignment: Qt.AlignVCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.checked = true
            root.selected()
        }
    }
}
