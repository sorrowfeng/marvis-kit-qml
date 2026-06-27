import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property int currentPage: 1
    property int pageCount: 5
    signal pageChanged(int page)

    spacing: 6

    function setPage(page) {
        const nextPage = Math.max(1, Math.min(root.pageCount, page))
        if (nextPage === root.currentPage) {
            return
        }
        root.currentPage = nextPage
        root.pageChanged(nextPage)
    }

    PageButton {
        text: "‹"
        enabled: root.currentPage > 1
        onClicked: root.setPage(root.currentPage - 1)
    }

    Repeater {
        model: root.pageCount

        PageButton {
            text: String(index + 1)
            selected: root.currentPage === index + 1
            onClicked: root.setPage(index + 1)
        }
    }

    PageButton {
        text: "›"
        enabled: root.currentPage < root.pageCount
        onClicked: root.setPage(root.currentPage + 1)
    }

    component PageButton: Rectangle {
        id: item

        property alias text: label.text
        property bool selected: false
        signal clicked()

        Layout.preferredWidth: 32
        Layout.preferredHeight: 32
        radius: 10
        antialiasing: true
        color: selected ? "#edf4ff" : !enabled ? Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0) : mouse.pressed ? "#e7ebef" : mouse.containsMouse ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)
        border.width: selected ? 1 : 0
        border.color: "#cfe0ff"

        Text {
            id: label
            anchors.centerIn: parent
            color: item.selected ? "#2f7cff" : item.enabled ? "#66707b" : "#b9c0c8"
            font.pixelSize: 13
            font.weight: item.selected ? Font.DemiBold : Font.Normal
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            enabled: item.enabled
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: item.clicked()
        }

        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
    }
}
