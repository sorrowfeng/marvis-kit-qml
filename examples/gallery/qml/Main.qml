import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root

    readonly property int cornerRadius: 36
    readonly property int frameInset: 8
    readonly property bool maximized: visibility === Window.Maximized || visibility === Window.FullScreen
    readonly property int effectiveCornerRadius: maximized ? 0 : cornerRadius
    readonly property int effectiveFrameInset: maximized ? 0 : frameInset
    readonly property int resizeHandleSize: 8

    width: 1280
    height: 780
    minimumWidth: 1120
    minimumHeight: 700
    visible: true
    color: "#00000000"
    flags: Qt.Window | Qt.FramelessWindowHint

    property int activePage: Qt.application.arguments.indexOf("--kit") >= 0 ? 1 : 0

    function toggleMaximized() {
        if (root.visibility === Window.Maximized) {
            root.showNormal()
        } else {
            root.showMaximized()
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: appShell
            anchors.fill: parent
            anchors.margins: root.effectiveFrameInset
            radius: root.effectiveCornerRadius
            color: "#fdfdfc"
            border.width: 0
            antialiasing: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Sidebar {
                    activeIndex: root.activePage
                    cornerRadius: root.effectiveCornerRadius
                    Layout.fillHeight: true
                    onSelected: root.activePage = index
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#fafafa"
                    radius: root.effectiveCornerRadius
                    topLeftRadius: 0
                    bottomLeftRadius: 0
                    antialiasing: true

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        TitleBar {
                            appWindow: root
                            cornerRadius: root.effectiveCornerRadius
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
                                shellInset: root.effectiveFrameInset
                                shellRadius: root.effectiveCornerRadius
                                visible: opacity > 0
                                opacity: root.activePage === 1 ? 1 : 0
                                y: root.activePage === 1 ? 0 : 10
                            }
                        }
                    }
                }
            }

            Rectangle {
                anchors.fill: parent
                radius: root.effectiveCornerRadius
                color: "#00000000"
                border.width: root.maximized ? 0 : 1
                border.color: "#eceff2"
                antialiasing: true
            }
        }
    }

    ResizeHandle {
        edges: Qt.LeftEdge | Qt.TopEdge
        cursor: Qt.SizeFDiagCursor
        anchors.left: parent.left
        anchors.top: parent.top
    }

    ResizeHandle {
        edges: Qt.RightEdge | Qt.TopEdge
        cursor: Qt.SizeBDiagCursor
        anchors.right: parent.right
        anchors.top: parent.top
    }

    ResizeHandle {
        edges: Qt.LeftEdge | Qt.BottomEdge
        cursor: Qt.SizeBDiagCursor
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    ResizeHandle {
        edges: Qt.RightEdge | Qt.BottomEdge
        cursor: Qt.SizeFDiagCursor
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    ResizeHandle {
        edges: Qt.LeftEdge
        cursor: Qt.SizeHorCursor
        width: root.resizeHandleSize
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: root.resizeHandleSize
        anchors.bottomMargin: root.resizeHandleSize
    }

    ResizeHandle {
        edges: Qt.RightEdge
        cursor: Qt.SizeHorCursor
        width: root.resizeHandleSize
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: root.resizeHandleSize
        anchors.bottomMargin: root.resizeHandleSize
    }

    ResizeHandle {
        edges: Qt.TopEdge
        cursor: Qt.SizeVerCursor
        height: root.resizeHandleSize
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: root.resizeHandleSize
        anchors.rightMargin: root.resizeHandleSize
    }

    ResizeHandle {
        edges: Qt.BottomEdge
        cursor: Qt.SizeVerCursor
        height: root.resizeHandleSize
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: root.resizeHandleSize
        anchors.rightMargin: root.resizeHandleSize
    }

    component ResizeHandle: MouseArea {
        property int edges: 0
        property int cursor: Qt.ArrowCursor

        width: root.resizeHandleSize
        height: root.resizeHandleSize
        enabled: !root.maximized
        hoverEnabled: enabled
        cursorShape: cursor
        z: 100
        acceptedButtons: Qt.LeftButton
        onPressed: root.startSystemResize(edges)
    }
}
