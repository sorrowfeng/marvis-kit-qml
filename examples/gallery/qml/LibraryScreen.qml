import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MarvisKit 1.0 as Kit

Item {
    id: root

    property int radioChoice: 0
    property int tabChoice: 0
    property real progressValue: 0.68

    Kit.MarvisPalette { id: palette }

    Timer {
        id: toastTimer
        interval: 1800
        onTriggered: toast.open = false
    }

    Kit.MvDialog {
        id: sampleDialog
        x: (root.width - width) / 2
        y: (root.height - height) / 2
        title: "确认操作"
        message: "这是一枚 MarvisKit 对话框，适合用于桌面应用里的轻量确认、权限提示和完成反馈。"
    }

    Kit.MvToast {
        id: toast
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 26
        z: 30
        text: "已完成"
    }

    ScrollView {
        anchors.fill: parent
        anchors.leftMargin: 32
        anchors.rightMargin: 32
        anchors.topMargin: 18
        anchors.bottomMargin: 22
        clip: true

        ColumnLayout {
            width: Math.max(780, root.width - 64)
            spacing: 18

            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                ColumnLayout {
                    spacing: 3
                    Layout.fillWidth: true

                    Text {
                        text: "MarvisKit 控件库"
                        color: palette.ink
                        font.pixelSize: 24
                        font.weight: Font.Bold
                    }

                    Text {
                        text: "按 Marvis 的低饱和灰白、轻阴影、胶囊选择和对话卡片风格整理。"
                        color: palette.mutedInk
                        font.pixelSize: 12
                    }
                }

                Kit.MvBadge {
                    text: "QML 原生"
                }

                Kit.MvBadge {
                    text: "低饱和"
                    fill: "#f7f0e8"
                    foreground: palette.amber
                }
            }

            GridLayout {
                columns: 2
                columnSpacing: 18
                rowSpacing: 18
                Layout.fillWidth: true

                Kit.MvPanel {
                    title: "按钮与胶囊"
                    subtitle: "黑色仅用于真正的执行动作，其余保持灰白。"
                    Layout.fillWidth: true

                    RowLayout {
                        spacing: 10
                        Layout.fillWidth: true

                        Kit.MvButton {
                            text: "打开"
                            accent: true
                            Layout.preferredWidth: 72
                        }

                        Kit.MvButton {
                            text: "选择文件"
                            iconText: "+"
                            Layout.preferredWidth: 98
                        }

                        Kit.MvButton {
                            text: "更多"
                            quiet: true
                            Layout.preferredWidth: 72
                        }

                        Kit.MvIconButton { iconText: "◦" }
                        Kit.MvIconButton { iconText: "×" }
                    }
                }

                Kit.MvPanel {
                    title: "输入区"
                    subtitle: "圆润输入、弱边框和淡灰 placeholder。"
                    Layout.fillWidth: true

                    Kit.MvSearchField {
                        placeholderText: "搜索组件"
                        Layout.fillWidth: true
                    }

                    Kit.MvTextField {
                        placeholderText: "请输入任务名称"
                        text: "更新电脑里的 CS2"
                        Layout.fillWidth: true
                    }
                }

                Kit.MvPanel {
                    title: "日程胶囊"
                    subtitle: "参考周历卡片的选中状态：小块、轻阴影、少量强调色。"
                    Layout.fillWidth: true

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 22

                        Repeater {
                            model: [
                                { day: "S", num: "✓", selected: false },
                                { day: "M", num: "✓", selected: false },
                                { day: "T", num: "✓", selected: true },
                                { day: "W", num: "2", selected: false },
                                { day: "T", num: "3", selected: false },
                                { day: "F", num: "4", selected: false },
                                { day: "S", num: "5", selected: false }
                            ]

                            Rectangle {
                                width: modelData.selected ? 44 : 30
                                height: 66
                                radius: 13
                                color: modelData.selected ? "#ffffff" : "transparent"
                                border.width: 0

                                Rectangle {
                                    visible: modelData.selected
                                    anchors.fill: parent
                                    anchors.topMargin: 9
                                    anchors.leftMargin: 4
                                    anchors.rightMargin: 4
                                    radius: 13
                                    color: "#10000000"
                                    z: -1
                                }

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 9

                                    Text {
                                        text: modelData.day
                                        color: modelData.selected ? "#ff4d73" : "#a7a29d"
                                        font.pixelSize: 14
                                        font.weight: Font.DemiBold
                                        horizontalAlignment: Text.AlignHCenter
                                        width: 26
                                    }

                                    Text {
                                        text: modelData.num
                                        color: "#171716"
                                        font.pixelSize: 18
                                        font.weight: Font.DemiBold
                                        horizontalAlignment: Text.AlignHCenter
                                        width: 26
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 66
                        radius: 18
                        color: "#f4f3f1"

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 12

                            Rectangle {
                                width: 42
                                height: 42
                                radius: 13
                                color: "#2b1f22"

                                Text {
                                    anchors.centerIn: parent
                                    text: "D4"
                                    color: "#d74e3e"
                                    font.pixelSize: 13
                                    font.weight: Font.Bold
                                }
                            }

                            ColumnLayout {
                                spacing: 2
                                Layout.fillWidth: true

                                Text {
                                    text: "暗黑破坏神4 - Steam限时免费"
                                    color: palette.mutedInk
                                    font.pixelSize: 13
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                }

                                Text {
                                    text: "已领取"
                                    color: palette.ink
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                }
                            }
                        }
                    }
                }

                Kit.MvPanel {
                    title: "轻卡片"
                    subtitle: "接近官网功能卡片：白底、柔影、灰色内容块。"
                    Layout.fillWidth: true

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 14

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 190
                            radius: 20
                            color: "#ffffff"
                            border.width: 1
                            border.color: "#eeeae4"

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 16
                                spacing: 10

                                Text {
                                    text: "MAYDAY超话"
                                    color: palette.ink
                                    font.pixelSize: 14
                                    font.weight: Font.DemiBold
                                }

                                Repeater {
                                    model: 3

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 12
                                        radius: 6
                                        color: "#f1f0ee"
                                    }
                                }

                                GridLayout {
                                    columns: 2
                                    columnSpacing: 8
                                    rowSpacing: 8
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true

                                    Repeater {
                                        model: 4

                                        Rectangle {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            radius: 12
                                            color: "#f4f3f1"
                                        }
                                    }
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 190
                            radius: 20
                            color: "#ffffff"
                            border.width: 1
                            border.color: "#eeeae4"

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 16
                                spacing: 12

                                Text {
                                    text: "五迷共享相册"
                                    color: palette.ink
                                    font.pixelSize: 14
                                    font.weight: Font.DemiBold
                                }

                                GridLayout {
                                    columns: 2
                                    columnSpacing: 10
                                    rowSpacing: 10
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true

                                    Repeater {
                                        model: ["演唱会", "直播", "周边物料", "二创"]

                                        ColumnLayout {
                                            spacing: 5
                                            Layout.fillWidth: true

                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 54
                                                radius: 14
                                                color: "#f4f3f1"
                                            }

                                            Text {
                                                text: modelData
                                                color: "#6e6b67"
                                                font.pixelSize: 11
                                                horizontalAlignment: Text.AlignHCenter
                                                Layout.fillWidth: true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Kit.MvPanel {
                    title: "对话气泡"
                    subtitle: "用户气泡靠右，助手气泡白底轻边框。"
                    Layout.fillWidth: true

                    Kit.MvMessageBubble {
                        speaker: "你"
                        user: true
                        body: "帮我更新电脑里的 CS2，我回家要玩"
                        meta: "9:30"
                        Layout.fillWidth: true
                    }

                    Kit.MvMessageBubble {
                        speaker: "Marvis"
                        body: "好的，我已收到您的请求，正在为您打开并更新 CS2。"
                        meta: "Token12"
                        Layout.fillWidth: true
                    }
                }

                Kit.MvPanel {
                    title: "文件与应用卡"
                    subtitle: "灰色承载层、小图标、黑色执行按钮。"
                    Layout.fillWidth: true

                    Kit.MvFileCard {
                        title: "Counter-Strike 2"
                        subtitle: "多人战术第一人称视角射击游戏"
                        fileType: "CS"
                        Layout.fillWidth: true
                    }

                    Kit.MvFileCard {
                        title: "产品复盘资料"
                        subtitle: "文档 · 已生成 8 条洞察"
                        fileType: "DOC"
                        Layout.fillWidth: true
                    }
                }

                Kit.MvPanel {
                    title: "选择与设置"
                    subtitle: "覆盖桌面设置页常用的分段、下拉、勾选、单选、开关和滑杆。"
                    Layout.fillWidth: true

                    Kit.MvSegmentedControl {
                        options: ["通用", "安全", "高级"]
                        Layout.fillWidth: true
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Kit.MvComboBox {
                            model: ["跟随系统", "浅色", "深色"]
                            Layout.fillWidth: true
                        }

                        RowLayout {
                            spacing: 8
                            Kit.MvToggle { checked: true }
                            Text { text: "自动同步"; color: palette.text; font.pixelSize: 13 }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 20

                        Kit.MvCheckbox {
                            text: "启动时恢复窗口"
                            checked: true
                        }

                        Kit.MvRadio {
                            text: "本地优先"
                            checked: root.radioChoice === 0
                            onSelected: root.radioChoice = 0
                        }

                        Kit.MvRadio {
                            text: "云端优先"
                            checked: root.radioChoice === 1
                            onSelected: root.radioChoice = 1
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Text { text: "动画强度"; color: palette.muted; font.pixelSize: 12 }
                        Kit.MvSlider {
                            value: root.progressValue * 100
                            Layout.fillWidth: true
                            onValueChanged: root.progressValue = value / 100
                        }
                    }
                }

                Kit.MvPanel {
                    title: "导航与列表"
                    subtitle: "用于文件管理、设置侧栏和层级导航。"
                    Layout.fillWidth: true

                    Kit.MvBreadcrumb {
                        items: ["工作台", "资料库", "成绩分析"]
                    }

                    Kit.MvTabBar {
                        tabs: ["概览", "文件", "活动"]
                        currentIndex: root.tabChoice
                        onSelected: root.tabChoice = index
                    }

                    Kit.MvListItem {
                        iconText: "▤"
                        title: "学生成绩分析"
                        subtitle: "3 个图表 · 12 条洞察"
                        selected: root.tabChoice === 0
                        Layout.fillWidth: true
                    }

                    Kit.MvListItem {
                        iconText: "□"
                        title: "产品复盘资料"
                        subtitle: "最近编辑于 09:41"
                        Layout.fillWidth: true
                    }
                }

                Kit.MvPanel {
                    title: "工具栏与菜单"
                    subtitle: "常用命令、图标按钮、菜单和即时反馈。"
                    Layout.fillWidth: true

                    Kit.MvToolbar {
                        Layout.fillWidth: true

                        Kit.MvIconButton { iconText: "↺" }
                        Kit.MvIconButton { iconText: "↻" }
                        Kit.MvDivider {
                            vertical: true
                            Layout.fillHeight: true
                        }
                        Kit.MvButton {
                            text: "保存"
                            iconText: "✓"
                            onClicked: {
                                toast.text = "已保存"
                                toast.open = true
                                toastTimer.restart()
                            }
                        }
                        Kit.MvMenuButton {
                            text: "更多"
                            options: ["重命名", "复制", "删除"]
                            onSelected: function(option) {
                                toast.text = option
                                toast.open = true
                                toastTimer.restart()
                            }
                        }
                    }

                    RowLayout {
                        spacing: 10

                        Kit.MvButton {
                            text: "打开弹窗"
                            accent: true
                            onClicked: sampleDialog.open()
                        }

                        Kit.MvButton {
                            text: "显示提示"
                            onClicked: {
                                toast.text = "任务已加入队列"
                                toast.open = true
                                toastTimer.restart()
                            }
                        }
                    }
                }

                Kit.MvPanel {
                    title: "进度与状态"
                    subtitle: "适合下载、同步、连接状态和后台任务。"
                    Layout.fillWidth: true

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Kit.MvSpinner { running: true }
                        Kit.MvStatusDot { text: "正在同步"; color: palette.accent }
                        Kit.MvBadge { text: Math.round(root.progressValue * 100) + "%" }
                    }

                    Kit.MvProgressBar {
                        value: root.progressValue
                        Layout.fillWidth: true
                    }
                }

                Kit.MvPanel {
                    title: "表格"
                    subtitle: "轻量数据预览，适合管理台和本地任务列表。"
                    Layout.fillWidth: true

                    Kit.MvTable {
                        headers: ["名称", "状态", "负责人"]
                        rows: [
                            ["成绩分析", "已完成", "Marvis"],
                            ["桌面整理", "运行中", "本机"],
                            ["CS2 更新", "等待", "Steam"]
                        ]
                        Layout.fillWidth: true
                        Layout.preferredHeight: 156
                    }
                }

                Kit.MvPanel {
                    title: "多行文本"
                    subtitle: "用于备注、任务描述和 AI 回复编辑。"
                    Layout.fillWidth: true

                    Kit.MvTextArea {
                        text: "把本周的学习资料整理成摘要，并标记需要复习的知识点。"
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 210; easing.type: Easing.OutCubic }
    }

    Behavior on scale {
        NumberAnimation { duration: 210; easing.type: Easing.OutCubic }
    }
}
