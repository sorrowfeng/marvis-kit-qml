import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias content: body.data
    property string title: ""
    property string subtitle: ""
    property int inset: 14

    implicitHeight: group.implicitHeight + root.inset * 2
    radius: 16
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#e6ebef"

    ColumnLayout {
        id: group
        anchors.fill: parent
        anchors.margins: root.inset
        spacing: 10

        ColumnLayout {
            visible: root.title.length > 0 || root.subtitle.length > 0
            Layout.fillWidth: true
            spacing: 2

            Text {
                visible: root.title.length > 0
                text: root.title
                color: "#202124"
                font.pixelSize: 13
                font.weight: Font.DemiBold
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            Text {
                visible: root.subtitle.length > 0
                text: root.subtitle
                color: "#8c939c"
                font.pixelSize: 11
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            id: body
            Layout.fillWidth: true
            spacing: 8
        }
    }
}
