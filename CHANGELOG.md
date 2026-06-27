# Changelog

## 0.2.0

- Added common desktop controls: `MvAccordion`, `MvAvatarGroup`, `MvCalendar`, `MvChip`, `MvColorSwatch`, `MvCommandItem`, `MvDrawer`, `MvNotification`, `MvPagination`, `MvPopover`, `MvShortcut`, `MvStepper`, and `MvTreeItem`.
- Expanded the gallery with interactive examples for tag selection/removal, numeric stepping, pagination, collapsible sections, date selection, notifications, drawers, popovers, tree rows, command rows, shortcut keycaps, avatar groups, and color swatches.
- Updated component documentation to reflect the broader desktop-control surface.

## 0.1.2

- Fixed hover flicker caused by animating from transparent black to hover colors.
- Moved darker interaction colors to pressed/down states only.

## 0.1.1

- Fixed gallery window corners by disabling native DWM rounding and removing the aliased `QWindow` mask.
- Improved antialiasing for rounded controls and the gallery shell.
- Removed hover-driven geometry changes that could cause flickering.
- Centered button content more consistently.
- Added a styled `MvComboBox` popup with matching delegate, selection, and open animations.

## 0.1.0

- Initial MarvisKit QML module.
- Added reusable desktop controls and a gallery example.
- Added Windows rounded gallery window chrome.
- Added documentation, CI, license, and contribution files.
