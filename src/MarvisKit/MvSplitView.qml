import QtQuick
import QtQuick.Controls

SplitView {
    id: root

    orientation: Qt.Horizontal

    handle: Rectangle {
        implicitWidth: root.orientation === Qt.Horizontal ? 10 : 80
        implicitHeight: root.orientation === Qt.Vertical ? 10 : 80
        color: SplitHandle.pressed ? "#e7ebef" : SplitHandle.hovered ? "#f3f5f7" : Qt.rgba(243 / 255, 245 / 255, 247 / 255, 0)

        Rectangle {
            anchors.centerIn: parent
            width: root.orientation === Qt.Horizontal ? 2 : 34
            height: root.orientation === Qt.Horizontal ? 34 : 2
            radius: 1
            antialiasing: true
            color: SplitHandle.pressed ? "#9aa4ae" : SplitHandle.hovered ? "#b8c0c8" : "#d4dbe2"
        }

        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
