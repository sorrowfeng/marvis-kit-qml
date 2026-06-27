import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property int activeChip: 0
    property string selectedFile: "班级成绩分析汇总.doc"
    property bool previewVisible: true
    property bool statusActive: false

    Rectangle {
        anchors.fill: parent
        color: "#fafafa"
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        spacing: 22

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Row {
                id: chips
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 34
                spacing: 10

                Pill {
                    text: "✣  智能任务"
                    selected: root.activeChip === 0
                    onClicked: root.activeChip = 0
                }
                Pill {
                    text: "▤  本地模式"
                    selected: root.activeChip === 1
                    onClicked: root.activeChip = 1
                }
                Pill {
                    text: "⚙  系统控制"
                    selected: root.activeChip === 2
                    onClicked: root.activeChip = 2
                }
            }

            Rectangle {
                id: userBubble
                width: 530
                height: 102
                radius: 14
                color: "#f8f3f0"
                anchors.top: parent.top
                anchors.topMargin: 94
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.fill: parent
                    anchors.margins: 22
                    text: "读取我桌面上的三年二班学生成绩文件夹，从成绩变化趋势、学科优势、稳定性、潜力不同维度分析，最后为每个学生生成详细报告，并给出优化建议"
                    color: "#202124"
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                    lineHeight: 1.38
                    wrapMode: Text.WordWrap
                }
            }

            RowLayout {
                id: assistantHead
                anchors.left: assistantCard.left
                anchors.leftMargin: -48
                anchors.top: assistantCard.top
                anchors.topMargin: -30
                spacing: 9

                Image {
                    source: Qt.resolvedUrl("../assets/marvis-avatar.png")
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }

                Text { text: "Marvis"; color: "#737b84"; font.pixelSize: 12 }
                Text { text: "TL"; color: "#df5f56"; font.pixelSize: 10; font.weight: Font.Bold }
                Text { text: "Token12"; color: "#9aa1a9"; font.pixelSize: 12 }
            }

            Rectangle {
                id: assistantCard
                width: 626
                height: 282
                radius: 16
                color: "#ffffff"
                anchors.top: userBubble.bottom
                anchors.topMargin: 62
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    z: -1
                    anchors.fill: parent
                    anchors.topMargin: 16
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12
                    radius: parent.radius
                    color: "#18000000"
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 22
                    spacing: 12

                    Text {
                        text: "完美！已成功完成了对三年二班学生成绩数据的全面分析。"
                        color: "#202124"
                        font.pixelSize: 14
                        font.weight: Font.DemiBold
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "分析了 43 名学生的成绩数据，覆盖 2025 年 1 月、3 月、4 月、7 月共 4 次考试。"
                        color: "#3b4148"
                        font.pixelSize: 13
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                    }

                    Text {
                        text: "已生成 42 份学生个人分析报告和 1 份班级汇总报告。"
                        color: "#3b4148"
                        font.pixelSize: 13
                        Layout.fillWidth: true
                    }

                    FileRow {
                        title: "班级成绩分析汇总.doc"
                        subtitle: "3.4MB"
                        iconText: "▤"
                        selected: root.selectedFile === title
                        onClicked: {
                            root.selectedFile = title
                            root.previewVisible = true
                        }
                    }

                    FileRow {
                        title: "学生成绩分析报告"
                        subtitle: "42 个文件"
                        iconText: "□"
                        selected: root.selectedFile === title
                        onClicked: {
                            root.selectedFile = title
                            root.previewVisible = true
                        }
                    }
                }
            }

            Rectangle {
                id: statusCard
                width: 260
                height: 52
                radius: 26
                color: "#ffffff"
                border.width: root.statusActive ? 1 : 0
                border.color: "#b9dcff"
                anchors.left: assistantCard.left
                anchors.top: assistantCard.bottom
                anchors.topMargin: 28

                Rectangle {
                    z: -1
                    anchors.fill: parent
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8
                    radius: parent.radius
                    color: "#10000000"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 16
                    anchors.rightMargin: 14
                    spacing: 10

                    Text {
                        text: "◌"
                        color: root.statusActive ? "#2f7cff" : "#6aaee9"
                        font.pixelSize: 18
                    }

                    Column {
                        spacing: 2
                        Text { text: "本地文档处理"; color: "#202124"; font.pixelSize: 12; font.weight: Font.Bold }
                        Text { text: "正在同步手机、电脑和本地文件上下文"; color: "#8c939c"; font.pixelSize: 10 }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.statusActive = !root.statusActive
                }
            }

            ComposerBar {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
            }
        }

        DocumentPreview {
            title: root.selectedFile
            visible: opacity > 0
            opacity: root.previewVisible ? 1 : 0
            Layout.preferredWidth: 350
            Layout.fillHeight: true
            Layout.topMargin: 0
            Layout.bottomMargin: 90
            onCloseRequested: root.previewVisible = false
        }
    }

    component Pill: Rectangle {
        id: pill

        property string text: ""
        property bool selected: false
        signal clicked()

        width: label.implicitWidth + 28
        height: 32
        radius: 16
        color: selected ? "#f3f7ff" : mouse.containsMouse ? "#f7f8fa" : "#ffffff"
        border.width: 1
        border.color: selected ? "#cfe0ff" : "#edf0f2"

        Text {
            id: label
            anchors.centerIn: parent
            text: parent.text
            color: pill.selected ? "#2f5fb8" : "#454c55"
            font.pixelSize: 12
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: pill.clicked()
        }

        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }

    component FileRow: Rectangle {
        id: fileRow

        property string title: ""
        property string subtitle: ""
        property string iconText: ""
        property bool selected: false
        signal clicked()

        Layout.fillWidth: true
        Layout.preferredHeight: 64
        radius: 12
        color: selected ? "#edf4ff" : fileMouse.containsMouse ? "#eeeeed" : "#f5f5f4"
        border.width: selected ? 1 : 0
        border.color: "#cfe0ff"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            spacing: 12

            Rectangle {
                width: 38
                height: 38
                radius: 10
                color: "#e7f1ff"

                Text {
                    anchors.centerIn: parent
                    text: iconText
                    color: "#2f7cff"
                    font.pixelSize: 16
                }
            }

            Column {
                spacing: 3
                Layout.fillWidth: true

                Text { text: title; color: "#202124"; font.pixelSize: 13; font.weight: Font.DemiBold }
                Text { text: subtitle; color: "#8c939c"; font.pixelSize: 11 }
            }

            Text {
                text: "···"
                color: "#202124"
                font.pixelSize: 17
                font.weight: Font.Bold
            }
        }

        MouseArea {
            id: fileMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: fileRow.clicked()
        }

        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }

    component DocumentPreview: Rectangle {
        id: preview

        property string title: "班级成绩分析汇总.doc"
        signal closeRequested()

        radius: 20
        color: "#ffffff"

        Behavior on opacity {
            NumberAnimation { duration: 160; easing.type: Easing.OutCubic }
        }

        Rectangle {
            z: -1
            anchors.fill: parent
            anchors.topMargin: 18
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            radius: preview.radius
            color: "#19000000"
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 18
            spacing: 12

            RowLayout {
                Layout.fillWidth: true

                Column {
                    spacing: 8
                    Layout.fillWidth: true

                    Text {
                        text: preview.title
                        color: "#202124"
                        font.pixelSize: 17
                        font.weight: Font.Bold
                    }

                    Text {
                        text: "Microsoft Word 文档 | 3.4MB"
                        color: "#8b929b"
                        font.pixelSize: 12
                    }
                }

                Rectangle {
                    width: 30
                    height: 30
                    radius: 15
                    color: closeMouse.pressed ? "#e7ebef" : closeMouse.containsMouse ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)

                    Text {
                        anchors.centerIn: parent
                        text: "×"
                        color: "#6b727b"
                        font.pixelSize: 18
                    }

                    MouseArea {
                        id: closeMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: preview.closeRequested()
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 14
                color: "#ffffff"
                border.width: 1
                border.color: "#e7e9ec"
                clip: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 72
                        color: "#1f2a86"

                        Text {
                            anchors.centerIn: parent
                            text: "班级成绩分析汇总报告"
                            color: "#ffffff"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.margins: 18
                        spacing: 14

                        Text { text: "一、数据概况"; color: "#111827"; font.pixelSize: 14; font.weight: Font.Bold }
                        Text {
                            text: "本报告基于 2025 年 1 月至 7 月期间的 4 次统一考试数据生成。"
                            color: "#333a44"
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                        Text {
                            text: "• 分析学生人数：43 名\n• 覆盖考试：2025 年 1 月、3 月、4 月、7 月\n• 处理记录总数：168 条"
                            color: "#333a44"
                            font.pixelSize: 12
                            lineHeight: 1.4
                        }
                        Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 1; color: "#e7e9ec" }
                        Text { text: "二、班级整体表现"; color: "#111827"; font.pixelSize: 14; font.weight: Font.Bold }
                        Text {
                            text: "班级整体成绩在半年内呈现稳步上升趋势，数学与物理学科进步明显。"
                            color: "#333a44"
                            font.pixelSize: 12
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                        GridLayout {
                            columns: 5
                            rowSpacing: 0
                            columnSpacing: 0
                            Layout.fillWidth: true

                            Repeater {
                                model: ["考试批次", "语文", "数学", "英语", "总分", "1月", "78.5", "72.4", "81.2", "77.4", "3月", "79.1", "75.6", "80.8", "78.5"]

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 28
                                    color: index < 5 ? "#f7f8fa" : "#ffffff"
                                    border.width: 1
                                    border.color: "#eceff2"

                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData
                                        color: "#333a44"
                                        font.pixelSize: 10
                                    }
                                }
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 38

                FooterAction { label: "▤  打开" }
                FooterAction { label: "▢  转存" }
                FooterAction { label: "⌖  所在位置" }
            }
        }
    }

    component FooterAction: Rectangle {
        id: footerAction

        property string label: ""
        property bool active: false

        color: active ? "#edf4ff" : footerMouse.pressed ? "#e7ebef" : footerMouse.containsMouse ? "#f0f2f4" : Qt.rgba(240 / 255, 242 / 255, 244 / 255, 0)
        radius: 14
        Layout.fillWidth: true
        Layout.preferredHeight: 30

        Text {
            anchors.centerIn: parent
            text: footerAction.label
            color: footerAction.active ? "#2f7cff" : "#5e6670"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
        }

        MouseArea {
            id: footerMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: footerAction.active = !footerAction.active
        }

        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
    }
}
