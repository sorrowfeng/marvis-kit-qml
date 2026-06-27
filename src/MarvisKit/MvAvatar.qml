import QtQuick

Rectangle {
    id: root

    property url source: ""
    property string initials: "M"
    property int size: 36

    implicitWidth: size
    implicitHeight: size
    radius: size / 2
    antialiasing: true
    color: "#eef1f4"
    clip: true

    Image {
        anchors.fill: parent
        source: root.source
        visible: root.source.toString().length > 0
        fillMode: Image.PreserveAspectCrop
        smooth: true
    }

    Text {
        anchors.centerIn: parent
        visible: root.source.toString().length === 0
        text: root.initials
        color: "#4d5661"
        font.pixelSize: Math.max(11, root.size * 0.38)
        font.weight: Font.Bold
    }
}
