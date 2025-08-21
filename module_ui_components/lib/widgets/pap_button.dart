import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/bases/bases.dart';
import 'package:rive/rive.dart' as rive;

enum ButtonType {
  button,
  animated,
  icon,
  popup,
}

enum ButtonStyleType {
  fill,
  outline,
  plain,
}

enum IconButtonShape {
  circle,
  rectangle,
}

enum IconPosition {
  left,
  right,
}

enum ButtonSize {
  small,
  medium,
}

class PAPButton extends StatefulShimmerWidget {
  const PAPButton({
    required ButtonType buttonType,
    required ButtonStyleType styleType,
    required dynamic Function()? onTap,
    required bool isEnable,
    required bool isBusy,
    PapComponentStyle buttonStyle = PapComponentStyle.primary,
    ButtonSize buttonSize = ButtonSize.medium,
    IconPosition iconPosition = IconPosition.left,
    String? title,
    String? animatedIcon,
    IconData? icon,
    IconData? openPopupIcon,
    IconData? closePopupIcon,
    double? popupMenuWidth,
    List<ContextMenuAction>? popupMenuActions,
    Widget? popupMenu,
    double? width,
    double? height,
    bool isPressed = false,
    Color? foregroundColor,
    String? imageIcon,
    double? horizontalPadding,
    dynamic Function({bool isHovered})? onHover,
    dynamic Function({bool isTapped})? onLongPress,
    bool busyModeHasTitle = false,
    super.isShimmerEnabled = false,
    super.key,
  })  : _buttonType = buttonType,
        _styleType = styleType,
        _onTap = onTap,
        _isEnable = isEnable,
        _isBusy = isBusy,
        _title = title,
        _icon = icon,
        _isShimmerEnabled = isShimmerEnabled,
        _buttonSize = buttonSize,
        _openPopupIcon = openPopupIcon,
        _closePopupIcon = closePopupIcon,
        _popupMenuWidth = popupMenuWidth,
        _popupMenuActions = popupMenuActions,
        _popupMenu = popupMenu,
        _animatedIcon = animatedIcon,
        _iconPosition = iconPosition,
        _height = height,
        _width = width,
        _buttonStyle = buttonStyle,
        _isPressed = isPressed,
        _foregroundColor = foregroundColor,
        _imageIcon = imageIcon,
        _horizontalPadding = horizontalPadding,
        _onHover = onHover,
        _onLongPress = onLongPress,
        _busyModeHasTitle = busyModeHasTitle,
        assert(
          title != null ||
              icon != null ||
              animatedIcon != null ||
              imageIcon != null,
          'When title is null, either icon or animatedIcon or imageIcon should not be null',
        ),
        assert(
          buttonType != ButtonType.icon ||
              icon != null ||
              animatedIcon != null ||
              imageIcon != null,
          'When buttonType is icon, icon or animatedIcon or imageIcon can not be null',
        ),
        assert(
          buttonType != ButtonType.icon || horizontalPadding == null,
          'When buttonType is icon, horizontalPadding can not be set',
        ),
        assert(
          buttonType != ButtonType.popup || popupMenuWidth != null,
          'When buttonType is popup, popupMenuWidth can not be null',
        ),
        assert(
          buttonType != ButtonType.popup ||
              (buttonType == ButtonType.popup &&
                  ((popupMenu != null && popupMenuActions == null) ||
                      (popupMenu == null && popupMenuActions != null))),
          'When buttonType is popup, either popupMenu or popupMenuActions must be provided, but not both',
        );

  factory PAPButton.button({
    required String title,
    PapComponentStyle buttonStyle = PapComponentStyle.primary,
    ButtonStyleType styleType = ButtonStyleType.fill,
    dynamic Function()? onTap,
    bool isEnable = true,
    bool isBusy = false,
    IconData? icon,
    bool isShimmerEnabled = false,
    ButtonSize buttonSize = ButtonSize.medium,
    ButtonType buttonType = ButtonType.button,
    IconPosition iconPosition = IconPosition.left,
    double? width,
    double? height,
    bool isPressed = false,
    Color? foregroundColor,
    String? imageIcon,
    double? horizontalPadding,
    dynamic Function({bool isHovered})? onHover,
    dynamic Function({bool isTapped})? onLongPress,
    bool busyModeHasTitle = false,
  }) {
    return PAPButton(
      buttonType: buttonType,
      buttonStyle: buttonStyle,
      styleType: styleType,
      onTap: onTap,
      title: title,
      icon: icon,
      isEnable: isEnable,
      isBusy: isBusy,
      isShimmerEnabled: isShimmerEnabled,
      buttonSize: buttonSize,
      iconPosition: iconPosition,
      width: width,
      height: height,
      isPressed: isPressed,
      foregroundColor: foregroundColor,
      imageIcon: imageIcon,
      horizontalPadding: horizontalPadding,
      onHover: onHover,
      onLongPress: onLongPress,
      busyModeHasTitle: busyModeHasTitle,
    );
  }

  factory PAPButton.animated({
    required String animatedIcon,
    PapComponentStyle buttonStyle = PapComponentStyle.primary,
    ButtonStyleType styleType = ButtonStyleType.fill,
    IconPosition iconPosition = IconPosition.left,
    ButtonSize buttonSize = ButtonSize.medium,
    dynamic Function()? onTap,
    String? title,
    bool isEnable = true,
    double? width,
    double? height,
    double? horizontalPadding,
    dynamic Function({bool isHovered})? onHover,
    dynamic Function({bool isTapped})? onLongPress,
  }) {
    return PAPButton(
      buttonType: ButtonType.animated,
      buttonStyle: buttonStyle,
      styleType: styleType,
      iconPosition: iconPosition,
      buttonSize: buttonSize,
      animatedIcon: animatedIcon,
      onTap: onTap,
      title: title,
      isEnable: isEnable,
      isBusy: false,
      width: width,
      height: height,
      horizontalPadding: horizontalPadding,
      onHover: onHover,
      onLongPress: onLongPress,
    );
  }

  factory PAPButton.shimmerButton({
    String? title,
    ButtonSize buttonSize = ButtonSize.medium,
    double? width,
    double? height,
  }) {
    return PAPButton(
      buttonType: ButtonType.button,
      styleType: ButtonStyleType.fill,
      title: title ?? _shimmerTitle,
      buttonSize: buttonSize,
      isEnable: true,
      isBusy: false,
      isShimmerEnabled: true,
      onTap: null,
      width: width,
      height: height,
    );
  }

  factory PAPButton.icon({
    IconData? icon,
    dynamic Function()? onTap,
    bool isEnable = true,
    bool isBusy = false,
    ButtonStyleType styleType = ButtonStyleType.plain,
    ButtonSize buttonSize = ButtonSize.medium,
    PapComponentStyle buttonStyle = PapComponentStyle.primary,
    bool isShimmerEnabled = false,
    bool isPressed = false,
    double? size,
    Color? foregroundColor,
    String? imageIcon,
    dynamic Function({bool isHovered})? onHover,
    dynamic Function({bool isTapped})? onLongPress,
  }) {
    assert(
      imageIcon != null || icon != null,
      'Either icon or imageIcon must be provided',
    );
    return PAPButton(
      buttonType: ButtonType.icon,
      onTap: onTap,
      icon: icon,
      buttonSize: buttonSize,
      styleType: styleType,
      isEnable: isEnable,
      isBusy: isBusy,
      buttonStyle: buttonStyle,
      isShimmerEnabled: isShimmerEnabled,
      isPressed: isPressed,
      width: size,
      height: size,
      foregroundColor: foregroundColor,
      imageIcon: imageIcon,
      onHover: onHover,
      onLongPress: onLongPress,
    );
  }

  factory PAPButton.shimmerIcon({
    ButtonSize buttonSize = ButtonSize.medium,
    double? size,
  }) {
    return PAPButton(
      buttonType: ButtonType.icon,
      styleType: ButtonStyleType.fill,
      buttonSize: buttonSize,
      onTap: null,
      icon: Icons.square,
      isEnable: true,
      isBusy: false,
      isShimmerEnabled: true,
      width: size,
      height: size,
    );
  }

  factory PAPButton.popup({
    required String title,
    required double popupMenuWidth,
    List<ContextMenuAction>? popupMenuActions,
    Widget? popupMenu,
    ButtonStyleType styleType = ButtonStyleType.fill,
    dynamic Function()? onTap,
    bool isEnable = true,
    bool isBusy = false,
    IconData? closePopupIcon,
    IconData? openPopupIcon,
    IconData? icon,
    bool isShimmerEnabled = false,
    ButtonSize buttonSize = ButtonSize.medium,
    IconPosition iconPosition = IconPosition.left,
    PapComponentStyle buttonStyle = PapComponentStyle.primary,
    double? width,
    double? height,
    Color? foregroundColor,
    double? horizontalPadding,
    dynamic Function({bool isHovered})? onHover,
    dynamic Function({bool isTapped})? onLongPress,
  }) {
    return PAPButton(
      buttonType: ButtonType.popup,
      styleType: styleType,
      onTap: onTap,
      title: title,
      icon: icon,
      popupMenuWidth: popupMenuWidth,
      popupMenuActions: popupMenuActions,
      isEnable: isEnable,
      isBusy: isBusy,
      isShimmerEnabled: isShimmerEnabled,
      buttonSize: buttonSize,
      openPopupIcon: openPopupIcon,
      closePopupIcon: closePopupIcon,
      buttonStyle: buttonStyle,
      width: width,
      height: height,
      iconPosition: iconPosition,
      popupMenu: popupMenu,
      foregroundColor: foregroundColor,
      horizontalPadding: horizontalPadding,
      onHover: onHover,
      onLongPress: onLongPress,
    );
  }
  static const _shimmerTitle = 'T';

  final ButtonType _buttonType;
  final bool _isEnable;
  final bool _isBusy;
  final dynamic Function()? _onTap;
  final String? _title;
  final String? _animatedIcon;
  final IconData? _icon;
  final IconData? _openPopupIcon;
  final IconData? _closePopupIcon;
  final bool _isShimmerEnabled;
  final double? _popupMenuWidth;
  final List<ContextMenuAction>? _popupMenuActions;
  final ButtonSize _buttonSize;
  final ButtonStyleType _styleType;
  final PapComponentStyle _buttonStyle;
  final double? _height;
  final double? _width;
  final IconPosition _iconPosition;
  final bool _isPressed;
  final Widget? _popupMenu;
  final Color? _foregroundColor;
  final String? _imageIcon;
  final double? _horizontalPadding;
  final Function({bool isHovered})? _onHover;
  final Function({bool isTapped})? _onLongPress;
  final bool _busyModeHasTitle;

  @override
  State<PAPButton> createState() => _PAPButtonState();
}

class _PAPButtonState extends StatefulShimmerWidgetState<PAPButton> {
  static const _shimmerMargin = 2.0;
  static const _animatedButtonDefaultSize = 24.0;
  static const _animatedButtonSpacing = 8.0;
  static const _iconOnlyButtonSmallSize = 32.0;
  static const _iconOnlyButtonMediumSize = 40.0;
  static const _iconOnlyPopupButtonWidth = 56.0;
  static const _smallButtonLoadingIconSize = 16.0;

  late final CustomPopupMenuController _popupButtonController;
  bool _isLongPressed = false;

  @override
  void initState() {
    super.initState();
    _popupButtonController = CustomPopupMenuController();
    _popupButtonController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _popupButtonController.dispose();
    super.dispose();
  }

  @override
  Widget buildLoaded(BuildContext context) {
    return _buildButton(
      context: context,
    );
  }

  Widget _buildButton({
    required BuildContext context,
  }) {
    final appTheme = AppTheme.of(context).theme;
    final isDisabled = !widget._isEnable || widget._onTap == null;
    final VoidCallback? onPressed = isDisabled ? null : widget._onTap;
    return SizedBox(
      width: widget._width ?? _getButtonWidth(appTheme),
      height: widget._height ?? _getButtonHeight(appTheme),
      child: _buildButtonTypes(
        appTheme: appTheme,
        isDisabled: isDisabled,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildButtonTypes({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    switch (widget._buttonType) {
      case ButtonType.popup:
        return _popupButton(
          appTheme: appTheme,
          isDisabled: isDisabled,
        );
      case ButtonType.animated:
        return _animatedButtonBuilder(
          appTheme: appTheme,
          isDisabled: isDisabled,
          onPressed: onPressed,
        );
      default:
        return _buttonBuilder(
          appTheme: appTheme,
          isDisabled: isDisabled,
          onPressed: onPressed,
        );
    }
  }

  Widget _popupButton({
    required IAppThemeData appTheme,
    required bool isDisabled,
  }) {
    return PAPPopupButton(
      controller: isDisabled || widget._isBusy ? null : _popupButtonController,
      menuWidth: widget._popupMenuWidth!,
      popupItems: widget._popupMenu == null && widget._popupMenuActions != null
          ? widget._popupMenuActions!
              .map(
                (e) => PopupButtonAction(
                  title: e.title,
                  icon: e.icon,
                  subtitle: e.subtitle,
                  itemType: e.itemType ?? ContextMenuItemType.singleLineContext,
                  onTap: e.onTap,
                  child: e.menuItemWidget,
                  isEnable: e.onTap != null,
                ),
              )
              .toList()
          : null,
      menu: widget._popupMenu == null || isDisabled ? null : widget._popupMenu,
      customHorizontalOffset: true,
      child: _buttonBuilder(
        appTheme: appTheme,
        isDisabled: isDisabled,
        onPressed: isDisabled || widget._isBusy
            ? null
            : _popupButtonController.showMenu,
      ),
    );
  }

  Widget _buttonBuilder({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    ButtonStyle buttonStyle;
    switch (widget._styleType) {
      case ButtonStyleType.outline:
        buttonStyle = isDisabled
            ? appTheme.disabledPrimaryOutlinedButtonStyle
            : widget._isPressed ||
                    widget._isBusy ||
                    (widget._buttonType == ButtonType.popup &&
                        _popupButtonController.menuIsShowing)
                ? appTheme.busyPrimaryOutlinedButtonStyle
                : appTheme.primaryOutlinedButtonStyle;
        break;
      case ButtonStyleType.plain:
        buttonStyle = isDisabled
            ? appTheme.disabledPrimaryPlainButtonStyle
            : widget._isPressed ||
                    widget._isBusy ||
                    (widget._buttonType == ButtonType.popup &&
                        _popupButtonController.menuIsShowing)
                ? appTheme.busyPrimaryPlainButtonStyle
                : appTheme.primaryPlainButtonStyle;
        break;
      default:
        buttonStyle = isDisabled
            ? _getDisabledFillButtonStyle(
                appTheme: appTheme,
                buttonStyle: widget._buttonStyle,
              )
            : _getFillButtonStyle(
                appTheme: appTheme,
                buttonStyle: widget._buttonStyle,
              );
    }

    buttonStyle = buttonStyle.copyWith(
      foregroundColor: widget._onLongPress != null && _isLongPressed
          ? WidgetStateProperty.all(appTheme.colors.breadCrumbTextOnlongPress)
          : widget._foregroundColor != null
              ? WidgetStateProperty.all(widget._foregroundColor)
              : null,
      backgroundColor: widget._onLongPress != null && _isLongPressed
          ? WidgetStateProperty.all(appTheme.colors.breadCrumbItemOnlongPress)
          : null,
      padding: WidgetStateProperty.all(
        widget._horizontalPadding != null
            ? EdgeInsets.symmetric(horizontal: widget._horizontalPadding!)
            : _getButtonPadding(appTheme),
      ),
    );
    return GestureDetector(
      onLongPressEnd: widget._onLongPress != null
          ? (_) {
              setState(() {
                _isLongPressed = false;
              });
              widget._onLongPress?.call(isTapped: false);
            }
          : null,
      onLongPress: widget._onLongPress != null
          ? () {
              setState(() {
                _isLongPressed = true;
              });
              widget._onLongPress?.call(isTapped: true);
            }
          : null,
      child: ElevatedButton(
        onPressed:
            !widget._isShimmerEnabled && !widget._isBusy ? onPressed : null,
        onHover: (bool value) => widget._onHover?.call(isHovered: value),
        style: buttonStyle,
        child: _buttonChild(
          appTheme: appTheme,
          isDisabled: isDisabled,
        ),
      ),
    );
  }

  Widget _animatedButtonBuilder({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: !widget._isShimmerEnabled ? onPressed : null,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: widget._width ?? _animatedButtonDefaultSize,
            height: widget._height ?? _animatedButtonDefaultSize,
            child: rive.RiveAnimation.asset(
              widget._animatedIcon!,
            ),
          ),
          if (widget._title != null)
            PAPDivider.spacer(
              width: _animatedButtonSpacing,
            ),
          if (widget._title != null)
            Text(
              widget._title!,
              style: widget._isEnable
                  ? appTheme.typographies.byFontFamily().button
                  : appTheme.typographies.byFontFamily().button.copyWith(
                        color: appTheme.colors.disabledText,
                      ),
            ),
        ],
      ),
    );
  }

  ButtonStyle _getFillButtonStyle({
    required IAppThemeData appTheme,
    required PapComponentStyle buttonStyle,
  }) {
    switch (buttonStyle) {
      case PapComponentStyle.secondary:
        return widget._isPressed ||
                widget._isBusy ||
                (widget._buttonType == ButtonType.popup &&
                    _popupButtonController.menuIsShowing)
            ? appTheme.busySecondaryFilledButtonStyle
            : appTheme.secondaryFilledButtonStyle;
      case PapComponentStyle.error:
        return widget._isPressed ||
                widget._isBusy ||
                (widget._buttonType == ButtonType.popup &&
                    _popupButtonController.menuIsShowing)
            ? appTheme.busyErrorFilledButtonStyle
            : appTheme.errorFilledButtonStyle;
      default:
        return widget._isPressed ||
                widget._isBusy ||
                (widget._buttonType == ButtonType.popup &&
                    _popupButtonController.menuIsShowing)
            ? appTheme.busyPrimaryFilledButtonStyle
            : appTheme.primaryFilledButtonStyle;
    }
  }

  ButtonStyle _getDisabledFillButtonStyle({
    required IAppThemeData appTheme,
    required PapComponentStyle buttonStyle,
  }) {
    switch (buttonStyle) {
      case PapComponentStyle.secondary:
        return appTheme.disabledSecondaryFilledButtonStyle;
      case PapComponentStyle.error:
        return appTheme.disabledErrorFilledButtonStyle;
      default:
        return appTheme.disabledPrimaryFilledButtonStyle;
    }
  }

  Widget _buttonChild({
    required IAppThemeData appTheme,
    required bool isDisabled,
  }) {
    final buttonText = Text(widget._title ?? '');
    return widget._isBusy
        ? _buildLoading(appTheme, isDisabled)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if ((widget._icon != null || widget._imageIcon != null) &&
                  widget._iconPosition == IconPosition.left)
                Padding(
                  padding: widget._title != null && widget._title!.isNotEmpty
                      ? EdgeInsets.only(right: appTheme.buttonIconMargin)
                      : EdgeInsets.zero,
                  child: widget._imageIcon == null
                      ? Icon(
                          widget._icon!,
                          size: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                        )
                      : Image.asset(
                          widget._imageIcon!,
                          width: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                          height: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                        ),
                ),
              buttonText,
              if ((widget._icon != null || widget._imageIcon != null) &&
                  widget._iconPosition == IconPosition.right)
                Padding(
                  padding: widget._title != null && widget._title!.isNotEmpty
                      ? EdgeInsets.only(left: appTheme.buttonIconMargin)
                      : EdgeInsets.zero,
                  child: widget._imageIcon == null
                      ? Icon(
                          widget._icon!,
                          size: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                        )
                      : Image.asset(
                          widget._imageIcon!,
                          width: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                          height: (widget._buttonSize == ButtonSize.small
                              ? appTheme.smallButtonIconSize
                              : appTheme.mediumButtonIconSize),
                        ),
                ),
              if (widget._buttonType == ButtonType.popup &&
                  (widget._openPopupIcon != null &&
                      widget._closePopupIcon != null))
                Icon(
                  _popupButtonController.menuIsShowing
                      ? widget._openPopupIcon!
                      : widget._closePopupIcon,
                  size: appTheme.popupButtonIconSize,
                ),
            ],
          );
  }

  @override
  Widget buildLoading(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Container(
      padding: const EdgeInsets.all(
        _shimmerMargin,
      ),
      color: appTheme.colors.defaultBackground,
      child: _buildButton(
        context: context,
      ),
    );
  }

  EdgeInsets _getButtonPadding(IAppThemeData appTheme) {
    final noIcon = widget._icon == null &&
        widget._animatedIcon == null &&
        widget._imageIcon == null;
    final iconOnly =
        (widget._title == null || widget._title!.isEmpty) && !noIcon;
    if (iconOnly) {
      return widget._buttonType != ButtonType.popup
          ? widget._buttonSize == ButtonSize.small
              ? appTheme.iconOnlyButtonSmallPadding
              : appTheme.iconOnlyButtonMediumPadding
          : appTheme.iconOnlyPopupButtonPadding;
    } else if (noIcon) {
      return widget._buttonSize == ButtonSize.small
          ? appTheme.noIconButtonSmallPadding
          : appTheme.noIconButtonMediumPadding;
    } else {
      return widget._buttonSize == ButtonSize.small
          ? appTheme.textAndIconButtonSmallPadding
          : appTheme.textAndIconButtonMediumPadding;
    }
  }

  double? _getButtonWidth(IAppThemeData appTheme) {
    if ((widget._icon != null ||
            widget._animatedIcon != null ||
            widget._imageIcon != null) &&
        (widget._title == null || widget._title!.isEmpty)) {
      if (widget._openPopupIcon != null || widget._closePopupIcon != null) {
        return _iconOnlyPopupButtonWidth;
      } else if (widget._buttonSize == ButtonSize.small) {
        return _iconOnlyButtonSmallSize;
      } else {
        return _iconOnlyButtonMediumSize;
      }
    }
    return null;
  }

  double _getButtonHeight(IAppThemeData appTheme) {
    if ((widget._icon != null ||
            widget._animatedIcon != null ||
            widget._imageIcon != null) &&
        (widget._title == null || widget._title!.isEmpty)) {
      if (widget._openPopupIcon == null || widget._closePopupIcon == null) {
        return widget._buttonSize == ButtonSize.small
            ? _iconOnlyButtonSmallSize
            : _iconOnlyButtonMediumSize;
      } else {
        return widget._buttonSize == ButtonSize.small
            ? appTheme.buttonHeightSmall
            : appTheme.buttonHeight;
      }
    }
    return widget._buttonSize == ButtonSize.small
        ? appTheme.buttonHeightSmall
        : appTheme.buttonHeight;
  }

  Widget _buildLoading(IAppThemeData appTheme, bool isDisabled) {
    late final Color indicatorColor;
    switch (widget._styleType) {
      case ButtonStyleType.outline:
        indicatorColor = isDisabled
            ? appTheme.colors.outlineTextDisabled
            : appTheme.colors.outlineText;
        break;
      case ButtonStyleType.plain:
        indicatorColor = isDisabled
            ? appTheme.colors.plainTextDisabled
            : appTheme.colors.plainTextPressed;
        break;
      default:
        switch (widget._buttonStyle) {
          case PapComponentStyle.secondary:
            indicatorColor = isDisabled
                ? appTheme.colors.fillSecondaryTextDisabled
                : appTheme.colors.fillSecondaryTextPressed;
            break;
          case PapComponentStyle.error:
            indicatorColor = isDisabled
                ? appTheme.colors.fillErrorTextDisabled
                : appTheme.colors.errorText;
            break;
          default:
            indicatorColor = isDisabled
                ? appTheme.colors.fillPrimaryTextDisabled
                : appTheme.colors.primaryText;
        }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PAPLoading(
          indicatorsColor: [indicatorColor],
          size: widget._buttonSize == ButtonSize.small
              ? _smallButtonLoadingIconSize
              : null,
        ),
        if (widget._title != null && widget._busyModeHasTitle)
          PAPDivider.spacer(
            width: appTheme.buttonIconMargin,
          ),
        if (widget._title != null && widget._busyModeHasTitle)
          Text(widget._title!),
      ],
    );
  }
}
