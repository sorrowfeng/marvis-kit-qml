import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MarvisKit 1.0 as Kit

Item {
    id: root

    property int radioChoice: 0
    property int tabChoice: 0
    property real progressValue: 0.68
    property int stepperValue: 24
    property int currentPage: 2
    property bool treeExpanded: true
    property color selectedSwatch: "#2f7cff"
    property bool notificationVisible: true
    property bool quickFileSelected: false
    property bool markIconActive: false
    property bool closeIconActive: false
    property bool gameClaimed: true
    property int selectedDayIndex: 2
    property string selectedFeatureCard: "MAYDAY超话"
    property string selectedFileCard: "Counter-Strike 2"
    property int selectedSegment: 0
    property bool syncEnabled: true
    property bool restoreOnLaunch: true
    property string selectedListItem: "学生成绩分析"
    property bool allChipSelected: true
    property bool localChipSelected: false
    property bool highChipVisible: true
    property bool drawerReminder: true
    property bool drawerWifiOnly: false
    property bool openComboForScreenshot: Qt.application.arguments.indexOf("--open-combo") >= 0
    property bool showExpandedControlsForScreenshot: Qt.application.arguments.indexOf("--expanded-controls") >= 0
    property bool openMenuForScreenshot: Qt.application.arguments.indexOf("--open-menu") >= 0
    property bool openDialogForScreenshot: Qt.application.arguments.indexOf("--open-dialog") >= 0
    property bool openDrawerForScreenshot: Qt.application.arguments.indexOf("--open-drawer") >= 0
    property int shellInset: 8
    property int shellRadius: 36

    Kit.MarvisPalette { id: palette }

    function showToast(message) {
        toast.text = message
        toast.open = true
        toastTimer.restart()
    }

    Timer {
        interval: 520
        running: root.openComboForScreenshot || root.showExpandedControlsForScreenshot || root.openMenuForScreenshot || root.openDialogForScreenshot || root.openDrawerForScreenshot
        repeat: false
        onTriggered: {
            if (root.openComboForScreenshot) {
                componentScroll.contentItem.contentY = Math.max(0, selectionPanel.y - 80)
                themeCombo.popup.open()
            } else if (root.openMenuForScreenshot) {
                componentScroll.contentItem.contentY = Math.max(0, toolbarMenuPanel.y - 100)
                moreMenu.openMenu()
            } else if (root.openDialogForScreenshot) {
                componentScroll.contentItem.contentY = Math.max(0, toolbarMenuPanel.y - 100)
                sampleDialog.open()
            } else if (root.openDrawerForScreenshot) {
                componentScroll.contentItem.contentY = Math.max(0, overlayPanel.y - 100)
                sampleDrawer.open()
            } else {
                componentScroll.contentItem.contentY = Math.max(0, tagStepperPanel.y - 80)
            }
        }
    }

    Timer {
        id: toastTimer
        interval: 1800
        onTriggered: toast.open = false
    }

    Kit.MvDialog {
        id: sampleDialog
        x: (root.width - width) / 2
        y: (root.height - height) / 2
        overlayInset: root.shellInset
        overlayRadius: root.shellRadius
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

    Kit.MvPopover {
        id: samplePopover
        x: Math.max(260, root.width / 2 - width / 2)
        y: 110
        title: "浮层操作"
        message: "Popover 适合承载说明、快捷动作、筛选条件和轻量表单。"

        Kit.MvButton {
            text: "知道了"
            quiet: true
            Layout.alignment: Qt.AlignRight
            onClicked: {
                root.showToast("已关闭 Popover")
                samplePopover.close()
            }
        }
    }

    Kit.MvDrawer {
        id: sampleDrawer
        parent: Overlay.overlay
        overlayInset: root.shellInset
        overlayRadius: root.shellRadius
        title: "任务详情"

        Kit.MvTextField {
            text: "更新电脑里的 CS2"
            Layout.fillWidth: true
        }

        Kit.MvTextArea {
            text: "自动打开 Steam，检查更新状态，并在完成后显示通知。"
            Layout.fillWidth: true
        }

        Kit.MvAccordion {
            title: "更多选项"
            subtitle: "展开后显示后台任务配置。"
            expanded: true
            Layout.fillWidth: true

            Kit.MvCheckbox {
                text: "完成后提醒我"
                checked: root.drawerReminder
                onToggled: function(checked) {
                    root.drawerReminder = checked
                    root.showToast(checked ? "完成后会提醒" : "完成后不提醒")
                }
            }
            Kit.MvCheckbox {
                text: "仅在 Wi-Fi 下执行"
                checked: root.drawerWifiOnly
                onToggled: function(checked) {
                    root.drawerWifiOnly = checked
                    root.showToast(checked ? "仅 Wi-Fi 执行" : "任意网络执行")
                }
            }
        }
    }

    ScrollView {
        id: componentScroll
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
                            onClicked: root.showToast("已打开示例动作")
                        }

                        Kit.MvButton {
                            text: root.quickFileSelected ? "已选择" : "选择文件"
                            iconText: root.quickFileSelected ? "✓" : "+"
                            Layout.preferredWidth: 98
                            onClicked: {
                                root.quickFileSelected = !root.quickFileSelected
                                root.showToast(root.quickFileSelected ? "已选择文件" : "已取消选择")
                            }
                        }

                        Kit.MvButton {
                            text: "更多"
                            quiet: true
                            Layout.preferredWidth: 72
                            onClicked: root.showToast("更多动作")
                        }

                        Kit.MvIconButton {
                            iconText: "◦"
                            selected: root.markIconActive
                            onClicked: {
                                root.markIconActive = !root.markIconActive
                                root.showToast(root.markIconActive ? "已标记" : "已取消标记")
                            }
                        }
                        Kit.MvIconButton {
                            iconText: "×"
                            selected: root.closeIconActive
                            onClicked: {
                                root.closeIconActive = !root.closeIconActive
                                root.showToast(root.closeIconActive ? "已收起" : "已恢复")
                            }
                        }
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
                                id: dayCell

                                readonly property bool active: index === root.selectedDayIndex

                                width: active ? 44 : 30
                                height: 66
                                radius: 13
                                color: active ? "#ffffff" : dayMouse.containsMouse ? "#f7f8fa" : "transparent"
                                border.width: 0

                                Rectangle {
                                    visible: parent.active
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
                                        color: dayCell.active ? "#ff4d73" : "#a7a29d"
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

                                MouseArea {
                                    id: dayMouse
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        root.selectedDayIndex = index
                                        root.showToast("已选择日程 " + modelData.day + " " + modelData.num)
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: gameDealCard

                        Layout.fillWidth: true
                        Layout.preferredHeight: 66
                        radius: 18
                        color: gameDealMouse.containsMouse ? "#eeeeed" : "#f4f3f1"

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
                                    text: root.gameClaimed ? "已领取" : "提醒我"
                                    color: palette.ink
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                }
                            }
                        }

                        MouseArea {
                            id: gameDealMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                root.gameClaimed = !root.gameClaimed
                                root.showToast(root.gameClaimed ? "已领取游戏" : "已设置提醒")
                            }
                        }

                        Behavior on color { ColorAnimation { duration: 140; easing.type: Easing.OutCubic } }
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
                            id: maydayCard

                            Layout.fillWidth: true
                            Layout.preferredHeight: 190
                            radius: 20
                            color: maydayMouse.containsMouse ? "#fdfdfc" : "#ffffff"
                            border.width: 1
                            border.color: root.selectedFeatureCard === "MAYDAY超话" ? "#cfe0ff" : "#eeeae4"

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

                            MouseArea {
                                id: maydayMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    root.selectedFeatureCard = "MAYDAY超话"
                                    root.showToast("已选择 MAYDAY 超话")
                                }
                            }
                        }

                        Rectangle {
                            id: albumCard

                            Layout.fillWidth: true
                            Layout.preferredHeight: 190
                            radius: 20
                            color: albumMouse.containsMouse ? "#fdfdfc" : "#ffffff"
                            border.width: 1
                            border.color: root.selectedFeatureCard === "五迷共享相册" ? "#cfe0ff" : "#eeeae4"

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

                            MouseArea {
                                id: albumMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    root.selectedFeatureCard = "五迷共享相册"
                                    root.showToast("已选择共享相册")
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
                        selected: root.selectedFileCard === title
                        Layout.fillWidth: true
                        onClicked: {
                            root.selectedFileCard = title
                            root.showToast("已选择 " + title)
                        }
                    }

                    Kit.MvFileCard {
                        title: "产品复盘资料"
                        subtitle: "文档 · 已生成 8 条洞察"
                        fileType: "DOC"
                        selected: root.selectedFileCard === title
                        Layout.fillWidth: true
                        onClicked: {
                            root.selectedFileCard = title
                            root.showToast("已选择 " + title)
                        }
                    }
                }

                Kit.MvPanel {
                    id: selectionPanel
                    title: "选择与设置"
                    subtitle: "覆盖桌面设置页常用的分段、下拉、勾选、单选、开关和滑杆。"
                    Layout.fillWidth: true

                    Kit.MvSegmentedControl {
                        options: ["通用", "安全", "高级"]
                        currentIndex: root.selectedSegment
                        Layout.fillWidth: true
                        onSelected: function(index) {
                            root.selectedSegment = index
                            root.showToast("已切换到：" + options[index])
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Kit.MvComboBox {
                            id: themeCombo
                            model: ["跟随系统", "浅色", "深色"]
                            Layout.fillWidth: true
                            onActivated: root.showToast("主题：" + currentText)
                        }

                        RowLayout {
                            spacing: 8
                            Kit.MvToggle {
                                checked: root.syncEnabled
                                onToggled: function(checked) {
                                    root.syncEnabled = checked
                                    root.showToast(checked ? "自动同步已开启" : "自动同步已关闭")
                                }
                            }
                            Text { text: root.syncEnabled ? "自动同步" : "手动同步"; color: palette.text; font.pixelSize: 13 }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 20

                        Kit.MvCheckbox {
                            text: "启动时恢复窗口"
                            checked: root.restoreOnLaunch
                            onToggled: function(checked) {
                                root.restoreOnLaunch = checked
                                root.showToast(checked ? "启动时恢复窗口" : "启动时不恢复窗口")
                            }
                        }

                        Kit.MvRadio {
                            text: "本地优先"
                            checked: root.radioChoice === 0
                            onSelected: {
                                root.radioChoice = 0
                                root.showToast("已选择本地优先")
                            }
                        }

                        Kit.MvRadio {
                            text: "云端优先"
                            checked: root.radioChoice === 1
                            onSelected: {
                                root.radioChoice = 1
                                root.showToast("已选择云端优先")
                            }
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
                            onMoved: root.showToast("动画强度 " + Math.round(value) + "%")
                        }
                    }
                }

                Kit.MvPanel {
                    title: "导航与列表"
                    subtitle: "用于文件管理、设置侧栏和层级导航。"
                    Layout.fillWidth: true

                    Kit.MvBreadcrumb {
                        items: ["工作台", "资料库", "成绩分析"]
                        onSelected: function(index, item) {
                            root.showToast("跳转到：" + item)
                        }
                    }

                    Kit.MvTabBar {
                        tabs: ["概览", "文件", "活动"]
                        currentIndex: root.tabChoice
                        onSelected: {
                            root.tabChoice = index
                            root.showToast("已切换：" + tabs[index])
                        }
                    }

                    Kit.MvListItem {
                        iconText: "▤"
                        title: "学生成绩分析"
                        subtitle: "3 个图表 · 12 条洞察"
                        selected: root.selectedListItem === title
                        Layout.fillWidth: true
                        onClicked: {
                            root.selectedListItem = title
                            root.showToast("已打开：" + title)
                        }
                    }

                    Kit.MvListItem {
                        iconText: "□"
                        title: "产品复盘资料"
                        subtitle: "最近编辑于 09:41"
                        selected: root.selectedListItem === title
                        Layout.fillWidth: true
                        onClicked: {
                            root.selectedListItem = title
                            root.showToast("已打开：" + title)
                        }
                    }
                }

                Kit.MvPanel {
                    id: toolbarMenuPanel
                    title: "工具栏与菜单"
                    subtitle: "常用命令、图标按钮、菜单和即时反馈。"
                    Layout.fillWidth: true

                    Kit.MvToolbar {
                        Layout.fillWidth: true

                        Kit.MvIconButton {
                            iconText: "↺"
                            onClicked: root.showToast("已撤销一步")
                        }
                        Kit.MvIconButton {
                            iconText: "↻"
                            onClicked: root.showToast("已重做一步")
                        }
                        Kit.MvDivider {
                            vertical: true
                            Layout.fillHeight: true
                        }
                        Kit.MvButton {
                            text: "保存"
                            iconText: "✓"
                            onClicked: root.showToast("已保存")
                        }
                        Kit.MvMenuButton {
                            id: moreMenu
                            text: "更多"
                            options: ["重命名", "复制", "删除"]
                            onSelected: function(option) {
                                root.showToast(option)
                            }
                        }
                    }

                    RowLayout {
                        spacing: 10

                        Kit.MvButton {
                            text: "打开弹窗"
                            accent: true
                            onClicked: {
                                root.showToast("打开确认弹窗")
                                sampleDialog.open()
                            }
                        }

                        Kit.MvButton {
                            text: "显示提示"
                            onClicked: root.showToast("任务已加入队列")
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
                        selectedRow: 1
                        rows: [
                            ["成绩分析", "已完成", "Marvis"],
                            ["桌面整理", "运行中", "本机"],
                            ["CS2 更新", "等待", "Steam"]
                        ]
                        Layout.fillWidth: true
                        onRowClicked: function(row, rowData) {
                            root.showToast("已选择：" + rowData[0])
                        }
                        onHeaderClicked: function(column, header) {
                            root.showToast("按" + header + "排序")
                        }
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

                Kit.MvPanel {
                    id: tagStepperPanel
                    title: "标签、数值与分页"
                    subtitle: "标签可选择/删除，Stepper 和 Pagination 会更新真实状态。"
                    Layout.fillWidth: true

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Kit.MvChip {
                            text: "全部"
                            selected: root.allChipSelected
                            variant: "accent"
                            onClicked: {
                                root.allChipSelected = selected
                                root.showToast(selected ? "已选择全部" : "已取消全部")
                            }
                        }
                        Kit.MvChip {
                            text: "本地"
                            selected: root.localChipSelected
                            variant: "neutral"
                            onClicked: {
                                root.localChipSelected = selected
                                root.showToast(selected ? "已筛选本地" : "已取消本地筛选")
                            }
                        }
                        Kit.MvChip {
                            text: "高优先级"
                            variant: "warning"
                            removable: true
                            visible: root.highChipVisible
                            selected: true
                            onClicked: root.showToast("高优先级筛选已启用")
                            onRemoved: {
                                root.highChipVisible = false
                                root.showToast("已移除标签")
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Kit.MvStepper {
                            value: root.stepperValue
                            from: 0
                            to: 100
                            suffix: "%"
                            onValueChangedByUser: function(value) {
                                root.stepperValue = value
                                root.showToast("数值：" + value + "%")
                            }
                        }

                        Kit.MvPagination {
                            currentPage: root.currentPage
                            pageCount: 5
                            onPageChanged: function(page) {
                                root.currentPage = page
                                root.showToast("第 " + page + " 页")
                            }
                        }
                    }
                }

                Kit.MvPanel {
                    title: "日期与折叠"
                    subtitle: "日历支持切换月份和选择日期，Accordion 带展开动画。"
                    Layout.fillWidth: true

                    Kit.MvAccordion {
                        title: "同步任务设置"
                        subtitle: "点击标题展开或收起。"
                        expanded: true
                        Layout.fillWidth: true
                        onToggled: function(expanded) {
                            root.showToast(expanded ? "已展开同步设置" : "已收起同步设置")
                        }

                        Kit.MvToggle {
                            checked: root.drawerReminder
                            onToggled: function(checked) {
                                root.drawerReminder = checked
                                root.showToast(checked ? "同步提醒已开启" : "同步提醒已关闭")
                            }
                        }
                        Kit.MvTextField {
                            text: "每日 20:30"
                            Layout.fillWidth: true
                            onAccepted: root.showToast("已设置同步时间：" + text)
                        }
                    }

                    Kit.MvCalendar {
                        Layout.alignment: Qt.AlignHCenter
                        onSelected: function(date) {
                            root.showToast(Qt.formatDate(date, "MM-dd"))
                        }
                    }
                }

                Kit.MvPanel {
                    id: overlayPanel
                    title: "浮层与通知"
                    subtitle: "Popover、Drawer 和 Notification 覆盖桌面应用常见反馈与详情面板。"
                    Layout.fillWidth: true

                    Kit.MvNotification {
                        visible: root.notificationVisible
                        title: "更新已准备好"
                        message: "后台任务已完成校验，可以继续安装。"
                        tone: "success"
                        actionText: "查看"
                        Layout.fillWidth: true
                        onActionClicked: {
                            root.showToast("打开任务详情")
                            sampleDrawer.open()
                        }
                        onDismissed: {
                            root.notificationVisible = false
                            root.showToast("通知已关闭")
                        }
                    }

                    RowLayout {
                        spacing: 10

                        Kit.MvButton {
                            text: "打开 Popover"
                            onClicked: {
                                root.showToast("打开 Popover")
                                samplePopover.open()
                            }
                        }

                        Kit.MvButton {
                            text: "打开 Drawer"
                            accent: true
                            onClicked: {
                                root.showToast("打开 Drawer")
                                sampleDrawer.open()
                            }
                        }

                        Kit.MvButton {
                            text: "恢复通知"
                            quiet: true
                            onClicked: {
                                root.notificationVisible = true
                                root.showToast("通知已恢复")
                            }
                        }
                    }
                }

                Kit.MvPanel {
                    title: "树、命令与视觉选择"
                    subtitle: "文件树、命令项、快捷键、头像组和颜色选择均有交互状态。"
                    Layout.fillWidth: true

                    Kit.MvTreeItem {
                        title: "项目资料"
                        iconText: "▤"
                        hasChildren: true
                        expanded: root.treeExpanded
                        selected: true
                        Layout.fillWidth: true
                        onToggled: function(expanded) {
                                        root.treeExpanded = expanded
                                        root.showToast(expanded ? "已展开项目资料" : "已收起项目资料")
                                    }
                    }

                    Kit.MvTreeItem {
                        visible: root.treeExpanded
                        depth: 1
                        title: "成绩分析报告.doc"
                        subtitle: "刚刚更新"
                        iconText: "□"
                        Layout.fillWidth: true
                        onClicked: root.showToast("已打开成绩分析报告")
                    }

                    Kit.MvCommandItem {
                        iconText: "⌕"
                        title: "搜索本地知识库"
                        subtitle: "在文件、应用和历史对话中查找"
                        shortcut: ["Ctrl", "K"]
                        Layout.fillWidth: true
                        onTriggered: {
                            root.showToast("命令已触发")
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10

                        Kit.MvAvatarGroup {
                            avatars: [
                                { text: "M", color: "#edf4ff", foreground: "#2f7cff" },
                                { text: "A", color: "#f7f0e8", foreground: "#b86b13" },
                                { text: "K", color: "#eaf8f2", foreground: "#16885e" }
                            ]
                        }

                        Kit.MvShortcut { keys: ["Alt", "Enter"] }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Kit.MvColorSwatch {
                            label: "蓝色"
                            swatchColor: "#2f7cff"
                            selected: root.selectedSwatch === swatchColor
                            onClicked: function(color) {
                                root.selectedSwatch = color
                                root.showToast("已选择蓝色")
                            }
                        }

                        Kit.MvColorSwatch {
                            label: "绿色"
                            swatchColor: "#12a174"
                            selected: root.selectedSwatch === swatchColor
                            onClicked: function(color) {
                                root.selectedSwatch = color
                                root.showToast("已选择绿色")
                            }
                        }

                        Kit.MvColorSwatch {
                            label: "橙色"
                            swatchColor: "#d9851f"
                            selected: root.selectedSwatch === swatchColor
                            onClicked: function(color) {
                                root.selectedSwatch = color
                                root.showToast("已选择橙色")
                            }
                        }
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
