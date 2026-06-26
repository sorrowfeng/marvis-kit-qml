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

    radius: 14
    color: "#ffffff"
    border.width: 1
    border.color: "#eceff2"
    implicitHeight: table.implicitHeight

    ColumnLayout {
        id: table
        anchors.fill: parent
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 36
            Repeater {
                model: root.headers
                Text {
                    text: modelData
                    color: "#66707b"
                    font.pixelSize: 12
                    font.weight: Font.Bold
                    Layout.fillWidth: true
                    leftPadding: 14
                }
            }
        }

        Repeater {
            model: root.rows
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 38

                Repeater {
                    model: modelData
                    Text {
                        text: modelData
                        color: "#202124"
                        font.pixelSize: 12
                        Layout.fillWidth: true
                        leftPadding: 14
                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}
