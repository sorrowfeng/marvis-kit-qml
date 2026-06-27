import QtQuick

Item {
    id: root

    property bool checked: false
    signal toggled(bool checked)

    implicitWidth: 48
    implicitHeight: 28

    Rectangle {
        anchors.fill: parent
        radius: height / 2
        antialiasing: true
        color: root.checked ? "#050505" : "#dde2e7"
        Behavior on color { ColorAnimation { duration: 150; easing.type: Easing.OutCubic } }
    }

    Rectangle {
        width: 22
        height: 22
        radius: 11
        antialiasing: true
        x: root.checked ? root.width - width - 3 : 3
        y: 3
        color: "#ffffff"
        Behavior on x { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.checked = !root.checked
            root.toggled(root.checked)
        }
    }
}
