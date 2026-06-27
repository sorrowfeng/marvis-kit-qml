import QtQuick
import QtQuick.Controls

ComboBox {
    id: root

    implicitWidth: 180
    implicitHeight: 38
    font.pixelSize: 13
    padding: 0

    background: Rectangle {
        radius: 10
        antialiasing: true
        color: root.down || root.popup.visible ? "#ffffff" : root.hovered ? "#f7f8fa" : "#ffffff"
        border.width: 1
        border.color: root.activeFocus || root.popup.visible ? "#c8dcff" : "#eceff2"
        Behavior on color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
        Behavior on border.color { ColorAnimation { duration: 130; easing.type: Easing.OutCubic } }
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
        rotation: root.popup.visible ? 180 : 0
        Behavior on rotation { NumberAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }

    delegate: ItemDelegate {
        id: option

        required property int index
        required property var modelData

        width: root.width - 12
        height: 34
        padding: 0
        highlighted: root.highlightedIndex === index

        background: Rectangle {
            radius: 9
            antialiasing: true
            color: option.down ? "#e9f1ff" : option.highlighted ? "#edf4ff" : option.hovered ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)
            Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
        }

        contentItem: Text {
            leftPadding: 12
            rightPadding: 12
            text: option.modelData
            color: option.highlighted ? "#2f7cff" : "#202124"
            font.pixelSize: 13
            font.weight: option.highlighted ? Font.DemiBold : Font.Normal
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    popup: Popup {
        y: root.height + 8
        width: root.width
        implicitHeight: Math.min(listView.contentHeight + topPadding + bottomPadding, 240)
        padding: 6
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
            radius: 14
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
                color: "#16000000"
                antialiasing: true
            }
        }

        contentItem: ListView {
            id: listView
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex
            boundsBehavior: Flickable.StopAtBounds
            spacing: 2
            ScrollIndicator.vertical: ScrollIndicator {}
        }
    }
}
