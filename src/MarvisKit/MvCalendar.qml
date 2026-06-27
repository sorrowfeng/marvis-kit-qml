import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property date monthDate: new Date()
    property int selectedDay: new Date().getDate()
    signal selected(date date)

    function daysInMonth(year, month) {
        return new Date(year, month + 1, 0).getDate()
    }

    function firstDay(year, month) {
        return new Date(year, month, 1).getDay()
    }

    function cellDay(index) {
        return index - firstDay(monthDate.getFullYear(), monthDate.getMonth()) + 1
    }

    function setMonth(offset) {
        monthDate = new Date(monthDate.getFullYear(), monthDate.getMonth() + offset, 1)
        selectedDay = Math.min(selectedDay, daysInMonth(monthDate.getFullYear(), monthDate.getMonth()))
    }

    implicitWidth: 292
    implicitHeight: 310
    radius: 18
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 14
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            MvIconButton { iconText: "‹"; onClicked: root.setMonth(-1) }
            Text {
                text: Qt.formatDate(root.monthDate, "yyyy MMMM")
                color: "#202124"
                font.pixelSize: 14
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }
            MvIconButton { iconText: "›"; onClicked: root.setMonth(1) }
        }

        GridLayout {
            columns: 7
            rowSpacing: 6
            columnSpacing: 6
            Layout.fillWidth: true

            Repeater {
                model: ["日", "一", "二", "三", "四", "五", "六"]
                Text {
                    text: modelData
                    color: "#9aa1a9"
                    font.pixelSize: 11
                    font.weight: Font.DemiBold
                    horizontalAlignment: Text.AlignHCenter
                    Layout.preferredWidth: 32
                }
            }
        }

        GridLayout {
            columns: 7
            rowSpacing: 6
            columnSpacing: 6
            Layout.fillWidth: true

            Repeater {
                model: 42

                Rectangle {
                    id: dayCell

                    readonly property int dayNumber: root.cellDay(index)
                    readonly property bool inMonth: dayNumber >= 1 && dayNumber <= root.daysInMonth(root.monthDate.getFullYear(), root.monthDate.getMonth())
                    readonly property bool isSelected: inMonth && dayNumber === root.selectedDay

                    Layout.preferredWidth: 32
                    Layout.preferredHeight: 32
                    radius: 11
                    antialiasing: true
                    color: isSelected ? "#050505" : mouse.pressed ? "#e7ebef" : mouse.containsMouse && inMonth ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)

                    Text {
                        anchors.centerIn: parent
                        text: dayCell.inMonth ? dayCell.dayNumber : ""
                        color: dayCell.isSelected ? "#ffffff" : "#343a43"
                        font.pixelSize: 12
                        font.weight: dayCell.isSelected ? Font.DemiBold : Font.Normal
                    }

                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        enabled: dayCell.inMonth
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            root.selectedDay = dayCell.dayNumber
                            root.selected(new Date(root.monthDate.getFullYear(), root.monthDate.getMonth(), dayCell.dayNumber))
                        }
                    }

                    Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                }
            }
        }
    }
}
