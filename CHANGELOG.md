# Changelog

## 0.2.6

- Fixed the chat page background so it no longer paints over the desktop shell's bottom-right corner.
- Added shell-aware radius and inset handling for maximized windows.
- Added native-feeling frameless window controls: title-bar double-click maximize/restore and edge/corner resize hit zones.

## 0.2.5

- Fixed `MvTable` row clipping and tightened header/cell alignment by giving columns equal layout widths and enforcing the table's minimum height.

## 0.2.4

- Added slide-in and slide-out edge transitions to `MvDrawer` while preserving the rounded-shell overlay behavior.

## 0.2.3

- Fixed GitHub Actions Windows builds by pinning `windows-2022`, setting up the MSVC developer environment explicitly, and building with Ninja instead of the Visual Studio generator.

## 0.2.2

- Kept modal dialog and drawer dim overlays inside the rounded desktop shell so opening them no longer squares off the main window corners.
- Adjusted drawer placement and outer corner radii to preserve the window chrome when the drawer is attached to the window overlay.
- Added gallery screenshot hooks for dialog and drawer overlay checks.

## 0.2.1

- Replaced the native menu surface in `MvMenuButton` with a rounded MarvisKit popup, including hover, pressed, selected, and open/close animation states.
- Added interactive row selection, header sorting, and click signals to `MvTable`.
- Updated the gallery examples to demonstrate the custom menu popup and table feedback.

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
