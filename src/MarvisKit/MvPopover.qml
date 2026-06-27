import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: root

    default property alias content: body.data
    property string title: ""
    property string message: ""

    width: 320
    padding: 16
    modal: false
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    transformOrigin: Item.Top

    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 130; easing.type: Easing.OutCubic }
        NumberAnimation { property: "scale"; from: 0.98; to: 1; duration: 130; easing.type: Easing.OutCubic }
    }

    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 90; easing.type: Easing.OutCubic }
        NumberAnimation { property: "scale"; from: 1; to: 0.98; duration: 90; easing.type: Easing.OutCubic }
    }

    background: Rectangle {
        radius: 18
        antialiasing: true
        color: "#ffffff"
        border.width: 1
        border.color: "#e6ebef"
    }

    contentItem: ColumnLayout {
        id: body
        spacing: 10

        Text {
            visible: root.title.length > 0
            text: root.title
            color: "#202124"
            font.pixelSize: 15
            font.weight: Font.Bold
            Layout.fillWidth: true
        }

        Text {
            visible: root.message.length > 0
            text: root.message
            color: "#66707b"
            font.pixelSize: 12
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
    }
}
