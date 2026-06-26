import QtQuick
import QtQuick.Controls

ComboBox {
    id: root

    implicitWidth: 180
    implicitHeight: 38
    font.pixelSize: 13

    background: Rectangle {
        radius: 10
        color: root.hovered ? "#f7f8fa" : "#ffffff"
        border.width: 1
        border.color: root.activeFocus ? "#c8dcff" : "#eceff2"
    }

    contentItem: Text {
        leftPadding: 14
        rightPadding: 32
        text: root.displayText
        color: "#202124"
        font: root.font
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    indicator: Text {
        x: root.width - width - 12
        y: root.height / 2 - height / 2
        text: "⌄"
        color: "#737b84"
        font.pixelSize: 14
    }
}
