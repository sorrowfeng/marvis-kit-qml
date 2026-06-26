import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MarvisKit 1.0 as Kit

Item {
    id: root

    property Window appWindow
    property int activeIndex: 0
    property bool phoneConnected: false
    property bool noticeActive: false

    height: 58

    Kit.MarvisPalette { id: palette }

    DragHandler {
        target: null
        onActiveChanged: {
            if (active && root.appWindow) {
                root.appWindow.startSystemMove()
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#fafafa"
    }

    Text {
        anchors.centerIn: parent
        text: root.activeIndex === 0 ? "与 Marvis 的对话" : "MarvisKit 控件库"
        color: "#202124"
        font.pixelSize: 14
        font.weight: Font.Bold
    }

    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 18
        anchors.verticalCenter: parent.verticalCenter
        spacing: 8

        HeaderAction {
            label: root.phoneConnected ? "已连接手机" : "连接至手机"
            icon: "▯"
            wide: true
            active: root.phoneConnected
            onClicked: root.phoneConnected = !root.phoneConnected
        }

        HeaderAction {
            icon: root.noticeActive ? "●" : "♧"
            active: root.noticeActive
            onClicked: root.noticeActive = !root.noticeActive
        }

        HeaderAction {
            icon: "↙"
            onClicked: root.appWindow.showMinimized()
        }

        HeaderAction {
            icon: "↗"
            onClicked: {
                if (root.appWindow.visibility === Window.Maximized) {
                    root.appWindow.showNormal()
                } else {
                    root.appWindow.showMaximized()
                }
            }
        }

        HeaderAction {
            icon: "×"
            onClicked: root.appWindow.close()
        }
    }

    component HeaderAction: Rectangle {
        id: action

        property string icon: ""
        property string label: ""
        property bool wide: false
        property bool active: false
        signal clicked()

        Layout.preferredWidth: wide ? 116 : 30
        Layout.preferredHeight: 30
        radius: 15
        color: active ? "#eef4ff" : mouse.containsMouse ? "#f0f2f4" : "transparent"

        Row {
            anchors.centerIn: parent
            spacing: 6

            Text {
                text: action.icon
                color: action.active ? "#2f7cff" : "#5c636d"
                font.pixelSize: action.wide ? 13 : 15
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                visible: action.label.length > 0
                text: action.label
                color: action.active ? "#2f7cff" : "#505762"
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: action.clicked()
        }

        Behavior on color {
            ColorAnimation { duration: 140; easing.type: Easing.OutCubic }
        }
    }
}
