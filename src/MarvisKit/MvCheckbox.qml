import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property bool checked: false
    property string text: ""
    signal toggled(bool checked)

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
            radius: 5
            antialiasing: true
            Layout.alignment: Qt.AlignVCenter
            color: root.checked ? "#050505" : "#ffffff"
            border.width: 1
            border.color: root.checked ? "#050505" : "#d8dee4"
            Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
            Behavior on border.color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }

            Text {
                anchors.centerIn: parent
                text: "✓"
                visible: root.checked
                color: "#ffffff"
                font.pixelSize: 12
                font.weight: Font.Bold
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
            root.checked = !root.checked
            root.toggled(root.checked)
        }
    }
}
