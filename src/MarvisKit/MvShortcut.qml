import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property var keys: []

    spacing: 4

    Repeater {
        model: root.keys

        Rectangle {
            Layout.preferredWidth: Math.max(24, label.implicitWidth + 12)
            Layout.preferredHeight: 24
            radius: 6
            antialiasing: true
            color: "#f3f4f6"
            border.width: 1
            border.color: "#e1e6eb"

            Text {
                id: label
                anchors.centerIn: parent
                text: modelData
                color: "#66707b"
                font.pixelSize: 11
                font.weight: Font.DemiBold
            }
        }
    }
}
