import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string title: ""
    property string message: ""
    property string actionText: ""
    property string tone: "info"
    signal actionClicked()
    signal dismissed()

    readonly property color toneColor: tone === "success" ? "#12a174" : tone === "warning" ? "#d9851f" : tone === "danger" ? "#e5484d" : "#2f7cff"

    implicitHeight: Math.max(72, content.implicitHeight + 24)
    radius: 16
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"

    RowLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 14
        spacing: 12

        Rectangle {
            width: 9
            height: 38
            radius: 5
            antialiasing: true
            color: root.toneColor
            Layout.alignment: Qt.AlignVCenter
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 3
            Text { text: root.title; color: "#202124"; font.pixelSize: 13; font.weight: Font.DemiBold; Layout.fillWidth: true; elide: Text.ElideRight }
            Text { text: root.message; color: "#66707b"; font.pixelSize: 12; wrapMode: Text.WordWrap; Layout.fillWidth: true }
        }

        Text {
            visible: root.actionText.length > 0
            text: root.actionText
            color: root.toneColor
            font.pixelSize: 12
            font.weight: Font.DemiBold

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: root.actionClicked()
            }
        }

        Rectangle {
            width: 28
            height: 28
            radius: 14
            antialiasing: true
            color: closeMouse.pressed ? "#e7ebef" : closeMouse.containsMouse ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)

            Text { anchors.centerIn: parent; text: "×"; color: "#8c939c"; font.pixelSize: 13; font.weight: Font.Bold }

            MouseArea {
                id: closeMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.dismissed()
            }

            Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
        }
    }
}
