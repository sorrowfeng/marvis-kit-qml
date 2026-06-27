import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    property var options: ["One", "Two"]
    property int currentIndex: 0
    signal selected(int index)

    implicitHeight: 38
    radius: 19
    antialiasing: true
    color: "#f0f2f4"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 3
        spacing: 3

        Repeater {
            model: root.options

            Button {
                id: item
                text: modelData
                padding: 0
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    radius: 16
                    antialiasing: true
                    color: root.currentIndex === index ? "#ffffff" : item.down ? "#eef1f4" : item.hovered ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)
                    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                }

                contentItem: Text {
                    text: item.text
                    color: root.currentIndex === index ? "#202124" : "#737b84"
                    font.pixelSize: 12
                    font.weight: root.currentIndex === index ? Font.Bold : Font.Normal
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                onClicked: {
                    root.currentIndex = index
                    root.selected(index)
                }
            }
        }
    }
}
