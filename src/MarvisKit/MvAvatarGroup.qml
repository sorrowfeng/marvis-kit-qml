import QtQuick

Item {
    id: root

    property var avatars: [
        { text: "M", color: "#edf4ff", foreground: "#2f7cff" },
        { text: "K", color: "#f7f0e8", foreground: "#b86b13" }
    ]
    property int avatarSize: 30
    property int overlap: 10

    implicitWidth: Math.max(root.avatarSize, root.avatars.length * (root.avatarSize - root.overlap) + root.overlap)
    implicitHeight: root.avatarSize

    Repeater {
        model: root.avatars

        Rectangle {
            x: index * (root.avatarSize - root.overlap)
            width: root.avatarSize
            height: root.avatarSize
            radius: root.avatarSize / 2
            antialiasing: true
            color: modelData.color || "#f3f4f6"
            border.width: 2
            border.color: "#ffffff"

            Text {
                anchors.centerIn: parent
                text: modelData.text || "?"
                color: modelData.foreground || "#66707b"
                font.pixelSize: 12
                font.weight: Font.Bold
            }
        }
    }
}
