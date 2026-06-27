import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property var headers: ["Name", "Status", "Owner"]
    property var rows: [
        ["Revenue", "Ready", "Nora"],
        ["Roadmap", "Draft", "Kai"],
        ["Design QA", "Live", "Mira"]
    ]
    property int selectedRow: -1
    property int sortColumn: -1
    property bool sortAscending: true
    property bool interactive: true
    property int headerHeight: 38
    property int rowHeight: 42
    property int outerPadding: 7
    property int horizontalPadding: 14
    signal rowClicked(int row, var rowData)
    signal headerClicked(int column, string header)

    readonly property var viewRows: {
        var copy = []
        for (var i = 0; i < root.rows.length; i++) {
            copy.push(root.rows[i])
        }
        if (root.sortColumn >= 0) {
            copy.sort(function(a, b) {
                var av = a[root.sortColumn] === undefined ? "" : String(a[root.sortColumn])
                var bv = b[root.sortColumn] === undefined ? "" : String(b[root.sortColumn])
                var result = av.localeCompare(bv)
                return root.sortAscending ? result : -result
            })
        }
        return copy
    }

    function toggleSort(column) {
        if (root.sortColumn === column) {
            root.sortAscending = !root.sortAscending
        } else {
            root.sortColumn = column
            root.sortAscending = true
        }
        root.headerClicked(column, String(root.headers[column]))
    }

    radius: 16
    antialiasing: true
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"
    implicitHeight: table.implicitHeight + outerPadding * 2
    Layout.minimumHeight: implicitHeight
    clip: true

    ColumnLayout {
        id: table
        anchors.fill: parent
        anchors.margins: root.outerPadding
        spacing: 2

        Rectangle {
            id: headerRow

            Layout.fillWidth: true
            Layout.preferredHeight: root.headerHeight
            radius: 12
            antialiasing: true
            color: "#f7f8fa"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Repeater {
                    model: root.headers

                    Rectangle {
                        id: headerCell

                        required property int index
                        required property var modelData

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1
                        radius: 10
                        antialiasing: true
                        color: headerMouse.pressed ? "#e7ebef" : headerMouse.containsMouse && root.interactive ? "#eef2f5" : Qt.rgba(238 / 255, 242 / 255, 245 / 255, 0)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: root.horizontalPadding
                            anchors.rightMargin: 10
                            spacing: 6

                            Text {
                                text: headerCell.modelData
                                color: root.sortColumn === headerCell.index ? "#2f7cff" : "#66707b"
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            Text {
                                visible: root.sortColumn === headerCell.index
                                text: root.sortAscending ? "↑" : "↓"
                                color: "#2f7cff"
                                font.pixelSize: 11
                                font.weight: Font.Bold
                                Layout.fillHeight: true
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                        MouseArea {
                            id: headerMouse
                            anchors.fill: parent
                            enabled: root.interactive
                            hoverEnabled: root.interactive
                            cursorShape: Qt.PointingHandCursor
                            onClicked: root.toggleSort(headerCell.index)
                        }

                        Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                    }
                }
            }
        }

        Repeater {
            model: root.viewRows

            Rectangle {
                id: rowItem

                required property int index
                required property var modelData

                Layout.fillWidth: true
                Layout.preferredHeight: root.rowHeight
                radius: 12
                antialiasing: true
                color: root.selectedRow === index ? "#edf4ff" : rowMouse.pressed ? "#e7ebef" : rowMouse.containsMouse && root.interactive ? "#f7f8fa" : Qt.rgba(247 / 255, 248 / 255, 250 / 255, 0)
                border.width: root.selectedRow === index ? 1 : 0
                border.color: "#cfe0ff"

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Repeater {
                        model: root.headers.length

                        Text {
                            readonly property var cellValue: rowItem.modelData[index] === undefined ? "" : rowItem.modelData[index]

                            text: cellValue
                            color: root.selectedRow === rowItem.index ? "#202124" : "#343a43"
                            font.pixelSize: 12
                            font.weight: root.selectedRow === rowItem.index ? Font.DemiBold : Font.Normal
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 1
                            leftPadding: root.horizontalPadding
                            rightPadding: 10
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }
                }

                MouseArea {
                    id: rowMouse
                    anchors.fill: parent
                    enabled: root.interactive
                    hoverEnabled: root.interactive
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        root.selectedRow = rowItem.index
                        root.rowClicked(rowItem.index, rowItem.modelData)
                    }
                }

                Behavior on color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
                Behavior on border.color { ColorAnimation { duration: 120; easing.type: Easing.OutCubic } }
            }
        }
    }
}
