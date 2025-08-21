import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

part 'pap_context_menu_item.dart';
part 'pap_context_menu_divider.dart';

class PAPContextMenu extends StatefulWidget {
  const PAPContextMenu({
    required this.actions,
    this.widget,
    this.menuOffset,
    this.menuWidth,
    this.dividerType = PAPContextMenuDividerType.line,
    this.menuItemType = ContextMenuItemType.doubleLineContext,
    this.menuShapeBorder,
    this.onMenuOpened,
    this.onMenuClosed,
    this.menuTitle,
    this.useCustomOverlay = false,
    super.key,
  });

  final List<ContextMenuAction> actions;
  final Widget? widget;
  final Offset? menuOffset;
  final double? menuWidth;
  final PAPContextMenuDividerType dividerType;
  final ContextMenuItemType menuItemType;
  final ShapeBorder? menuShapeBorder;
  final VoidCallback? onMenuOpened;
  final VoidCallback? onMenuClosed;
  final String? menuTitle;
  final bool useCustomOverlay;

  @override
  PAPContextMenuState createState() => PAPContextMenuState();
}

class PAPContextMenuState extends State<PAPContextMenu> {
  static const _menuIconSize = 20.0;
  bool _isHovered = false;
  static const _menuSize = 40.0;
  static const _menuHoverRadius = 4.0;
  static const double _titleItemHeight = 40.0;
  static const EdgeInsets _titleItemPadding = EdgeInsets.only(
    left: 16.0,
    right: 16.0,
    top: 15.0,
    bottom: 7.0,
  );
  static const _defaultMenuWidth = 238.0;
  static const _verticalMenuPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return widget.widget == null
        ? Container(
            width: _menuSize,
            height: _menuSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_menuHoverRadius),
              color: _isHovered
                  ? appTheme.colors.plainBackgroundHovered
                  : appTheme.colors.transparent,
            ),
            child: MouseRegion(
              onEnter: (_) => _setHover(true),
              onExit: (_) => _setHover(false),
              child: widget.useCustomOverlay
                  ? _customOverlayButton(
                      child: Icon(
                        appTheme.icons.menuDotsVertical,
                        size: _menuIconSize,
                        color: _isHovered
                            ? appTheme.colors.plainTextHovered
                            : appTheme.colors.plainText,
                      ),
                      appTheme: appTheme,
                    )
                  : _popupButton(
                      child: Icon(
                        appTheme.icons.menuDotsVertical,
                        size: _menuIconSize,
                        color: _isHovered
                            ? appTheme.colors.plainTextHovered
                            : appTheme.colors.plainText,
                      ),
                      appTheme: appTheme,
                    ),
            ),
          )
        : widget.useCustomOverlay
            ? _customOverlayButton(
                child: widget.widget!,
                appTheme: appTheme,
              )
            : _popupButton(
                child: widget.widget!,
                appTheme: appTheme,
              );
  }

  Widget _popupButton({
    required Widget child,
    required IAppThemeData appTheme,
  }) {
    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      color: appTheme.colors.defaultBackground,
      shape: widget.menuShapeBorder ?? appTheme.contextMenuShapeBorder,
      elevation: appTheme.contextMenuElevation,
      itemBuilder: (_) {
        return _buildItemList(appTheme);
      },
      onOpened: widget.onMenuOpened,
      onCanceled: widget.onMenuClosed,
      onSelected: (value) {
        final index = value;
        widget.actions[index].onTap?.call();
        widget.onMenuClosed?.call();
      },
      offset: widget.menuOffset ?? Offset.zero,
      constraints: widget.menuWidth != null
          ? BoxConstraints(
              maxWidth: widget.menuWidth!,
              minWidth: widget.menuWidth!,
            )
          : null,
      child: child,
    );
  }

  void _setHover(isHover) {
    setState(() {
      _isHovered = isHover;
    });
  }

  Widget _customOverlayButton({
    required Widget child,
    required IAppThemeData appTheme,
  }) {
    return GestureDetector(
      onTap: () => _showCustomOverlay(context, appTheme),
      child: child,
    );
  }

  void _showCustomOverlay(BuildContext context, IAppThemeData appTheme) {
    widget.onMenuOpened?.call();

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    // Use the root overlay to avoid clipping by parent containers
    final overlay = Overlay.of(context, rootOverlay: true);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _buildCustomOverlay(
        context: context,
        position: position,
        triggerSize: size,
        menuOffset: widget.menuOffset ?? Offset.zero,
        menuWidth: widget.menuWidth,
        appTheme: appTheme,
        actions: widget.actions,
        menuTitle: widget.menuTitle,
        menuItemType: widget.menuItemType,
        menuShapeBorder: widget.menuShapeBorder,
        onDismiss: () {
          overlayEntry.remove();
          widget.onMenuClosed?.call();
        },
        onItemSelected: (index) {
          overlayEntry.remove();
          widget.actions[index].onTap?.call();
          widget.onMenuClosed?.call();
        },
      ),
    );

    overlay.insert(overlayEntry);
  }

  Widget _buildCustomOverlay({
    required BuildContext context,
    required Offset position,
    required Size triggerSize,
    required Offset menuOffset,
    required IAppThemeData appTheme,
    required List<ContextMenuAction> actions,
    required VoidCallback onDismiss,
    required Function(int) onItemSelected,
    double? menuWidth,
    String? menuTitle,
    ContextMenuItemType menuItemType = ContextMenuItemType.doubleLineContext,
    ShapeBorder? menuShapeBorder,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final menuHeight = _calculateExactMenuHeight(
      appTheme: appTheme,
      actions: actions,
      menuTitle: menuTitle,
      menuItemType: menuItemType,
    );
    final menuPosition = _calculateOverlayMenuPosition(
      position: position,
      triggerSize: triggerSize,
      menuOffset: menuOffset,
      menuWidth: menuWidth,
      menuHeight: menuHeight,
      screenSize: screenSize,
    );

    return GestureDetector(
      onTap: onDismiss,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: menuPosition,
            child: Material(
              elevation: appTheme.contextMenuElevation,
              shape: menuShapeBorder ?? appTheme.contextMenuShapeBorder,
              color: appTheme.colors.defaultBackground,
              child: SizedBox(
                width: menuWidth ?? _defaultMenuWidth,
                height: menuHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: _verticalMenuPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildOverlayMenuItems(
                      appTheme: appTheme,
                      actions: actions,
                      menuTitle: menuTitle,
                      menuItemType: menuItemType,
                      onItemSelected: onItemSelected,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Offset _calculateOverlayMenuPosition({
    required Offset position,
    required Size triggerSize,
    required Offset menuOffset,
    required Size screenSize,
    required double menuHeight,
    double? menuWidth,
  }) {
    var x = position.dx + menuOffset.dx;
    var y = position.dy + triggerSize.height + menuOffset.dy;

    final effectiveMenuWidth = menuWidth ?? _defaultMenuWidth;
    if (x + effectiveMenuWidth > screenSize.width) {
      x = screenSize.width - effectiveMenuWidth - 8;
    }

    // Ensure menu doesn't go off screen vertically
    if (y + menuHeight > screenSize.height) {
      y = position.dy - menuHeight + menuOffset.dy;
    }

    return Offset(x, y);
  }

  double _calculateExactMenuHeight({
    required IAppThemeData appTheme,
    required List<ContextMenuAction> actions,
    required ContextMenuItemType menuItemType,
    String? menuTitle,
  }) {
    var height = _verticalMenuPadding;

    if (menuTitle != null && menuTitle.isNotEmpty) {
      height += _titleItemHeight;
    }

    for (var i = 0; i < actions.length; i++) {
      if (menuItemType == ContextMenuItemType.doubleLineContext) {
        height += appTheme.doubleLineContextItemHeight;
      } else {
        height += appTheme.singleLineContextItemHeight;
      }
    }

    return height + _verticalMenuPadding;
  }

  List<T> _buildMenuItems<T>({
    required IAppThemeData appTheme,
    required List<ContextMenuAction> actions,
    required ContextMenuItemType menuItemType,
    required T Function({
      required Widget child,
      required int index,
      required double height,
    }) itemBuilder,
    String? menuTitle,
    Function(int)? onItemSelected,
  }) {
    final items = <T>[];

    if (menuTitle != null && menuTitle.isNotEmpty) {
      final titleWidget = Container(
        height: _titleItemHeight,
        alignment: Alignment.centerLeft,
        padding: _titleItemPadding,
        child: PAPText(
          text: menuTitle,
          style: appTheme.typographies.byFontFamily().caption.copyWith(
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                color: appTheme.colors.defaultLabel,
              ),
        ),
      );

      items.add(itemBuilder(
        child: titleWidget,
        index: -1, // Special index for title
        height: _titleItemHeight,
      ));
    }

    // Add menu items
    for (var action in actions) {
      final index = actions.indexOf(action);
      final itemHeight = menuItemType == ContextMenuItemType.doubleLineContext
          ? appTheme.doubleLineContextItemHeight
          : appTheme.singleLineContextItemHeight;

      final menuItemWidget = PAPContextMenuItem(
        icon: action.icon,
        title: action.title,
        subtitle: action.subtitle,
        isEnabled: action.onTap != null,
        menuItemType: menuItemType,
        menuItemWidget: action.menuItemWidget,
        menuItemStyle: action.itemStyle ?? ContextMenuItemStyle.normal,
        isSelected: action.isSelected,
        iconSize: _menuIconSize,
      );

      items.add(itemBuilder(
        child: menuItemWidget,
        index: index,
        height: itemHeight,
      ));
    }

    return items;
  }

  List<Widget> _buildOverlayMenuItems({
    required IAppThemeData appTheme,
    required List<ContextMenuAction> actions,
    required ContextMenuItemType menuItemType,
    required Function(int) onItemSelected,
    String? menuTitle,
  }) {
    return _buildMenuItems<Widget>(
      appTheme: appTheme,
      actions: actions,
      menuItemType: menuItemType,
      menuTitle: menuTitle,
      onItemSelected: onItemSelected,
      itemBuilder: ({
        required Widget child,
        required int index,
        required double height,
      }) {
        if (index == -1) {
          return child;
        }

        return GestureDetector(
          onTap: () => onItemSelected(index),
          child: SizedBox(
            height: height,
            child: child,
          ),
        );
      },
    );
  }

  List<PopupMenuEntry<int>> _buildItemList(IAppThemeData appTheme) {
    return _buildMenuItems<PopupMenuEntry<int>>(
      appTheme: appTheme,
      actions: widget.actions,
      menuItemType: widget.menuItemType,
      menuTitle: widget.menuTitle,
      itemBuilder: ({
        required Widget child,
        required int index,
        required double height,
      }) {
        if (index == -1) {
          return PopupMenuItem<int>(
            enabled: false,
            height: height,
            padding: EdgeInsets.zero,
            child: child,
          );
        }

        return PopupMenuItem<int>(
          padding: EdgeInsets.zero,
          value: index,
          height: height,
          child: child,
        );
      },
    );
  }
}

class ContextMenuAction {
  ContextMenuAction({
    this.icon,
    this.menuItemWidget,
    this.title,
    this.animatedIcon,
    this.subtitle,
    this.onTap,
    this.itemType,
    this.itemStyle,
    this.isSelected = false,
  }) : assert(icon != null || title != null,
            'Either icon or title should be provided');

  final String? title;
  final String? subtitle;
  final String? animatedIcon;
  final IconData? icon;
  final Widget? menuItemWidget;
  final ContextMenuItemType? itemType;
  final ContextMenuItemStyle? itemStyle;
  final Function()? onTap;
  final bool isSelected;
}
