import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias content: body.data
    property string title: ""
    property string subtitle: ""
    property int inset: 18

    implicitHeight: body.implicitHeight + root.inset * 2
    radius: 20
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"

    ColumnLayout {
        id: body
        anchors.fill: parent
        anchors.margins: root.inset
        spacing: 12

        ColumnLayout {
            visible: root.title.length > 0 || root.subtitle.length > 0
            Layout.fillWidth: true
            spacing: 3

            Text {
                visible: root.title.length > 0
                text: root.title
                color: "#202124"
                font.pixelSize: 14
                font.weight: Font.DemiBold
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                visible: root.subtitle.length > 0
                text: root.subtitle
                color: "#8c939c"
                font.pixelSize: 11
                lineHeight: 1.2
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }
    }
}
