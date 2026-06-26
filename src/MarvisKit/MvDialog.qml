import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: root

    property string title: "Dialog"
    property string message: ""

    modal: true
    focus: true
    padding: 20
    width: 360
    height: content.implicitHeight + 40
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        radius: 18
        color: "#ffffff"
        border.width: 1
        border.color: "#eceff2"
    }

    contentItem: ColumnLayout {
        id: content
        spacing: 16

        Text { text: root.title; color: "#202124"; font.pixelSize: 18; font.weight: Font.Bold; Layout.fillWidth: true }
        Text { text: root.message; color: "#66707b"; font.pixelSize: 13; wrapMode: Text.WordWrap; Layout.fillWidth: true }
        RowLayout {
            Layout.fillWidth: true
            Item { Layout.fillWidth: true }
            MvButton { text: "Cancel"; onClicked: root.close() }
            MvButton { text: "Confirm"; variant: "primary"; onClicked: root.close() }
        }
    }
}
