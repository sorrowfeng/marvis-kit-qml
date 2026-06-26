import QtQuick

Row {
    id: root

    property var items: ["Home", "Page"]

    spacing: 7

    Repeater {
        model: root.items

        Row {
            spacing: 7
            Text { text: modelData; color: index === root.items.length - 1 ? "#202124" : "#737b84"; font.pixelSize: 12; font.weight: index === root.items.length - 1 ? Font.Bold : Font.Normal }
            Text { visible: index < root.items.length - 1; text: "/"; color: "#b0b6bd"; font.pixelSize: 12 }
        }
    }
}
