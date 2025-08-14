part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV2Data extends IAppThemeData {
  _ThemeV2Data(this._tokensBase);
  final _TokensBase _tokensBase;
  static const _defaultBorderRadius = 12.0;
  static const _dialogBorderRadius = 4.0;
  static const _drawerBorderRadius = 4.0;
  static const _contextMenuRadius = 4.0;
  static const _contextMenuElevation = 0.0;
  static const _dialogLTRBorderThickness = 0.0;
  static const _buttonBorderRadius = 4.0;
  static const _buttonElevation = 0.0;
  static const _zeroElevation = 0.0;
  static const _buttonSplashEffect = NoSplash.splashFactory;
  static const _navItemPadding = EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 12.0,
  );
  static const _singleSelectBorderRadius = 14.0;
  static const _singleSelectActionShadowOffset = Offset(0, 2);
  static const _singleSelectActionShadowBlur = 2.5;

  static const _appBarElevation = 0.0;

  static const _sidebarBorderRadius = 4.0;

  static const _scrollbarThickness = 3.0;
  static const _scrollbarRadius = 8.0;
  static const _scrollbarThumbHeight = 162.0;

  static const _tabIndicatorRadius = 4.0;
  static const _tabIndicatorHeight = 2.0;

  static const _groupBoxBorderRadius = 4.0;

  static const _dropDownTextInputPadding =
      EdgeInsets.symmetric(horizontal: 7.0);
  static const _inputVerticalPaddingWeb = 16.0;
  static const _inputVerticalPaddingMobile = 11.5;
  static const _inputHorizontalPaddingWeb = 0.0;
  static const _inputHorizontalPaddingMobile = 0.0;

  static const _singleLineContextItemHeight = 40.0;
  static const _doubleLineContextItemHeight = 56.0;

  static const _heroLargeSize = 120.0;
  static const _heroMediumSize = 96.0;
  static const _heroSmallSize = 40.0;

  static const _buttonHeight = 40.0;
  static const _buttonHeightSmall = 32.0;
  static const _noIconButtonMediumPadding = EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 9.5,
  );
  static const _noIconButtonSmallPadding = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 5.5,
  );
  static const _iconOnlyButtonMediumPadding = EdgeInsets.all(10.0);
  static const _iconOnlyButtonSmallPadding = EdgeInsets.all(8.0);
  static const _textAndIconButtonMediumPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 9.5,
  );
  static const _textAndIconButtonSmallPadding = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 5.5,
  );
  static const _iconOnlyPopupButtonPadding = EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 10.0,
  );
  static const _buttonIconMargin = 8.0;
  static const _mediumButtonIconSize = 20.0;
  static const _smallButtonIconSize = 16.0;
  static const _popupButtonIconSize = 20.0;

  static const _navItemIconMargin = 16.0;
  static const _navItemIconSize = 20.0;
  static const _navItemHeight = 40.0;
  static const _navItemBorderRadius = 4.0;
  static const _navItemSectionMargin = 8.0;
  static const _navItemSectionPadding =
      EdgeInsets.fromLTRB(12.0, 16.0, 24.0, 0.0);
  static const _navItemMargin = EdgeInsets.symmetric(horizontal: 12.0);
  static const _navSectionDividerHeight = 16.0;
  static const _navCollapsedWidth = 68.0;

  static const _dialogHeaderPadding = EdgeInsets.all(4.0);
  static const _dialogTitlePadding = EdgeInsets.only(left: 16);
  static const _dialogFooterPadding = EdgeInsets.all(20);
  static const _segmentBorderRadius = 4.0;
  static const _switchBorderRadius = 4.0;
  static const _switchBorderThickness = 1.0;
  static const _switchWidth = 40.0;
  static const _switchHeight = 20.0;
  static const _switchThumbIconPadding = EdgeInsets.symmetric(horizontal: 1.0);
  static const _switchThumbIconSize = 16.0;
  static const _switchThumbIconBorderRadius = 2.0;

  static const _textInputErrorBorderWidth = 2.0;
  static const _textInputFocusedBorderWidth = 2.0;
  static const _textInputOutlineSingleLineContentPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );
  static const _textInputFillSingleLineContentPadding = EdgeInsets.symmetric(
    horizontal: 8,
  );
  static const _textInputOutlineMultiLineContentPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  );
  static const _textInputFillMultiLineContentPadding = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 8,
  );

  static const _defaultCardsBorderRadius = 4.0;
  static const _cardSelectedBorderWidth = 2.0;
  static const _iconCardBorderRadius = 4.0;
  static const _listWithHandlerSelectedBorderWidth = 2.0;
  static const _breadcrumbBorderRadius = 4.0;
  static const _breadcrumbBorderThickness = 2.0;
  static const _toastBorderRadius = 4.0;

  static const _checkBoxBorderRadius = 4.0;
  static const _checkBoxSize = 20.0;
  static const _checkBoxIconSize = 16.0;
  static const _checkBoxRightMargin = 8.0;

  @override
  ITypographies get typographies => const _ThemeV2Typographies();

  @override
  IColors get colors => _ThemeV2Colors(_tokensBase);

  @override
  IIcons get icons => const _ThemeV2Icons();

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
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_dialogBorderRadius),
        border: Border.all(color: colors.boxBorder),
      );

  @override
  Border get dialogHeaderBorder => Border(
        top: BorderSide(
          color: colors.boxBorder,
          width: _dialogLTRBorderThickness,
        ),
        left: BorderSide(
          color: colors.boxBorder,
          width: _dialogLTRBorderThickness,
        ),
        right: BorderSide(
          color: colors.boxBorder,
          width: _dialogLTRBorderThickness,
        ),
        bottom: BorderSide(color: colors.boxBorder),
      );

  @override
  Decoration get dialogHeaderPrimaryDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_dialogBorderRadius),
          topLeft: Radius.circular(_dialogBorderRadius),
        ),
      );

  @override
  Decoration get dialogHeaderErrorDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_dialogBorderRadius),
          topLeft: Radius.circular(_dialogBorderRadius),
        ),
      );

  //--------- Navigation Item

  @override
  ButtonStyle get navItemStyle => primaryPlainButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.navItemText,
          color: colors.navItemText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.navItemBackgroundHover,
          color: colors.navItemBackground,
        ),
        alignment: Alignment.centerLeft,
        elevation: buttonElevationBuilder(_zeroElevation),
        padding: buttonPaddingBuilder(_navItemPadding),
        shape: navItemShapeBuilder(_navItemBorderRadius),
        textStyle: WidgetStatePropertyAll(
          typographies.byFontFamily().navItemCaption,
        ),
        iconSize: const WidgetStatePropertyAll(_navItemIconSize),
      );

  @override
  ButtonStyle get disabledNavItemStyle => navItemStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(
          colors.navItemText.withAlpha(
            DecorationHelper.opacityToAlpha(0.4),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          colors.navItemBackground.withAlpha(
            DecorationHelper.opacityToAlpha(0.4),
          ),
        ),
      );

  @override
  ButtonStyle get selectedNavItemStyle => navItemStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.navItemTextSelected),
        backgroundColor: WidgetStateProperty.all(
          colors.navItemBackgroundSelected,
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
  EdgeInsets get navItemExpandedMargin => _navItemMargin;

  @override
  EdgeInsets get navItemCollapsedMargin => _navItemMargin;

  @override
  double? get navSectionDividerHeight => _navSectionDividerHeight;

  @override
  double? get navCollapsedWidth => _navCollapsedWidth;

  @override
  BorderRadius get toastBorderRadius =>
      BorderRadius.circular(_toastBorderRadius);

  @override
  ShapeBorder get contextMenuShapeBorder => RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(_contextMenuRadius),
        ),
        side: BorderSide(
          color: colors.boxBorder,
        ),
      );

  @override
  double get contextMenuElevation => _contextMenuElevation;

  @override
  BoxDecoration get contextMenuDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_contextMenuRadius),
        border: Border.all(
          color: colors.boxBorder,
        ),
      );

  // card
  @override
  BoxDecoration get baseCardDecoration => BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(_defaultCardsBorderRadius),
        border: Border.all(color: colors.cardDefaultBorder),
      );

  @override
  BoxDecoration get cardHoverDecoration => baseCardDecoration.copyWith(
        border: Border.all(color: colors.cardHoverBorder),
      );

  @override
  BoxDecoration get cardSelectedDecoration => baseCardDecoration.copyWith(
        border: Border.all(
          color: colors.cardSelectedBorder,
          width: _cardSelectedBorderWidth,
        ),
      );

  @override
  BoxDecoration get listWithHandlerDecoration => BoxDecoration(
        color: colors.listCardDefaultBackground,
        borderRadius: BorderRadius.circular(_defaultCardsBorderRadius),
        border: Border.all(
          color: colors.draggableCardDefaultBorder,
        ),
      );

  @override
  BoxDecoration get listWithHandlerDraggingDecoration =>
      listWithHandlerDecoration.copyWith(
        color: colors.listCardSelectedBackground,
        border: Border.all(
          color: colors.draggableCardSelectedBorder,
          width: _listWithHandlerSelectedBorderWidth,
        ),
      );

  @override
  BoxDecoration get listWithHandlerHoverDecoration =>
      listWithHandlerDecoration.copyWith(
        border: Border.all(
          color: colors.draggableCardHoverBorder,
        ),
      );

  @override
  BoxDecoration get listWithHandlerSelectedDecoration =>
      listWithHandlerDecoration.copyWith(
        border: Border.all(
          color: colors.draggableCardSelectedBorder,
          width: _listWithHandlerSelectedBorderWidth,
        ),
      );

  @override
  BoxDecoration get iconCardDecoration => BoxDecoration(
        color: colors.iconCardDefaultBackground,
        borderRadius: BorderRadius.circular(_iconCardBorderRadius),
        border: Border.all(color: colors.iconCardDefaultBorder),
      );

  @override
  BoxDecoration get iconCardHoverDecoration => iconCardDecoration.copyWith(
        border: Border.all(color: colors.iconCardHoverBorder),
      );

  @override
  BoxDecoration get iconCardSelectedDecoration => iconCardDecoration.copyWith(
        color: colors.iconCardSelectedBackground,
        border: Border.all(
          color: colors.iconCardSelectedBorder,
          width: _cardSelectedBorderWidth,
        ),
      );

  @override
  BoxDecoration get iconCardDraggingDecoration => BoxDecoration(
        color: colors.defaultBackground,
        borderRadius: BorderRadius.circular(_iconCardBorderRadius),
        border: Border.all(
          color: colors.cardSelectedBorder,
          width: _cardSelectedBorderWidth,
        ),
      );

  @override
  BoxDecoration get iconCardDraggableDecoration => iconCardDecoration.copyWith(
        border: Border.all(color: colors.draggableCardDefaultBorder),
      );

  @override
  BoxDecoration get iconCardDraggableHoverDecoration =>
      iconCardDraggableDecoration.copyWith(
        border: Border.all(color: colors.draggableCardHoverBorder),
      );

  @override
  BoxDecoration get iconCardDraggableSelectedDecoration =>
      iconCardDraggableDecoration.copyWith(
        border: Border.all(
          color: colors.draggableCardHoverBorder,
          width: _cardSelectedBorderWidth,
        ),
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
  TextStyle get cardDescriptionTextStyle => typographies
      .byFontFamily()
      .body1
      .copyWith(color: colors.secondaryCaption);

  @override
  TextStyle get cardSubtitleTextStyle => typographies
      .byFontFamily()
      .body2
      .copyWith(color: colors.disabledPrimaryBackground);

  @override
  TextStyle get cardTitleTextStyle => typographies.byFontFamily().headline7;

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
        color: colors.defaultBackground,
        boxShadow: const [],
        border: Border.all(
          color: colors.boxBorder,
        ),
      );

  @override
  ShapeBorder get appBarShape => Border(
        bottom: BorderSide(
          color: colors.appBarBorder,
        ),
      );

  @override
  double? get appBarElevation => _appBarElevation;

  @override
  BoxDecoration get drawerDecoration => appBarDecoration.copyWith(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_drawerBorderRadius),
          bottomRight: Radius.circular(_drawerBorderRadius),
        ),
      );

  @override
  BoxDecoration get sidebarDecoration => appBarDecoration.copyWith(
        color: colors.defaultBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(_sidebarBorderRadius),
        ),
        boxShadow: [],
        border: Border.all(
          color: colors.boxBorder,
        ),
      );

  //----------------Button styles
  //----------------Filled Button
  @override
  ButtonStyle get primaryFilledButtonStyle => ButtonStyle(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.primaryText,
          color: colors.primaryText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillPrimaryBackgroundHovered,
          color: colors.fillPrimaryBackgroundDefault,
          pressedColor: colors.fillPrimaryBackgroundPressed,
        ),
        textStyle: textStyleBuilder(
          typographies.byFontFamily().button,
        ),
        padding: buttonPaddingBuilder(EdgeInsets.zero),
        splashFactory: _buttonSplashEffect,
        shape: filledButtonShapeBuilder(_buttonBorderRadius),
        mouseCursor: disabledButtonsMouseCursorBuilder(),
        elevation: buttonElevationBuilder(_buttonElevation),
        overlayColor: materialStateColorBuilder(
          hoverColor: Colors.transparent,
          color: Colors.transparent,
        ),
      );

  @override
  ButtonStyle get secondaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.fillSecondaryTextHovered,
          color: colors.secondaryText,
          pressedColor: colors.fillSecondaryTextPressed,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillSecondaryBackgroundHovered,
          color: colors.fillSecondaryBackgroundDefault,
          pressedColor: colors.fillSecondaryBackgroundPressed,
        ),
      );

  @override
  ButtonStyle get errorFilledButtonStyle => primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.errorText,
          color: colors.errorText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillErrorBackgroundHovered,
          color: colors.fillErrorBackgroundDefault,
          pressedColor: colors.fillErrorBackgroundPressed,
        ),
      );

  @override
  ButtonStyle get disabledPrimaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.fillPrimaryTextDisabled,
          color: colors.fillPrimaryTextDisabled,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillPrimaryBackgroundDisabled,
          color: colors.fillPrimaryBackgroundDisabled,
        ),
      );

  @override
  ButtonStyle get busyPrimaryFilledButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.primaryText),
        backgroundColor: WidgetStatePropertyAll(
          colors.fillPrimaryBackgroundPressed,
        ),
      );

  @override
  ButtonStyle get busySecondaryFilledButtonStyle =>
      secondaryFilledButtonStyle.copyWith(
        foregroundColor:
            WidgetStateProperty.all(colors.fillSecondaryTextPressed),
        backgroundColor: WidgetStatePropertyAll(
          colors.fillSecondaryBackgroundPressed,
        ),
      );

  @override
  ButtonStyle get busyErrorFilledButtonStyle => errorFilledButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.errorText),
        backgroundColor: WidgetStatePropertyAll(
          colors.fillErrorBackgroundPressed,
        ),
      );

  //----------------Outlined Button
  @override
  ButtonStyle get primaryOutlinedButtonStyle =>
      primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.outlineText,
          color: colors.outlineText,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.outlineBackgroundHovered,
          color: colors.outlineBackgroundDefault,
          pressedColor: colors.outlineBackgroundPressed,
        ),
        side: materialStateSideBuilder(
          border: BorderSide(color: colors.outlineBorderDefault),
          hoverBorder: BorderSide(color: colors.outlineBorderHovered),
          pressedBorder: BorderSide(color: colors.outlineBorderPressed),
        ),
      );

  @override
  ButtonStyle get disabledPrimaryOutlinedButtonStyle =>
      primaryOutlinedButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.outlineTextDisabled,
          color: colors.outlineTextDisabled,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.outlineBackgroundDisabled,
          color: colors.outlineBackgroundDisabled,
        ),
        side: materialStateSideBuilder(
          border: BorderSide(color: colors.outlineBorderDisabled),
          hoverBorder: BorderSide(color: colors.outlineBorderDisabled),
        ),
      );

  @override
  ButtonStyle get busyPrimaryOutlinedButtonStyle =>
      primaryOutlinedButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.outlineText),
        backgroundColor: WidgetStatePropertyAll(
          colors.outlineBackgroundPressed,
        ),
      );

  //----------------Plain Button
  @override
  ButtonStyle get primaryPlainButtonStyle => primaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.plainTextHovered,
          color: colors.plainText,
          pressedColor: colors.plainTextPressed,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.plainBackgroundHovered,
          color: colors.plainBackgroundDefault,
          pressedColor: colors.plainBackgroundPressed,
        ),
      );

  @override
  ButtonStyle get disabledPrimaryPlainButtonStyle =>
      primaryPlainButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.plainTextDisabled,
          color: colors.plainTextDisabled,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.plainBackgroundDisabled,
          color: colors.plainBackgroundDisabled,
        ),
      );

  @override
  ButtonStyle get busyPrimaryPlainButtonStyle =>
      primaryPlainButtonStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(colors.plainTextPressed),
        backgroundColor: WidgetStatePropertyAll(
          colors.plainBackgroundPressed,
        ),
      );

  @override
  Decoration get tabIndicator => CustomTabIndicator(
        color: colors.mainBackground,
        radius: _tabIndicatorRadius,
        indicatorHeight: _tabIndicatorHeight,
      );

  @override
  BorderRadius get groupBoxBorderRadius => BorderRadius.circular(
        _groupBoxBorderRadius,
      );

  //---------------DropDown

  @override
  Alignment get dropDownTextAlign => Alignment.centerLeft;

  @override
  double get doubleLineContextItemHeight => _doubleLineContextItemHeight;

  @override
  double get singleLineContextItemHeight => _singleLineContextItemHeight;

  @override
  EdgeInsets get dropDownTextInputPadding => _dropDownTextInputPadding;

  @override
  TextAlign get dropDownTextInputAlignment => TextAlign.start;

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
  double get heroMediumSize => _heroMediumSize;

  @override
  double get heroSmallSize => _heroSmallSize;

  @override
  double get buttonHeight => _buttonHeight;

  @override
  double get buttonHeightSmall => _buttonHeightSmall;

  @override
  double get buttonIconMargin => _buttonIconMargin;

  @override
  EdgeInsets get iconOnlyButtonMediumPadding => _iconOnlyButtonMediumPadding;

  @override
  EdgeInsets get iconOnlyButtonSmallPadding => _iconOnlyButtonSmallPadding;

  @override
  EdgeInsets get iconOnlyPopupButtonPadding => _iconOnlyPopupButtonPadding;

  @override
  double get mediumButtonIconSize => _mediumButtonIconSize;

  @override
  EdgeInsets get noIconButtonMediumPadding => _noIconButtonMediumPadding;

  @override
  EdgeInsets get noIconButtonSmallPadding => _noIconButtonSmallPadding;

  @override
  double get popupButtonIconSize => _popupButtonIconSize;

  @override
  double get smallButtonIconSize => _smallButtonIconSize;

  @override
  EdgeInsets get textAndIconButtonMediumPadding =>
      _textAndIconButtonMediumPadding;

  @override
  EdgeInsets get textAndIconButtonSmallPadding =>
      _textAndIconButtonSmallPadding;

  @override
  ButtonStyle get disabledErrorFilledButtonStyle =>
      errorFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.fillErrorTextDisabled,
          color: colors.fillErrorTextDisabled,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillErrorBackgroundDisabled,
          color: colors.fillErrorBackgroundDisabled,
        ),
      );

  @override
  ButtonStyle get disabledSecondaryFilledButtonStyle =>
      secondaryFilledButtonStyle.copyWith(
        foregroundColor: materialStateColorBuilder(
          hoverColor: colors.fillSecondaryTextDisabled,
          color: colors.fillSecondaryTextDisabled,
        ),
        backgroundColor: materialStateColorBuilder(
          hoverColor: colors.fillSecondaryBackgroundDisabled,
          color: colors.fillSecondaryBackgroundDisabled,
        ),
      );

  //--------------- Dialog
  @override
  EdgeInsets get dialogHeaderPadding => _dialogHeaderPadding;

  @override
  EdgeInsets get dialogTitlePadding => _dialogTitlePadding;

  @override
  EdgeInsets get dialogFooterPadding => _dialogFooterPadding;

  @override
  double get segmentBorderRadius => _segmentBorderRadius;

  @override
  BoxDecoration get segmentDecoration => BoxDecoration(
        color: colors.segmentItemBackground,
        borderRadius: BorderRadius.circular(segmentBorderRadius),
        border: Border.all(
          color: colors.segmentBorder,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );

//---------------Switch
  @override
  BoxShape get switchThumbIconShape => BoxShape.rectangle;

  @override
  double get switchBorderRadius => _switchBorderRadius;

  @override
  double get switchBorderThickness => _switchBorderThickness;

  @override
  double get switchWidth => _switchWidth;

  @override
  double get switchHeight => _switchHeight;

  @override
  EdgeInsets get switchThumbIconPadding => _switchThumbIconPadding;

  @override
  double get switchThumbIconSize => _switchThumbIconSize;

  @override
  double get switchThumbIconBorderRadius => _switchThumbIconBorderRadius;

  //---------------Text Input

  @override
  EdgeInsets get textInputOutlineSingleLineContentPadding =>
      _textInputOutlineSingleLineContentPadding;

  @override
  EdgeInsets get textInputOutlineMultiLineContentPadding =>
      _textInputOutlineMultiLineContentPadding;

  @override
  EdgeInsets get textInputFillSingleLineContentPadding =>
      _textInputFillSingleLineContentPadding;

  @override
  EdgeInsets get textInputFillMultiLineContentPadding =>
      _textInputFillMultiLineContentPadding;

  @override
  InputBorder get textInputBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(color: colors.textInputBorderDefault),
      );

  @override
  InputBorder get textInputErrorBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.errorBorder,
          width: _textInputErrorBorderWidth,
        ),
      );

  @override
  InputBorder get textInputOutlineFocusBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.focusedBorder,
          width: _textInputFocusedBorderWidth,
        ),
      );

  @override
  InputBorder get textInputFillFocusBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.textInputBorderHovered,
        ),
      );

  @override
  InputBorder get textInputHoverBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.textInputBorderHovered,
        ),
      );

  @override
  InputBorder get textInputDisabledBorderStyle => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.textInputBorderHovered,
        ),
      );

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
