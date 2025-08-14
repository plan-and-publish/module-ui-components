import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

enum PopupIconSize {
  small,
  medium,
}

enum PopupAction {
  openPopup,
  selectButton,
}

class PAPPopupButton extends StatefulWidget {
  const PAPPopupButton({
    this.popupItems,
    this.menuWidth = _defaultMenuWidth,
    this.menuItemType = ContextMenuItemType.doubleLineContext,
    this.controller,
    this.popupIconSize = PopupIconSize.medium,
    this.buttonAction = PopupAction.openPopup,
    this.onTap,
    this.child,
    this.icon,
    this.isSelected = false,
    this.isEnabled = true,
    this.menu,
    this.customHorizontalOffset = false,
    super.key,
  })  : assert(
          (icon != null && child == null) || (icon == null && child != null),
          'Either icon or child should be provided, but not both',
        ),
        assert(
          (popupItems != null && menu == null) ||
              (popupItems == null && menu != null),
          'Either popupItems or menu should be provided, but not both',
        );

  final double menuWidth;
  final ContextMenuItemType menuItemType;
  final CustomPopupMenuController? controller;
  final List<PopupButtonAction>? popupItems;
  final PopupIconSize popupIconSize;
  final PopupAction buttonAction;
  final VoidCallback? onTap;
  final IconData? icon;
  final Widget? child;
  final bool isSelected;
  final bool isEnabled;
  final Widget? menu;
  final bool customHorizontalOffset;

  static const _defaultMenuWidth = 301.0;

  @override
  State<PAPPopupButton> createState() => _PAPPopupButtonState();
}

class _PAPPopupButtonState extends State<PAPPopupButton> {
  static const _yOffset = 8.0;
  static const _menuMexHeight = 428.0;
  static const _menuVerticalOffset = 44.0;
  static const _iconContainerRadius = 4.0;
  static const _iconMediumContainerSize = 40.0;
  static const _iconSmallContainerSize = 32.0;
  static const _iconSelectedContainerWidth = 56.0;
  static const _iconMediumSize = 20.0;
  static const _iconSmallSize = 16.0;
  static const _popupMenuPadding = EdgeInsets.symmetric(vertical: 8.0);

  var _isHovered = false;
  var _isMenuOpen = false;
  late final CustomPopupMenuController _controller;
  late final LayerLink _layerLink;
  late final Offset _menuAsFollowerOffset;
  late final double _buttonWidth;

  @override
  void initState() {
    super.initState();
    _buttonWidth = widget.isSelected
        ? _iconSelectedContainerWidth
        : widget.popupIconSize == PopupIconSize.medium
            ? _iconMediumContainerSize
            : _iconSmallContainerSize;
    _menuAsFollowerOffset =
        Offset(-(widget.menuWidth - _buttonWidth), _menuVerticalOffset);
    _controller = widget.controller ?? CustomPopupMenuController();
    _layerLink = LayerLink();
  }

  @override
  void dispose() {
    if (_controller.menuIsShowing) {
      _controller.hideMenu();
    }
    // if the external controller is not assigned,
    // we use an internal controller and dispose it here.
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return CustomPopupMenu(
      controller: _controller,
      position: PreferredPosition.bottom,
      showArrow: false,
      verticalMargin: _yOffset,
      enablePassEvent: false,
      barrierColor: appTheme.colors.transparent,
      menuOnChange: (isOpen) {
        setState(() => _isMenuOpen = isOpen);
      },
      menuBuilder: () => _buildPopupMenu(appTheme: appTheme),
      pressType: PressType.singleClick,
      child: _buildPopupChild(appTheme: appTheme),
    );
  }

  Widget _buildPopupChild({required IAppThemeData appTheme}) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child ??
          MouseRegion(
            cursor:
                widget.isEnabled ? MouseCursor.defer : MouseCursor.uncontrolled,
            onEnter: (event) {
              if (widget.isEnabled && !_isHovered) {
                setState(() => _isHovered = true);
              }
            },
            onExit: (_) {
              if (widget.isEnabled) {
                setState(() => _isHovered = false);
              }
            },
            child: GestureDetector(
              onTap: widget.buttonAction == PopupAction.selectButton
                  ? widget.onTap
                  : null,
              child: Container(
                width: _buttonWidth,
                height: widget.popupIconSize == PopupIconSize.medium
                    ? _iconMediumContainerSize
                    : _iconSmallContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_iconContainerRadius),
                  color: !widget.isEnabled
                      ? appTheme.colors.plainBackgroundDisabled
                      : widget.isSelected
                          ? appTheme.colors.plainBackgroundPressed
                          : _isHovered
                              ? appTheme.colors.plainBackgroundHovered
                              : appTheme.colors.plainBackgroundDefault,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: !widget.isEnabled
                          ? appTheme.colors.plainTextDisabled
                          : widget.isSelected
                              ? appTheme.colors.plainTextPressed
                              : _isHovered
                                  ? appTheme.colors.plainTextHovered
                                  : appTheme.colors.plainText,
                      size: widget.popupIconSize == PopupIconSize.medium
                          ? _iconMediumSize
                          : _iconSmallSize,
                    ),
                    if (widget.isSelected)
                      Icon(
                        _isMenuOpen
                            ? appTheme.icons.arrowChevronUp
                            : appTheme.icons.arrowChevronDown,
                        color: !widget.isEnabled
                            ? appTheme.colors.plainTextDisabled
                            : _isHovered
                                ? appTheme.colors.plainTextHovered
                                : _isMenuOpen
                                    ? appTheme.colors.plainTextPressed
                                    : appTheme.colors.plainText,
                        size: _iconMediumSize,
                      ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildPopupMenu({required IAppThemeData appTheme}) {
    if (widget.isEnabled && widget.buttonAction == PopupAction.openPopup) {
      return widget.customHorizontalOffset
          ? CompositedTransformFollower(
              link: _layerLink,
              offset: _menuAsFollowerOffset,
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: _menuMexHeight,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => _controller.hideMenu(),
                      child: Container(
                        width: widget.menuWidth - _buttonWidth,
                        color: appTheme.colors.transparent,
                      ),
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () => _controller.hideMenu(),
                          child: Container(
                            width: widget.menuWidth,
                            color: appTheme.colors.transparent,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: _buildMenu(appTheme),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : _buildMenu(appTheme);
    }
    return Container();
  }

  Widget _buildMenu(IAppThemeData appTheme) {
    return widget.menu != null
        ? SizedBox(
            width: widget.menuWidth,
            child: widget.menu,
          )
        : Container(
            width: widget.menuWidth,
            padding: _popupMenuPadding,
            decoration: appTheme.contextMenuDecoration,
            child: Column(
              children: widget.popupItems!
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        _controller.hideMenu();
                        e.onTap?.call();
                      },
                      child: PAPContextMenuItem(
                        title: e.title,
                        icon: e.icon,
                        subtitle: e.subtitle,
                        menuItemType: e.itemType,
                        menuItemStyle: e.itemStyle,
                        isEnabled: e.onTap != null,
                        isSelected: e.isSelected,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
  }
}

class PopupButtonAction {
  PopupButtonAction({
    this.onTap,
    this.child,
    this.icon,
    this.isSelected = false,
    this.isEnable = true,
    this.title,
    this.animatedIcon,
    this.itemType = ContextMenuItemType.singleLineContext,
    this.itemStyle = ContextMenuItemStyle.normal,
    this.subtitle,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnable;
  final Widget? child;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final String? animatedIcon;
  final ContextMenuItemType itemType;
  final ContextMenuItemStyle itemStyle;
}
