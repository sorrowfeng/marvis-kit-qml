import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MarvisKit 1.0 as Kit

Item {
    id: root

    property int activeIndex: 0
    property string selectedLabel: activeIndex === 1 ? "控件库示例" : "学生成绩分析"
    property bool searchActive: false
    property bool menuActive: false
    property bool deviceExpanded: false
    property int cornerRadius: 36
    signal selected(int index)

    width: 164

    Kit.MarvisPalette { id: palette }

    Rectangle {
        anchors.fill: parent
        color: "#f9faf9"
        radius: root.cornerRadius
        topRightRadius: 0
        bottomRightRadius: 0
        antialiasing: true
    }

    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 1
        color: "#eceef0"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 14
        anchors.rightMargin: 12
        anchors.topMargin: 28
        anchors.bottomMargin: 18
        spacing: 10

        RowLayout {
            Layout.fillWidth: true

            RowLayout {
                spacing: 4
                Layout.fillWidth: true

                Text {
                    text: "Marvis"
                    color: "#202124"
                    font.pixelSize: 20
                    font.weight: Font.Black
                }

                Text {
                    text: "Beta"
                    color: "#a1a5ac"
                    font.pixelSize: 8
                    Layout.alignment: Qt.AlignBottom
                }
            }

            Rectangle {
                Layout.preferredWidth: 28
                Layout.preferredHeight: 28
                radius: 8
                color: root.menuActive ? "#edf4ff" : menuMouse.containsMouse ? "#f1f3f4" : Qt.rgba(241 / 255, 243 / 255, 244 / 255, 0)

                Text {
                    anchors.centerIn: parent
                    text: "☰"
                    color: root.menuActive ? "#2f7cff" : "#4e545d"
                    font.pixelSize: 15
                }

                MouseArea {
                    id: menuMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        root.menuActive = !root.menuActive
                        root.selectedLabel = root.menuActive ? "菜单" : (root.activeIndex === 1 ? "控件库示例" : "学生成绩分析")
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 24
            radius: 8
            color: root.deviceExpanded ? "#f2f7ff" : deviceMouse.containsMouse ? "#f7f9fb" : Qt.rgba(247 / 255, 249 / 255, 251 / 255, 0)

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.verticalCenter: parent.verticalCenter
                text: root.deviceExpanded ? "● 联机小新Air15⌃" : "● 联机小新Air15⌄"
                color: root.deviceExpanded ? "#2f7cff" : "#7a828d"
                font.pixelSize: 11
            }

            MouseArea {
                id: deviceMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.deviceExpanded = !root.deviceExpanded
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 34
            Layout.topMargin: 10
            radius: 8
            color: root.searchActive ? "#f2f7ff" : searchMouse.containsMouse ? "#f7f9fb" : "#ffffff"
            border.width: 1
            border.color: root.searchActive ? "#c8dcff" : "#edf0f2"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 8
                spacing: 7

                Text { text: "⌕"; color: "#707781"; font.pixelSize: 13 }
                Text {
                    text: "搜索对话与文件"
                    color: "#8d949e"
                    font.pixelSize: 11
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
            }

            MouseArea {
                id: searchMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.IBeamCursor
                onClicked: root.searchActive = !root.searchActive
            }

            Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
            Behavior on border.color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
        }

        Rectangle {
            id: newChatButton
            Layout.fillWidth: true
            Layout.preferredHeight: 34
            radius: 8
            color: newChatMouse.containsMouse ? "#f1f3f4" : "#ffffff"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                spacing: 8

                Text { text: "+"; color: "#16181c"; font.pixelSize: 16 }
                Text {
                    text: "新建对话"
                    color: "#171a1f"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                }
            }

            MouseArea {
                id: newChatMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    root.selectedLabel = "新建对话"
                    root.selected(0)
                }
            }

            Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
        }

        Text {
            text: "对话"
            color: "#9aa0a8"
            font.pixelSize: 11
            Layout.topMargin: 12
        }

        NavRow {
            label: "学生成绩分析"
            icon: "▤"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }

        NavRow {
            label: "更新电脑里的 CS2"
            icon: "⌘"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }

        NavRow {
            label: "整理桌面文件"
            icon: "□"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }

        Text {
            text: "能力"
            color: "#9aa0a8"
            font.pixelSize: 11
            Layout.topMargin: 12
        }

        NavRow {
            label: "应用搜索"
            icon: "▦"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }
        NavRow {
            label: "控制电脑"
            icon: "▱"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }
        NavRow {
            label: "本地知识库"
            icon: "□"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(0)
            }
        }
        NavRow {
            label: "控件库示例"
            icon: "◫"
            selected: root.selectedLabel === label
            onClicked: {
                root.selectedLabel = label
                root.selected(1)
            }
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.fillWidth: true
            spacing: 13

            BottomTab {
                icon: "□"
                label: "对话"
                active: root.activeIndex === 0
                onClicked: root.selected(0)
            }
            BottomTab {
                icon: "◷"
                label: "任务"
                active: root.selectedLabel === "任务"
                onClicked: root.selectedLabel = "任务"
            }
            BottomTab {
                icon: "⌁"
                label: "技能"
                active: root.activeIndex === 1
                onClicked: root.selected(1)
            }
            BottomTab {
                icon: "◎"
                label: "我的"
                active: root.selectedLabel === "我的"
                onClicked: root.selectedLabel = "我的"
            }
        }
    }

    component NavRow: Rectangle {
        id: nav

        property string label: ""
        property string icon: ""
        property bool selected: false
        signal clicked()

        Layout.fillWidth: true
        Layout.preferredHeight: 34
        radius: 8
        color: selected ? "#ecebea" : mouse.pressed ? "#e7e8e9" : mouse.containsMouse ? "#f1f3f4" : Qt.rgba(241 / 255, 243 / 255, 244 / 255, 0)

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 8
            spacing: 8

            Text {
                text: nav.icon
                color: "#6f7782"
                font.pixelSize: 13
                Layout.preferredWidth: 14
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: nav.label
                color: selected ? "#24272c" : "#666e79"
                font.pixelSize: 12
                font.weight: selected ? Font.DemiBold : Font.Normal
                Layout.fillWidth: true
                elide: Text.ElideRight
            }
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: nav.clicked()
        }

        Behavior on color {
            ColorAnimation { duration: 150; easing.type: Easing.OutCubic }
        }
    }

    component BottomTab: Item {
        id: tab

        property string icon: ""
        property string label: ""
        property bool active: false
        signal clicked()

        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: 28
        Layout.preferredHeight: 36

        ColumnLayout {
            anchors.fill: parent
            spacing: 4

            Text {
                text: icon
                color: active ? "#202124" : "#a1a6ad"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            Text {
                text: label
                color: active ? "#202124" : "#9aa0a8"
                font.pixelSize: 10
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: tab.clicked()
        }
    }
}
