# Components

MarvisKit uses the `Mv` prefix for reusable controls and `MarvisPalette` for shared colors.

## Foundation

- `MarvisPalette`: shared color tokens.
- `MvPanel`: rounded panel with optional title and subtitle.
- `MvFrame`: lightweight bordered content frame.
- `MvGroupBox`: titled grouped settings container.
- `MvCard`: compact content card.
- `MvDivider`: horizontal or vertical divider.
- `MvAccordion`: expandable/collapsible content section.

## Actions

- `MvButton`: pill button with `secondary`, `primary`, `danger`, and `ghost` variants. Also supports `accent` and `quiet`.
- `MvIconButton`: compact square icon button.
- `MvMenuButton`: button with a custom rounded popup menu, selected state, and pressed/hover feedback.
- `MvToolbar`: rounded command toolbar.
- `MvCommandItem`: command-palette row with shortcut support.

## Inputs

- `MvTextField`: single-line text input.
- `MvTextArea`: multi-line text input.
- `MvSearchField`: search input.
- `MvComboBox`: styled combo box.
- `MvSlider`: styled slider.
- `MvRangeSlider`: two-handle range slider.
- `MvDial`: circular value input.
- `MvStepper`: increment/decrement numeric input.
- `MvCalendar`: month calendar with day selection.

## Selection

- `MvChip`: selectable/removable tag chip with tone variants.
- `MvToggle`: switch control.
- `MvCheckbox`: checkbox control.
- `MvRadio`: radio control.
- `MvSegmentedControl`: pill segmented selector.
- `MvTabBar`: tab selector.
- `MvPagination`: compact page selector.
- `MvPageIndicator`: compact carousel/page indicator dots.
- `MvColorSwatch`: color choice chip.

## Feedback

- `MvBadge`: small label badge.
- `MvStatusDot`: status indicator with text.
- `MvProgressBar`: progress indicator.
- `MvSpinner`: loading spinner.
- `MvToast`: transient notification surface.
- `MvNotification`: dismissible notification/action card.
- `MvDialog`: modal dialog with rounded-shell-aware dim overlay.
- `MvPopover`: lightweight contextual floating panel.
- `MvDrawer`: animated side drawer for detail/editing flows, with rounded-shell-aware dim overlay.
- `MvToolTip`: dark compact helper tooltip popup.

## Content

- `MvAvatar`: circular avatar.
- `MvAvatarGroup`: overlapping avatar stack.
- `MvFileCard`: file or app card.
- `MvListItem`: sidebar/list row.
- `MvNavItem`: navigation row.
- `MvMessageBubble`: chat message bubble.
- `MvBreadcrumb`: breadcrumb trail.
- `MvTable`: interactive data table with selectable rows and sortable headers.
- `MvTreeItem`: expandable tree/file row.
- `MvShortcut`: shortcut keycap group.
- `MvScrollBar`: styled vertical or horizontal scrollbar.
- `MvSplitView`: styled split-pane container handle.

## API Style

Controls favor predictable property names:

- Labels: `text`, `title`, `subtitle`
- Icons: `iconText`
- State: `selected`, `checked`, `expanded`, `currentIndex`, `currentPage`, `value`, `first.value`, `second.value`, `overlayInset`, `overlayRadius`
- Actions: `clicked`, `selected`, `toggled`, `triggered`, `dismissed`, `pageChanged`, `rowClicked`, `headerClicked`
