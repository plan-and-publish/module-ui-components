// ignore_for_file: avoid_bool_literals_in_conditional_expressions

part of 'pap_context_menu.dart';

enum ContextMenuItemType {
  singleLineContext,
  doubleLineContext,
  baseComponentContext,
}

enum ContextMenuItemStyle {
  normal,
  error,
}

class PAPContextMenuItem extends StatefulWidget {
  const PAPContextMenuItem({
    IconData? icon,
    Widget? menuItemWidget,
    String? animatedIcon,
    String? title,
    String? subtitle,
    bool isEnabled = true,
    bool isSelected = false,
    ContextMenuItemType menuItemType = ContextMenuItemType.doubleLineContext,
    ContextMenuItemStyle menuItemStyle = ContextMenuItemStyle.normal,
    double? iconSize,
    int? indentationLevel,
    TextStyle? titleStyle,
    super.key,
  })  : assert(
          icon != null
              ? animatedIcon != null
                  ? false
                  : true
              : true,
          'Icon and AnimatedIcon are mutually exclusive',
        ),
        _icon = icon,
        _menuItemWidget = menuItemWidget,
        _title = title,
        _subtitle = subtitle,
        _animatedIcon = animatedIcon,
        _isEnabled = isEnabled,
        _isSelected = isSelected,
        _menuItemType = menuItemType,
        _menuItemStyle = menuItemStyle,
        _iconSize = iconSize,
        _indentationLevel = indentationLevel,
        _titleStyle = titleStyle;

  final IconData? _icon;
  final Widget? _menuItemWidget;
  final String? _animatedIcon;
  final String? _title;
  final String? _subtitle;
  final bool _isEnabled;
  final bool _isSelected;
  final ContextMenuItemType _menuItemType;
  final ContextMenuItemStyle _menuItemStyle;
  final double? _iconSize;
  final int? _indentationLevel;
  final TextStyle? _titleStyle;

  @override
  PAPContextMenuItemState createState() => PAPContextMenuItemState();
}

class PAPContextMenuItemState extends State<PAPContextMenuItem> {
  static const _subtitleMaxLine = 1;
  static const _doubleLineContextItemPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 7.5,
  );
  static const _singleLineContextItemPadding = EdgeInsets.symmetric(
    vertical: 8.5,
    horizontal: 16.0,
  );
  static const _baseComponentContextItemPadding = EdgeInsets.symmetric(
    vertical: 9.5,
    horizontal: 16.0,
  );
  static const _spaceBetweenIconAndText = 16.0;
  static const _indentationLevelPadding = 16.0;
  static const _disabledContentOpacity = .4;

  late bool _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = false;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final titleColor = _getTitleColor(
      appTheme: appTheme,
      menuItemStyle: widget._menuItemStyle,
      isEnabled: widget._isEnabled,
      isSelected: widget._isSelected,
      isHovered: _isHovered,
    );
    final iconColor = _getIconColor(
      appTheme: appTheme,
      menuItemStyle: widget._menuItemStyle,
      isEnabled: widget._isEnabled,
      isSelected: widget._isSelected,
      isHovered: _isHovered,
    );
    final subtitleColor = _getSubtitleColor(
      appTheme: appTheme,
      menuItemStyle: widget._menuItemStyle,
      isEnabled: widget._isEnabled,
      isSelected: widget._isSelected,
      isHovered: _isHovered,
    );
    final backgroundColor = _getBackgroundColor(
      appTheme: appTheme,
      menuItemStyle: widget._menuItemStyle,
      isEnabled: widget._isEnabled,
      isSelected: widget._isSelected,
      isHovered: _isHovered,
    );

    final contentWidget =
        widget._menuItemType == ContextMenuItemType.baseComponentContext
            ? _buildBaseContentWidget(
                contentWidget: widget._menuItemWidget,
                backgroundColor: backgroundColor,
                appTheme: appTheme,
              )
            : _buildContentWidget(
                icon: widget._icon,
                animatedIcon: widget._animatedIcon,
                title: widget._title,
                subtitle: widget._subtitle,
                titleColor: titleColor,
                iconColor: iconColor,
                subtitleColor: subtitleColor,
                isEnabled: widget._isEnabled,
                appTheme: appTheme,
                backgroundColor: backgroundColor,
              );

    if (kIsWeb) {
      return MouseRegion(
        onHover: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: contentWidget,
      );
    } else {
      return contentWidget;
    }
  }

  Widget _buildBaseContentWidget({
    required Widget? contentWidget,
    required IAppThemeData appTheme,
    Color? backgroundColor,
  }) {
    return Container(
      padding: _baseComponentContextItemPadding,
      height: appTheme.singleLineContextItemHeight,
      child: contentWidget,
    );
  }

  Widget _buildContentWidget({
    required IAppThemeData appTheme,
    required bool isEnabled,
    IconData? icon,
    String? animatedIcon,
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? iconColor,
    Color? subtitleColor,
    Color? backgroundColor,
  }) {
    assert(icon != null || title != null,
        'Either icon or title should be provided');
    final hasText = title != null || subtitle != null;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      height: widget._menuItemType == ContextMenuItemType.doubleLineContext
          ? appTheme.doubleLineContextItemHeight
          : appTheme.singleLineContextItemHeight,
      child: Padding(
        padding: widget._menuItemType == ContextMenuItemType.doubleLineContext
            ? _doubleLineContextItemPadding
            : _singleLineContextItemPadding,
        child: Padding(
          padding: EdgeInsets.only(
            left: widget._indentationLevel != null
                ? widget._indentationLevel! * _indentationLevelPadding
                : 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: widget._iconSize,
                  color: iconColor,
                ),
              if (animatedIcon != null)
                PAPButton.animated(
                  animatedIcon: widget._animatedIcon!,
                  isEnable: false,
                ),
              if (hasText && (icon != null || animatedIcon != null))
                const SizedBox(width: _spaceBetweenIconAndText),
              if (hasText)
                _buildTextSection(
                  title: title,
                  titleColor: titleColor,
                  subtitle: subtitle,
                  subtitleColor: subtitleColor,
                  appTheme: appTheme,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection({
    required IAppThemeData appTheme,
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PAPText(
            text: title ?? '',
            style: _getTitleStyle(
              appTheme: appTheme,
              titleColor: titleColor,
              titleStyle: widget._titleStyle,
            ),
          ),
          if (widget._menuItemType == ContextMenuItemType.doubleLineContext)
            PAPText(
              text: subtitle ?? '',
              style: appTheme.typographies.byFontFamily().caption.copyWith(
                    color: subtitleColor,
                    overflow: TextOverflow.ellipsis,
                  ),
              maxLine: _subtitleMaxLine,
            ),
        ],
      ),
    );
  }

  TextStyle _getTitleStyle({
    required IAppThemeData appTheme,
    required Color? titleColor,
    TextStyle? titleStyle,
  }) {
    if (titleStyle != null) {
      if (widget._isEnabled) {
        return titleStyle.copyWith(
          color: titleColor,
          overflow: TextOverflow.ellipsis,
        );
      } else {
        return titleStyle;
      }
    }
    return appTheme.typographies.byFontFamily().body2.copyWith(
          color: titleColor,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        );
  }

  Color _getTitleColor({
    required IAppThemeData appTheme,
    required ContextMenuItemStyle menuItemStyle,
    required bool isEnabled,
    required bool isSelected,
    required bool isHovered,
  }) {
    if (!isEnabled) {
      return appTheme.colors.defaultText.withAlpha(
        DecorationHelper.opacityToAlpha(_disabledContentOpacity),
      );
    }

    return menuItemStyle == ContextMenuItemStyle.error
        ? (isHovered || isSelected
            ? appTheme.colors.errorCaption
            : appTheme.colors.defaultText)
        : (isSelected
            ? appTheme.colors.selectedText
            : isHovered
                ? appTheme.colors.primaryTitleText
                : appTheme.colors.defaultText);
  }

  Color _getIconColor({
    required IAppThemeData appTheme,
    required ContextMenuItemStyle menuItemStyle,
    required bool isEnabled,
    required bool isSelected,
    required bool isHovered,
  }) {
    if (!isEnabled) {
      return appTheme.colors.plainText.withAlpha(
        DecorationHelper.opacityToAlpha(_disabledContentOpacity),
      );
    }

    return menuItemStyle == ContextMenuItemStyle.error
        ? (isHovered || isSelected
            ? appTheme.colors.errorCaption
            : appTheme.colors.plainText)
        : (isSelected
            ? appTheme.colors.selectedText
            : isHovered
                ? appTheme.colors.primaryTitleText
                : appTheme.colors.plainText);
  }

  Color _getSubtitleColor({
    required IAppThemeData appTheme,
    required ContextMenuItemStyle menuItemStyle,
    required bool isEnabled,
    required bool isSelected,
    required bool isHovered,
  }) {
    if (!isEnabled) {
      return appTheme.colors.plainText.withAlpha(
        DecorationHelper.opacityToAlpha(_disabledContentOpacity),
      );
    }

    return menuItemStyle == ContextMenuItemStyle.error
        ? (isHovered || isSelected
            ? appTheme.colors.errorCaption
            : appTheme.colors.plainText)
        : (isSelected
            ? appTheme.colors.selectedText
            : isHovered
                ? appTheme.colors.primaryTitleText
                : appTheme.colors.plainText);
  }

  Color _getBackgroundColor({
    required IAppThemeData appTheme,
    required ContextMenuItemStyle menuItemStyle,
    required bool isEnabled,
    required bool isSelected,
    required bool isHovered,
  }) {
    if (!isEnabled) {
      return appTheme.colors.defaultBackground.withAlpha(
        DecorationHelper.opacityToAlpha(_disabledContentOpacity),
      );
    }

    return menuItemStyle == ContextMenuItemStyle.error
        ? (isHovered || isSelected
            ? appTheme.colors.errorBackground
            : appTheme.colors.defaultBackground)
        : (isSelected
            ? appTheme.colors.navItemBackgroundSelected
            : isHovered
                ? appTheme.colors.navItemBackgroundHover
                : appTheme.colors.defaultBackground);
  }
}
