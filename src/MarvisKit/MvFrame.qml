import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias content: body.data
    property int inset: 14
    property bool interactive: false

    implicitHeight: Math.max(52, body.implicitHeight + root.inset * 2)
    radius: 16
    antialiasing: true
    color: frameMouse.pressed && root.interactive ? "#f0f2f4" : frameMouse.containsMouse && root.interactive ? "#f7f8fa" : "#ffffff"
    border.width: 1
    border.color: frameMouse.containsMouse && root.interactive ? "#dce3ea" : "#eceff2"

    ColumnLayout {
        id: body
        anchors.fill: parent
        anchors.margins: root.inset
        spacing: 8
    }

    MouseArea {
        id: frameMouse
        anchors.fill: parent
        enabled: root.interactive
        hoverEnabled: root.interactive
        acceptedButtons: Qt.NoButton
    }

    Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
    Behavior on border.color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
}
