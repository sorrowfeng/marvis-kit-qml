import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root

    readonly property int cornerRadius: 36
    readonly property int frameInset: 8

    width: 1280
    height: 780
    minimumWidth: 1120
    minimumHeight: 700
    visible: true
    color: "#00000000"
    flags: Qt.Window | Qt.FramelessWindowHint

    property int activePage: Qt.application.arguments.indexOf("--kit") >= 0 ? 1 : 0

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: appShell
            anchors.fill: parent
            anchors.margins: root.frameInset
            radius: root.cornerRadius
            color: "#fdfdfc"
            border.width: 1
            border.color: "#eceff2"
            antialiasing: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Sidebar {
                    activeIndex: root.activePage
                    Layout.fillHeight: true
                    onSelected: root.activePage = index
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#fafafa"
                    radius: root.cornerRadius
                    topLeftRadius: 0
                    bottomLeftRadius: 0
                    antialiasing: true

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        TitleBar {
                            appWindow: root
                            activeIndex: root.activePage
                            Layout.fillWidth: true
                        }

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            ChatScreen {
                                anchors.fill: parent
                                visible: opacity > 0
                                opacity: root.activePage === 0 ? 1 : 0
                                y: root.activePage === 0 ? 0 : 10
                            }

                            LibraryScreen {
                                anchors.fill: parent
                                visible: opacity > 0
                                opacity: root.activePage === 1 ? 1 : 0
                                y: root.activePage === 1 ? 0 : 10
                            }
                        }
                    }
                }
            }
        }
    }
}
