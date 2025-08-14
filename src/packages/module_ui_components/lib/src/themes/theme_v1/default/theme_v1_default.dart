part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV1Default extends IAppThemeData {
  static const _defaultElevation = 8.0;
  static const _defaultBorderRadius = 12.0;
  static const _iconCardBorderRadius = 8.0;
  static const _buttonBorderRadius = 8.0;
  static const _filledButtonElevation = 2.0;
  static const _zeroElevation = 0.0;
  static const _transparentColor = Colors.transparent;
  static const _buttonSplashEffect = NoSplash.splashFactory;
  static const _buttonPadding = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 16.0,
  );
  static const _navItemPadding = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 20.0,
  );
  static const _singleSelectBorderRadius = 14.0;
  static const _singleSelectActionShadowOffset = Offset(0, 2);
  static const _singleSelectActionShadowBlur = 2.5;
  static const _inputBorderRadius = 6.0;
  static const _shadowRadius = 2.0;
  static const _shadowBlurRadius = 6.0;
  static const _shadowColorOpacity = 0.14;
  static const _shadowOffset = Offset(0.0, 1.0);
  static const _appBarShadowBlurRadius = 1.5;
  static const _appBarShadowColorOpacity = 0.3;
  static const _appBarBorderRadius = 8.0;
  static const _appBarShadowOffset = Offset(0.0, 2.0);
  static const _listWithHandlerBorderWidth = 2.0;
  static const _listWithHandlerDraggingOpacity = 0.4;
  static const _sidebarShadowOffset = Offset(0.0, 4.0);
  static const _sidebarBorderRadius = 10.0;
  static const _sidebarShadowBlurRadius = 8.0;
  static const _scrollbarThickness = 3.0;
  static const _scrollbarRadius = 8.0;
  static const _scrollbarThumbHeight = 162.0;
  static const _iconCardShadowOffset = Offset(0.0, 4.0);
  static const _iconCardShadowBlurRadius = 8.0;
  static const _iconButtonPadding = EdgeInsets.zero;
  static const _tabIndicatorRadius = 8.0;
  static const _tabIndicatorHeight = 4.0;
  static const _groupBoxBorderRadius = 12.0;
  static const _dropDownTextInputPadding =
      EdgeInsets.symmetric(horizontal: 6.0);
  static const _inputVerticalPaddingWeb = 13.5;
  static const _inputVerticalPaddingMobile = 11.0;
  static const _inputHorizontalPaddingWeb = 25.0;
  static const _inputHorizontalPaddingMobile = 20.0;
  static const _singleLineContextItemHeight = 44.0;
  static const _doubleLineContextItemHeight = 64.0;

  static const _heroLargeSize = 74.0;
  static const _heroSmallSize = 40.0;

  static const _buttonHeight = 48.0;
  static const _buttonIconMargin = 6.0;
  static const _buttonIconSize = 16.0;

  static const _navItemIconMargin = 20.0;
  static const _navItemIconSize = 24.0;
  static const _navItemHeight = 48.0;
  static const _navItemSectionMargin = 16.0;
  static const _navItemSectionPadding = EdgeInsets.only(
    left: 23,
    top: 16,
  );
  static const _navItemExpandedMargin = EdgeInsets.only(right: 16.0);
  static const _navItemCollapsedMargin = EdgeInsets.only(right: 8.0);
  static const _navCollapsedWidth = 84.0;

  static const _dialogHeaderPadding = EdgeInsets.zero;
  static const _dialogTitlePadding = EdgeInsets.symmetric(
    vertical: 14,
    horizontal: 16,
  );
  static const _dialogFooterPadding = EdgeInsets.all(16);
  static const _segmentBorderRadius = 6.0;
  static const _switchWidth = 24.0;
  static const _switchHeight = 14.0;
  static const _switchBorderRadius = 10.0;
  static const _switchBorderThickness = 2.0;
  static const _switchThumbIconSize = 6.0;
  static const _switchThumbIconBorderRadius = 0.0;
  static const _switchThumbIconPadding = EdgeInsets.all(2);

  static const _textInputSingleLineContentPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 13,
  );
  static const _textInputMultiLineContentPadding = EdgeInsets.only(
    top: 24,
    bottom: 12,
    right: 13,
    left: 13,
  );
  static const _breadcrumbBorderRadius = 12.0;
  static const _breadcrumbBorderThickness = 0.0;

  static const _popupMenuBlurRadius1 = 2.0;
  static const _popupMenuBlurRadius2 = 4.0;
  static const _popupMenuShadowOffset1 = Offset(0, 1);
  static const _popupMenuShadowOffset2 = Offset(0, 2);
  static const _popupMenuShadowOpacity = 0.2;

  static const _checkBoxBorderRadius = 4.0;
  static const _checkBoxSize = 20.0;
  static const _checkBoxIconSize = 16.0;
  static const _checkBoxRightMargin = 8.0;

  @override
  ITypographies get typographies => const _ThemeV1Typographies();

  @override
  IColors get colors => const _Colors();

  @override
  IIcons get icons => const _ThemeV1Icons();

  @override
  ThemeData get mainTheme => ThemeData(
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(colors.primaryText),
          trackColor: WidgetStateProperty.all(colors.secondaryBackground),
          thickness: WidgetStateProperty.all(_scrollbarThickness),
          thumbVisibility: WidgetStateProperty.all(false),
          trackVisibility: WidgetStateProperty.all(true),
          minThumbLength: _scrollbarThumbHeight,
          trackBorderColor: WidgetStateProperty.all(colors.transparent),
          radius: const Radius.circular(_scrollbarRadius),
          crossAxisMargin: 0,
          mainAxisMargin: 0,
        ),
      );

  @override
  ShapeBorder get dialogShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get dialogDecoration => BoxDecoration(
        color: colors.primaryLightBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
      );

  @override
  Border get dialogHeaderBorder => Border();

  @override
  Decoration get dialogHeaderPrimaryDecoration => BoxDecoration(
        color: colors.headerPrimaryBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get dialogHeaderErrorDecoration => BoxDecoration(
        color: colors.headerWarningBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );

  //---------Navigation Item

  @override
  ButtonStyle get navItemStyle => primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.mainBackground,
          color: colors.navItemText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.navItemBackgroundDisabled.withAlpha(
            DecorationHelper.opacityToAlpha(0.25),
          ),
          color: _transparentColor,
        ),
        alignment: Alignment.centerLeft,
        elevation: buttonElevationBuilder(_zeroElevation),
        padding: buttonPaddingBuilder(_navItemPadding),
        shape: navItemShapeBuilder(_defaultBorderRadius),
        textStyle: WidgetStatePropertyAll(
          typographies.byFontFamily().navItemCaption,
        ),
        iconSize: const WidgetStatePropertyAll(_navItemIconSize),
      );

  @override
  ButtonStyle get disabledNavItemStyle => navItemStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.defaultBorder),
        backgroundColor: WidgetStateProperty.all(_transparentColor),
      );

  @override
  ButtonStyle get selectedNavItemStyle => navItemStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.mainBackground),
        backgroundColor: WidgetStateProperty.all(
          colors.primaryText.withAlpha(
            DecorationHelper.opacityToAlpha(0.5),
          ),
        ),
      );

  @override
  double get navItemIconMargin => _navItemIconMargin;

  @override
  double get navItemIconSize => _navItemIconSize;

  @override
  double get navItemHeight => _navItemHeight;

  @override
  double get navItemSectionMargin => _navItemSectionMargin;

  @override
  EdgeInsets get navItemSectionPadding => _navItemSectionPadding;

  @override
  EdgeInsets get navItemExpandedMargin => _navItemExpandedMargin;

  @override
  EdgeInsets get navItemCollapsedMargin => _navItemCollapsedMargin;

  @override
  double? get navSectionDividerHeight => null;

  @override
  double? get navCollapsedWidth => _navCollapsedWidth;

  @override
  BorderRadius get toastBorderRadius =>
      BorderRadius.circular(_defaultBorderRadius);

  @override
  ShapeBorder get contextMenuShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  double get contextMenuElevation => _defaultElevation;

  @override
  BoxDecoration get contextMenuDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        boxShadow: [
          BoxShadow(
            color: colors.secondaryCaption.withAlpha(
              DecorationHelper.opacityToAlpha(_popupMenuShadowOpacity),
            ),
            offset: _popupMenuShadowOffset1,
            blurRadius: _popupMenuBlurRadius1,
          ),
          BoxShadow(
            color: colors.secondaryCaption.withAlpha(
              DecorationHelper.opacityToAlpha(_popupMenuShadowOpacity),
            ),
            offset: _popupMenuShadowOffset2,
            blurRadius: _popupMenuBlurRadius2,
          ),
        ],
      );

  // card
  @override
  BoxDecoration get baseCardDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        border: Border.all(color: colors.primaryBorder),
      );

  @override
  BoxDecoration get cardHoverDecoration => baseCardDecoration.copyWith(
        border: Border.all(color: colors.cardHoverBorder),
        boxShadow: [
          BoxShadow(
            spreadRadius: _shadowRadius,
            color: colors.cardHoverBorder.withAlpha(
              DecorationHelper.opacityToAlpha(_shadowColorOpacity),
            ),
            offset: _shadowOffset,
            blurRadius: _shadowBlurRadius,
          ),
        ],
      );

  @override
  BoxDecoration get cardSelectedDecoration => baseCardDecoration.copyWith(
        border: Border.all(color: colors.cardHoverBorder),
        boxShadow: [
          BoxShadow(
            spreadRadius: _shadowRadius,
            color: colors.cardHoverBorder.withAlpha(
              DecorationHelper.opacityToAlpha(_shadowColorOpacity),
            ),
            offset: _shadowOffset,
            blurRadius: _shadowBlurRadius,
          ),
        ],
      );

  @override
  BoxDecoration get listWithHandlerDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        border: Border.all(
          color: colors.transparent,
          width: _listWithHandlerBorderWidth,
        ),
      );

  @override
  BoxDecoration get listWithHandlerDraggingDecoration =>
      listWithHandlerDecoration.copyWith(
        border: Border.all(
          color: colors.secondaryCaption.withAlpha(
            DecorationHelper.opacityToAlpha(_listWithHandlerDraggingOpacity),
          ),
          width: _listWithHandlerBorderWidth,
        ),
      );

  @override
  BoxDecoration get listWithHandlerHoverDecoration =>
      listWithHandlerDecoration.copyWith(
        border: Border.all(
          color: colors.primaryBorder,
          width: _listWithHandlerBorderWidth,
        ),
      );

  @override
  BoxDecoration get listWithHandlerSelectedDecoration =>
      listWithHandlerDecoration.copyWith(
        border: Border.all(
          color: colors.primaryText,
          width: _listWithHandlerBorderWidth,
        ),
      );

  @override
  BoxDecoration get iconCardDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_iconCardBorderRadius),
        border: Border.all(color: colors.primaryBorder),
      );

  @override
  BoxDecoration get actionCardDecoration => BoxDecoration(
        color: colors.actionCardDefaultBackground,
        border: Border.all(
          color: colors.actionCardDefaultBorder,
        ),
        borderRadius: BorderRadius.circular(_iconCardBorderRadius),
      );

  @override
  BoxDecoration get iconCardHoverDecoration => iconCardDecoration.copyWith(
        border: Border.all(color: colors.cardHoverBorder),
        boxShadow: [
          BoxShadow(
            spreadRadius: _shadowRadius,
            color: colors.cardHoverBorder.withAlpha(
              DecorationHelper.opacityToAlpha(_shadowColorOpacity),
            ),
            offset: _shadowOffset,
            blurRadius: _shadowBlurRadius,
          ),
        ],
      );

  @override
  BoxDecoration get iconCardDraggingDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_iconCardBorderRadius),
        boxShadow: [
          BoxShadow(
            color: colors.cardHoverBorder.withAlpha(
              DecorationHelper.opacityToAlpha(_shadowColorOpacity),
            ),
            offset: _iconCardShadowOffset,
            blurRadius: _iconCardShadowBlurRadius,
          ),
        ],
      );

  @override
  BoxDecoration get iconCardSelectedDecoration => iconCardDecoration.copyWith(
        border: Border.all(color: colors.cardHoverBorder),
        boxShadow: [
          BoxShadow(
            spreadRadius: _shadowRadius,
            color: colors.cardHoverBorder.withAlpha(
              (255 * _shadowColorOpacity).toInt(),
            ),
            offset: _shadowOffset,
            blurRadius: _shadowBlurRadius,
          ),
        ],
      );

  @override
  BoxDecoration get iconCardDraggableDecoration => iconCardDecoration;

  @override
  BoxDecoration get iconCardDraggableHoverDecoration => iconCardHoverDecoration;

  @override
  BoxDecoration get iconCardDraggableSelectedDecoration =>
      iconCardSelectedDecoration;

  @override
  TextStyle get cardDescriptionTextStyle =>
      _ThemeV1Typographies._manropeTypography.body1
          .copyWith(color: colors.secondaryCaption);

  @override
  TextStyle get cardSubtitleTextStyle =>
      _ThemeV1Typographies._manropeTypography.body2
          .copyWith(color: colors.disabledPrimaryBackground);

  @override
  TextStyle get cardTitleTextStyle =>
      _ThemeV1Typographies._manropeTypography.headline7;

  @override
  BoxDecoration get actionCardDisabledDecoration =>
      actionCardDecoration.copyWith(
        color: colors.actionCardDisabledBackground,
      );

  @override
  BoxDecoration get actionCardHoverDecoration => actionCardDecoration.copyWith(
        border: Border.all(color: colors.actionCardHoverBorder),
      );

  @override
  BoxDecoration get actionCardPressedDecoration =>
      actionCardDecoration.copyWith(
        border: Border.all(color: colors.actionCardPressedBorder),
      );

  @override
  BoxDecoration get singleSelectActionDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        color: colors.defaultBackground,
        boxShadow: [
          BoxShadow(
            offset: _singleSelectActionShadowOffset,
            blurRadius: _singleSelectActionShadowBlur,
            color: colors.shadow,
          ),
        ],
      );

  @override
  BoxDecoration get singleSelectDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(_singleSelectBorderRadius),
        color: colors.secondaryBackground,
      );

  @override
  BoxDecoration get appBarDecoration => BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_appBarBorderRadius),
          bottomRight: Radius.circular(_appBarBorderRadius),
        ),
        color: colors.defaultBackground,
        boxShadow: [
          BoxShadow(
            color: colors.secondaryCaption.withAlpha(
              DecorationHelper.opacityToAlpha(_appBarShadowColorOpacity),
            ),
            offset: _appBarShadowOffset,
            blurRadius: _appBarShadowBlurRadius,
          ),
        ],
      );

  @override
  ShapeBorder get appBarShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_defaultBorderRadius),
          bottomRight: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  double? get appBarElevation => null;

  @override
  BoxDecoration get drawerDecoration => appBarDecoration.copyWith(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          bottomRight: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  BoxDecoration get sidebarDecoration => appBarDecoration.copyWith(
        color: colors.defaultBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_sidebarBorderRadius),
          bottomRight: Radius.circular(_sidebarBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            offset: _sidebarShadowOffset,
            blurRadius: _sidebarShadowBlurRadius,
            color: colors.primaryCaption.withAlpha(
              DecorationHelper.opacityToAlpha(_shadowColorOpacity),
            ),
          ),
        ],
      );

  //----------------Button styles
  //----------------Filled Button
  @override
  ButtonStyle get primaryFilledButtonStyle => ButtonStyle(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.secondaryText,
          color: colors.primaryText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.primaryDarkBackground,
          color: colors.mainBackground,
        ),
        textStyle: textStyleBuilder(typographies.byFontFamily().button),
        padding: buttonPaddingBuilder(_buttonPadding),
        splashFactory: _buttonSplashEffect,
        shape: filledButtonShapeBuilder(_buttonBorderRadius),
        mouseCursor: disabledButtonsMouseCursorBuilder(),
        elevation: buttonElevationBuilder(_filledButtonElevation),
      );

  @override
  ButtonStyle get secondaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.secondaryCaption,
          color: colors.secondaryLight,
        ),
      );

  @override
  ButtonStyle get errorFilledButtonStyle => primaryFilledButtonStyle.copyWith(
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.errorLight,
          color: colors.errorCaption,
        ),
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.secondaryText,
          color: colors.errorText,
        ),
      );

  @override
  ButtonStyle get disabledPrimaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.disabledText),
        backgroundColor:
            WidgetStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get busyPrimaryFilledButtonStyle =>
      disabledPrimaryFilledButtonStyle;

  @override
  ButtonStyle get busySecondaryFilledButtonStyle =>
      disabledPrimaryFilledButtonStyle;

  @override
  ButtonStyle get busyErrorFilledButtonStyle =>
      disabledPrimaryFilledButtonStyle;

  @override
  ButtonStyle get disabledSecondaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.disabledText),
        backgroundColor:
            WidgetStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get disabledErrorFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.disabledText),
        backgroundColor:
            WidgetStateProperty.all(colors.disabledPrimaryBackground),
      );

  //----------------Outlined Button
  @override
  ButtonStyle get primaryOutlinedButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.primaryCaption,
          color: colors.primaryCaption,
        ),
        backgroundColor: WidgetStateProperty.all(colors.secondaryText),
        elevation: buttonElevationBuilderWithHover(
          hoverElevation: _filledButtonElevation,
          elevation: _zeroElevation,
        ),
        shape: outlinedButtonShapeBuilder(
          borderRadius: _buttonBorderRadius,
          borderColor: colors.primaryCaption,
          hoverBorderColor: colors.primaryCaption,
        ),
        padding: buttonPaddingBuilder(_buttonPadding),
      );

  @override
  ButtonStyle get disabledPrimaryOutlinedButtonStyle =>
      primaryOutlinedButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.disabledText),
        backgroundColor: WidgetStateProperty.all(_transparentColor),
        shape: outlinedButtonShapeBuilder(
          borderRadius: _buttonBorderRadius,
          borderColor: colors.disabledText,
          hoverBorderColor: colors.disabledText,
        ),
        elevation: buttonElevationBuilder(_zeroElevation),
      );

  @override
  ButtonStyle get busyPrimaryOutlinedButtonStyle =>
      disabledPrimaryOutlinedButtonStyle;

  //----------------Plain Button
  @override
  ButtonStyle get primaryPlainButtonStyle => primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.primaryCaption,
          color: colors.secondaryCaption,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.primaryText,
          color: _transparentColor,
        ),
        elevation: buttonElevationBuilder(_zeroElevation),
      );

  @override
  ButtonStyle get disabledPrimaryPlainButtonStyle =>
      primaryPlainButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.disabledText),
        backgroundColor: WidgetStateProperty.all(_transparentColor),
      );

  @override
  ButtonStyle get busyPrimaryPlainButtonStyle =>
      disabledPrimaryPlainButtonStyle;

  @override
  Decoration get tabIndicator => CustomTabIndicator(
        color: colors.primaryLight,
        radius: _tabIndicatorRadius,
        indicatorHeight: _tabIndicatorHeight,
      );

  @override
  BorderRadius get groupBoxBorderRadius => BorderRadius.circular(
        _groupBoxBorderRadius,
      );

  //---------------DropDown

  @override
  Alignment get dropDownTextAlign => Alignment.center;

  @override
  double get doubleLineContextItemHeight => _doubleLineContextItemHeight;

  @override
  double get singleLineContextItemHeight => _singleLineContextItemHeight;

  @override
  EdgeInsets get dropDownTextInputPadding => _dropDownTextInputPadding;

  @override
  TextAlign get dropDownTextInputAlignment => TextAlign.center;

  @override
  double get dropDownInputHorizontalPaddingMobile =>
      _inputHorizontalPaddingMobile;

  @override
  double get dropDownInputHorizontalPaddingWeb => _inputHorizontalPaddingWeb;

  @override
  double get dropDownInputVerticalPaddingMobile => _inputVerticalPaddingMobile;

  @override
  double get dropDownInputVerticalPaddingWeb => _inputVerticalPaddingWeb;

  @override
  double get heroLargeSize => _heroLargeSize;

  @override
  double get heroMediumSize => _heroLargeSize;

  @override
  double get heroSmallSize => _heroSmallSize;

  @override
  double get buttonHeight => _buttonHeight;

  @override
  double get buttonHeightSmall => _buttonHeight;

  @override
  double get buttonIconMargin => _buttonIconMargin;

  @override
  EdgeInsets get iconOnlyButtonMediumPadding => _iconButtonPadding;

  @override
  EdgeInsets get iconOnlyButtonSmallPadding => _iconButtonPadding;

  @override
  EdgeInsets get iconOnlyPopupButtonPadding => _iconButtonPadding;

  @override
  double get mediumButtonIconSize => _buttonIconSize;

  @override
  EdgeInsets get noIconButtonMediumPadding => _buttonPadding;

  @override
  EdgeInsets get noIconButtonSmallPadding => _buttonPadding;

  @override
  double get popupButtonIconSize => _buttonIconSize;

  @override
  double get smallButtonIconSize => _buttonIconSize;

  @override
  EdgeInsets get textAndIconButtonMediumPadding => _buttonPadding;

  @override
  EdgeInsets get textAndIconButtonSmallPadding => _buttonPadding;

  //---------------Dialog
  @override
  EdgeInsets get dialogHeaderPadding => _dialogHeaderPadding;

  @override
  EdgeInsets get dialogTitlePadding => _dialogTitlePadding;

  @override
  EdgeInsets get dialogFooterPadding => _dialogFooterPadding;

  @override
  double get segmentBorderRadius => _segmentBorderRadius;

  @override
  BoxDecoration get segmentDecoration => const BoxDecoration();

  //----------------Switch
  @override
  double get switchWidth => _switchWidth;

  @override
  double get switchHeight => _switchHeight;

  @override
  double get switchBorderRadius => _switchBorderRadius;

  @override
  double get switchBorderThickness => _switchBorderThickness;

  @override
  BoxShape get switchThumbIconShape => BoxShape.circle;

  @override
  double get switchThumbIconSize => _switchThumbIconSize;

  @override
  double get switchThumbIconBorderRadius => _switchThumbIconBorderRadius;

  @override
  EdgeInsets get switchThumbIconPadding => _switchThumbIconPadding;

  //---------------Text Input

  @override
  EdgeInsets get textInputOutlineSingleLineContentPadding =>
      _textInputSingleLineContentPadding;

  @override
  EdgeInsets get textInputOutlineMultiLineContentPadding =>
      _textInputMultiLineContentPadding;

  @override
  EdgeInsets get textInputFillSingleLineContentPadding =>
      _textInputSingleLineContentPadding;

  @override
  EdgeInsets get textInputFillMultiLineContentPadding =>
      _textInputMultiLineContentPadding;

  @override
  InputBorder get textInputHoverBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.textInputBorderHovered),
      );

  @override
  InputBorder get textInputDisabledBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.textInputBorderDefault),
      );

  @override
  InputBorder get textInputBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.defaultBorder),
        borderRadius: const BorderRadius.all(
          Radius.circular(_inputBorderRadius),
        ),
      );

  @override
  InputBorder get textInputErrorBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.errorBorder),
        borderRadius: const BorderRadius.all(
          Radius.circular(_inputBorderRadius),
        ),
      );

  @override
  InputBorder get textInputOutlineFocusBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.focusedBorder),
        borderRadius: const BorderRadius.all(
          Radius.circular(_inputBorderRadius),
        ),
      );

  @override
  InputBorder get textInputFillFocusBorderStyle =>
      textInputOutlineFocusBorderStyle;
  @override
  Decoration get breadcrumbDecoration => BoxDecoration(
        color: colors.breadCrumbBackground,
        borderRadius: BorderRadius.circular(_breadcrumbBorderRadius),
        border: Border.all(
          width: _breadcrumbBorderThickness,
          color: colors.boxBorder,
        ),
      );

  @override
  BoxDecoration get checkBoxDefaultDecoration => BoxDecoration(
        color: colors.checkBoxDefaultBackground,
        borderRadius: BorderRadius.circular(_checkBoxBorderRadius),
        border: Border.all(
          color: colors.checkBoxDefaultBorder,
        ),
      );

  @override
  BoxDecoration get checkBoxDisableDefaultDecoration =>
      checkBoxDefaultDecoration.copyWith(
        color: colors.checkBoxDisableDefaultBackground,
        border: Border.all(
          color: colors.checkBoxDisableBorder,
        ),
      );

  @override
  BoxDecoration get checkBoxHoverDecoration =>
      checkBoxDefaultDecoration.copyWith(
        border: Border.all(
          color: colors.checkBoxHoverBorder,
        ),
      );

  @override
  BoxDecoration get checkBoxSelectedDecoration => BoxDecoration(
        color: colors.checkBoxSelectedBackground,
        borderRadius: BorderRadius.circular(_checkBoxBorderRadius),
      );

  @override
  BoxDecoration get checkBoxDisableSelectedDecoration =>
      checkBoxSelectedDecoration.copyWith(
        color: colors.checkBoxDisableSelectedBackground,
      );

  @override
  double get checkBoxIconSize => _checkBoxIconSize;

  @override
  double get checkBoxSize => _checkBoxSize;

  @override
  double get checkBoxRightMargin => _checkBoxRightMargin;
}
