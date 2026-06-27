import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias content: contentColumn.data
    property string title: ""
    property string subtitle: ""
    property bool expanded: false
    signal toggled(bool expanded)

    implicitHeight: header.height + contentFrame.height + 2
    radius: 16
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: root.expanded ? "#dbe6f5" : "#eceff2"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            id: header
            Layout.fillWidth: true
            height: Math.max(50, titleColumn.implicitHeight + 18)

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 16
                anchors.rightMargin: 14
                spacing: 12

                ColumnLayout {
                    id: titleColumn
                    Layout.fillWidth: true
                    spacing: 2

                    Text {
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
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }
                }

                Text {
                    text: "⌄"
                    color: "#737b84"
                    font.pixelSize: 14
                    rotation: root.expanded ? 180 : 0
                    Behavior on rotation { NumberAnimation { duration: 160; easing.type: Easing.OutCubic } }
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    root.expanded = !root.expanded
                    root.toggled(root.expanded)
                }
            }
        }

        Item {
            id: contentFrame
            Layout.fillWidth: true
            height: root.expanded ? contentColumn.implicitHeight + 14 : 0
            clip: true

            ColumnLayout {
                id: contentColumn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                spacing: 10
            }

            Behavior on height { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
        }
    }

    Behavior on border.color { ColorAnimation { duration: 150; easing.type: Easing.OutCubic } }
}
