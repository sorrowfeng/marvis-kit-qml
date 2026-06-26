import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    property bool fileSelected: false
    signal submitted(string text)

    implicitHeight: 62
    radius: 24
    color: "#ffffff"
    border.width: 0

    Rectangle {
        z: -1
        anchors.fill: parent
        anchors.topMargin: 8
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        radius: root.radius
        color: "#12000000"
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 12
        spacing: 12

        Rectangle {
            id: fileButton
            Layout.preferredWidth: 88
            Layout.preferredHeight: 36
            radius: 18
            color: fileSelected ? "#edf4ff" : fileMouse.containsMouse ? "#eceff2" : "#f5f6f6"

            Row {
                anchors.centerIn: parent
                spacing: 6

                Text { text: fileSelected ? "✓" : "⌕"; color: fileSelected ? "#2f7cff" : "#59616c"; font.pixelSize: 14 }
                Text { text: fileSelected ? "已选择" : "选择文件"; color: fileSelected ? "#2f7cff" : "#66707b"; font.pixelSize: 12 }
            }

            MouseArea {
                id: fileMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.fileSelected = !root.fileSelected
            }

            Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
        }

        TextField {
            id: editor
            placeholderText: "请输入你的需求，按 Enter 发送"
            placeholderTextColor: "#a5abb2"
            color: "#202124"
            font.pixelSize: 13
            background: Item {}
            padding: 0
            Layout.fillWidth: true
            onAccepted: root.submitted(text)
        }

        Text {
            text: "⌕"
            color: "#5c636d"
            font.pixelSize: 20
        }

        Rectangle {
            width: 44
            height: 44
            radius: 22
            color: "#dedede"
            scale: sendMouse.pressed ? 0.94 : sendMouse.containsMouse ? 1.04 : 1

            Text {
                anchors.centerIn: parent
                text: "➤"
                color: "#ffffff"
                font.pixelSize: 17
                rotation: -28
            }

            MouseArea {
                id: sendMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.submitted(editor.text)
            }

            Behavior on scale { NumberAnimation { duration: 140; easing.type: Easing.OutCubic } }
        }
    }
}
