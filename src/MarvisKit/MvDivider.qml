import QtQuick

Rectangle {
    property bool vertical: false
    implicitWidth: vertical ? 1 : 80
    implicitHeight: vertical ? 80 : 1
    color: "#eceff2"
}
