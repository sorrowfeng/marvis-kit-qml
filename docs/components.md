# Components

MarvisKit uses the `Mv` prefix for reusable controls and `MarvisPalette` for shared colors.

## Foundation

- `MarvisPalette`: shared color tokens.
- `MvPanel`: rounded panel with optional title and subtitle.
- `MvCard`: compact content card.
- `MvDivider`: horizontal or vertical divider.

## Actions

- `MvButton`: pill button with `secondary`, `primary`, `danger`, and `ghost` variants. Also supports `accent` and `quiet`.
- `MvIconButton`: compact square icon button.
- `MvMenuButton`: button with a popup menu.
- `MvToolbar`: rounded command toolbar.

## Inputs

- `MvTextField`: single-line text input.
- `MvTextArea`: multi-line text input.
- `MvSearchField`: search input.
- `MvComboBox`: styled combo box.
- `MvSlider`: styled slider.

## Selection

- `MvToggle`: switch control.
- `MvCheckbox`: checkbox control.
- `MvRadio`: radio control.
- `MvSegmentedControl`: pill segmented selector.
- `MvTabBar`: tab selector.

## Feedback

- `MvBadge`: small label badge.
- `MvStatusDot`: status indicator with text.
- `MvProgressBar`: progress indicator.
- `MvSpinner`: loading spinner.
- `MvToast`: transient notification surface.
- `MvDialog`: modal dialog.

## Content

- `MvAvatar`: circular avatar.
- `MvFileCard`: file or app card.
- `MvListItem`: sidebar/list row.
- `MvNavItem`: navigation row.
- `MvMessageBubble`: chat message bubble.
- `MvBreadcrumb`: breadcrumb trail.
- `MvTable`: simple data table.

## API Style

Controls favor predictable property names:

- Labels: `text`, `title`, `subtitle`
- Icons: `iconText`
- State: `selected`, `checked`, `currentIndex`, `value`
- Actions: `clicked`, `selected`, `toggled`
