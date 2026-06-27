import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property int count: 3
    property int currentIndex: 0
    signal selected(int index)

    spacing: 7

    Repeater {
        model: root.count

        Rectangle {
            id: dot

            readonly property bool active: root.currentIndex === index

            Layout.preferredWidth: active ? 20 : 7
            Layout.preferredHeight: 7
            radius: height / 2
            antialiasing: true
            color: active ? "#050505" : dotMouse.containsMouse ? "#bfc7d0" : "#dce2e8"

            MouseArea {
                id: dotMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    root.currentIndex = index
                    root.selected(index)
                }
            }

            Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
            Behavior on Layout.preferredWidth { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
        }
    }
}
