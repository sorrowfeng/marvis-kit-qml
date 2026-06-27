import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    property var tabs: ["Overview", "Details"]
    property int currentIndex: 0
    signal selected(int index)

    spacing: 4

    Repeater {
        model: root.tabs

        Button {
            id: tab
            text: modelData
            padding: 0
            Layout.preferredHeight: 34
            Layout.preferredWidth: Math.max(72, label.implicitWidth + 24)

            background: Rectangle {
                radius: 10
                antialiasing: true
                color: root.currentIndex === index ? "#edf4ff" : tab.down ? "#e7ebef" : tab.hovered ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)
                Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
            }

            contentItem: Text {
                id: label
                text: tab.text
                color: root.currentIndex === index ? "#2f7cff" : "#66707b"
                font.pixelSize: 13
                font.weight: root.currentIndex === index ? Font.Bold : Font.Normal
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                root.currentIndex = index
                root.selected(index)
            }
        }
    }
}
