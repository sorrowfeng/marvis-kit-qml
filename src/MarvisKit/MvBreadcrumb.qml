import QtQuick

Row {
    id: root

    property var items: ["Home", "Page"]
    property bool interactive: true
    signal selected(int index, string item)

    spacing: 7

    Repeater {
        model: root.items

        Item {
            id: crumb

            required property int index
            required property var modelData

            readonly property bool current: index === root.items.length - 1

            implicitWidth: crumbRow.implicitWidth
            implicitHeight: crumbRow.implicitHeight

            Row {
                id: crumbRow
                spacing: 7

                Text {
                    text: crumb.modelData
                    color: crumb.current ? "#202124" : crumbMouse.containsMouse && root.interactive ? "#2f7cff" : "#737b84"
                    font.pixelSize: 12
                    font.weight: crumb.current || crumbMouse.containsMouse && root.interactive ? Font.Bold : Font.Normal
                    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                }

                Text {
                    visible: crumb.index < root.items.length - 1
                    text: "/"
                    color: "#b0b6bd"
                    font.pixelSize: 12
                }
            }

            MouseArea {
                id: crumbMouse
                anchors.fill: parent
                enabled: root.interactive && !crumb.current
                hoverEnabled: enabled
                cursorShape: Qt.PointingHandCursor
                onClicked: root.selected(crumb.index, String(crumb.modelData))
            }
        }
    }
}
