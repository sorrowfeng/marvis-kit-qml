import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

MvButton {
    id: root

    property var options: ["Rename", "Duplicate", "Delete"]
    property int popupWidth: Math.max(root.width, 168)
    property int currentIndex: -1
    signal selected(string option, int index)

    text: "Menu"
    iconText: "⌄"

    function openMenu() {
        menu.open()
    }

    onClicked: menu.open()

    Popup {
        id: menu

        x: root.width - width
        y: root.height + 8
        width: root.popupWidth
        padding: 6
        modal: false
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        transformOrigin: Item.TopRight

        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 130; easing.type: Easing.OutCubic }
            NumberAnimation { property: "scale"; from: 0.98; to: 1; duration: 130; easing.type: Easing.OutCubic }
        }

        exit: Transition {
            NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 90; easing.type: Easing.OutCubic }
            NumberAnimation { property: "scale"; from: 1; to: 0.98; duration: 90; easing.type: Easing.OutCubic }
        }

        background: Rectangle {
            radius: 16
            antialiasing: true
            color: "#ffffff"
            border.width: 1
            border.color: "#e6ebef"

            Rectangle {
                z: -1
                anchors.fill: parent
                anchors.topMargin: 8
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                radius: parent.radius
                antialiasing: true
                color: "#16000000"
            }
        }

        contentItem: ColumnLayout {
            spacing: 2

            Repeater {
                model: root.options

                Rectangle {
                    id: optionRow

                    required property int index
                    required property var modelData

                    readonly property string optionText: typeof modelData === "string" ? modelData : modelData.text
                    readonly property bool destructive: typeof modelData === "object" && modelData.destructive === true
                    readonly property bool selected: root.currentIndex === index

                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    radius: 10
                    antialiasing: true
                    color: selected ? "#edf4ff" : mouse.pressed ? "#e7ebef" : mouse.containsMouse ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 10
                        spacing: 8

                        Text {
                            text: optionRow.optionText
                            color: optionRow.destructive ? "#d34242" : optionRow.selected ? "#2f7cff" : "#202124"
                            font.pixelSize: 13
                            font.weight: optionRow.selected ? Font.DemiBold : Font.Normal
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                        }

                        Text {
                            visible: optionRow.selected
                            text: "✓"
                            color: "#2f7cff"
                            font.pixelSize: 12
                            font.weight: Font.Bold
                        }
                    }

                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            root.currentIndex = optionRow.index
                            root.selected(optionRow.optionText, optionRow.index)
                            menu.close()
                        }
                    }

                    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                }
            }
        }
    }
}
