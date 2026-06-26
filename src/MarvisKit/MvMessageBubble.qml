import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string speaker: "Marvis"
    property string body: ""
    property string meta: ""
    property bool user: false

    implicitWidth: Math.min(560, textBlock.implicitWidth + 32)
    implicitHeight: column.implicitHeight + 26
    radius: 16
    color: user ? "#f8f3f0" : "#ffffff"
    border.width: user ? 0 : 1
    border.color: "#eceff2"

    ColumnLayout {
        id: column
        anchors.fill: parent
        anchors.margins: 14
        spacing: 7

        RowLayout {
            Layout.fillWidth: true
            Text { text: root.speaker; color: "#202124"; font.pixelSize: 12; font.weight: Font.Bold; Layout.fillWidth: true }
            Text { text: root.meta; visible: root.meta.length > 0; color: "#9aa1a9"; font.pixelSize: 10 }
        }

        Text {
            id: textBlock
            text: root.body
            color: "#202124"
            font.pixelSize: 13
            lineHeight: 1.3
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
    }
}
