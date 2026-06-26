import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    default property alias content: row.data

    implicitHeight: 46
    radius: 14
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"

    RowLayout {
        id: row
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 8
    }
}
