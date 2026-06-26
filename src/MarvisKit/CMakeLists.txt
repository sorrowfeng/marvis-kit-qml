qt_add_library(MarvisKit STATIC)

qt_add_qml_module(MarvisKit
    URI MarvisKit
    VERSION 1.0
    QML_FILES
        MarvisPalette.qml
        MvAvatar.qml
        MvBadge.qml
        MvBreadcrumb.qml
        MvButton.qml
        MvCard.qml
        MvCheckbox.qml
        MvComboBox.qml
        MvDialog.qml
        MvDivider.qml
        MvFileCard.qml
        MvIconButton.qml
        MvListItem.qml
        MvMenuButton.qml
        MvMessageBubble.qml
        MvNavItem.qml
        MvPanel.qml
        MvProgressBar.qml
        MvRadio.qml
        MvSearchField.qml
        MvSegmentedControl.qml
        MvSlider.qml
        MvSpinner.qml
        MvStatusDot.qml
        MvTabBar.qml
        MvTable.qml
        MvTextArea.qml
        MvTextField.qml
        MvToast.qml
        MvToggle.qml
        MvToolbar.qml
)

target_link_libraries(MarvisKit
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
)
