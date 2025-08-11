import 'package:flutter/material.dart';

part 'typographies.dart';
part 'colors.dart';
part 'icons.dart';

abstract class IAppThemeData {
  ThemeData get mainTheme;
  ITypographies get typographies;
  IColors get colors;
  IIcons get icons;

  // Dialog
  ShapeBorder get dialogShapeBorder;
  Decoration get dialogHeaderPrimaryDecoration;
  Decoration get dialogHeaderErrorDecoration;
  Border get dialogHeaderBorder;

  // Buttons
  double get mediumButtonIconSize;
  double get smallButtonIconSize;
  double get popupButtonIconSize;
  double get buttonIconMargin;
  EdgeInsets get iconOnlyPopupButtonPadding;
  EdgeInsets get textAndIconButtonSmallPadding;
  EdgeInsets get textAndIconButtonMediumPadding;
  EdgeInsets get iconOnlyButtonSmallPadding;
  EdgeInsets get iconOnlyButtonMediumPadding;
  EdgeInsets get noIconButtonSmallPadding;
  EdgeInsets get noIconButtonMediumPadding;
  double get buttonHeight;
  double get buttonHeightSmall;

  ButtonStyle get primaryFilledButtonStyle;
  ButtonStyle get secondaryFilledButtonStyle;
  ButtonStyle get errorFilledButtonStyle;
  ButtonStyle get disabledPrimaryFilledButtonStyle;
  ButtonStyle get disabledSecondaryFilledButtonStyle;
  ButtonStyle get disabledErrorFilledButtonStyle;
  ButtonStyle get busyPrimaryFilledButtonStyle;
  ButtonStyle get busySecondaryFilledButtonStyle;
  ButtonStyle get busyErrorFilledButtonStyle;

  ButtonStyle get primaryOutlinedButtonStyle;
  ButtonStyle get disabledPrimaryOutlinedButtonStyle;
  ButtonStyle get busyPrimaryOutlinedButtonStyle;

  ButtonStyle get primaryPlainButtonStyle;
  ButtonStyle get disabledPrimaryPlainButtonStyle;
  ButtonStyle get busyPrimaryPlainButtonStyle;

  // NavigationItem
  double get navItemIconMargin;
  double get navItemIconSize;
  double get navItemHeight;
  ButtonStyle get navItemStyle;
  ButtonStyle get selectedNavItemStyle;
  ButtonStyle get disabledNavItemStyle;
  double get navItemSectionMargin;
  EdgeInsets get navItemSectionPadding;
  EdgeInsets get navItemExpandedMargin;
  EdgeInsets get navItemCollapsedMargin;
  double? get navSectionDividerHeight;
  double? get navCollapsedWidth;

  // Toast
  BorderRadius get toastBorderRadius;

  ShapeBorder get contextMenuShapeBorder;
  double get contextMenuElevation;
  BoxDecoration get contextMenuDecoration;

  BoxDecoration get singleSelectDecoration;
  BoxDecoration get singleSelectActionDecoration;

  // card
  BoxDecoration get baseCardDecoration;
  BoxDecoration get cardHoverDecoration;
  BoxDecoration get cardSelectedDecoration;
  BoxDecoration get listWithHandlerDecoration;
  BoxDecoration get listWithHandlerDraggingDecoration;
  BoxDecoration get listWithHandlerHoverDecoration;
  BoxDecoration get listWithHandlerSelectedDecoration;
  BoxDecoration get actionCardDisabledDecoration;
  BoxDecoration get actionCardHoverDecoration;
  BoxDecoration get actionCardPressedDecoration;
  BoxDecoration get iconCardDecoration;
  BoxDecoration get iconCardHoverDecoration;
  BoxDecoration get actionCardDecoration;
  BoxDecoration get iconCardSelectedDecoration;
  BoxDecoration get iconCardDraggingDecoration;
  BoxDecoration get iconCardDraggableDecoration;
  BoxDecoration get iconCardDraggableHoverDecoration;
  BoxDecoration get iconCardDraggableSelectedDecoration;
  TextStyle get cardTitleTextStyle;
  TextStyle get cardSubtitleTextStyle;
  TextStyle get cardDescriptionTextStyle;

  // TextInput
  InputBorder get textInputBorderStyle;
  InputBorder get textInputErrorBorderStyle;
  InputBorder get textInputOutlineFocusBorderStyle;
  InputBorder get textInputFillFocusBorderStyle;
  InputBorder get textInputHoverBorderStyle;
  InputBorder get textInputDisabledBorderStyle;
  EdgeInsets get textInputOutlineSingleLineContentPadding;
  EdgeInsets get textInputOutlineMultiLineContentPadding;
  EdgeInsets get textInputFillSingleLineContentPadding;
  EdgeInsets get textInputFillMultiLineContentPadding;

  // AppBar
  Decoration get appBarDecoration;
  ShapeBorder get appBarShape;
  double? get appBarElevation;

  // Drawer
  Decoration get drawerDecoration;

  // Sidebar
  Decoration get sidebarDecoration;

  // TabBar
  Decoration get tabIndicator;

  // GroupBox
  BorderRadius get groupBoxBorderRadius;

  // DropDown
  Alignment get dropDownTextAlign;
  EdgeInsets get dropDownTextInputPadding;
  TextAlign get dropDownTextInputAlignment;
  double get dropDownInputHorizontalPaddingWeb;
  double get dropDownInputHorizontalPaddingMobile;
  double get dropDownInputVerticalPaddingWeb;
  double get dropDownInputVerticalPaddingMobile;

  // ContextMenuItem
  double get singleLineContextItemHeight;
  double get doubleLineContextItemHeight;

  // Hero
  double get heroSmallSize;
  double get heroMediumSize;
  double get heroLargeSize;

  //Dialog
  Decoration get dialogDecoration;
  EdgeInsets get dialogHeaderPadding;
  EdgeInsets get dialogTitlePadding;
  EdgeInsets get dialogFooterPadding;

  // Segment
  double get segmentBorderRadius;
  BoxDecoration get segmentDecoration;

  // Switch
  double get switchWidth;
  double get switchHeight;
  double get switchBorderRadius;
  double get switchBorderThickness;
  BoxShape get switchThumbIconShape;
  double get switchThumbIconBorderRadius;
  double get switchThumbIconSize;
  EdgeInsets get switchThumbIconPadding;

  // Breadcrumb
  Decoration get breadcrumbDecoration;

  //checkBox
  BoxDecoration get checkBoxDefaultDecoration;
  BoxDecoration get checkBoxDisableDefaultDecoration;
  BoxDecoration get checkBoxSelectedDecoration;
  BoxDecoration get checkBoxDisableSelectedDecoration;
  BoxDecoration get checkBoxHoverDecoration;
  double get checkBoxSize;
  double get checkBoxIconSize;
  double get checkBoxRightMargin;

  TextStyle getTextStyle({
    FontFamily? fontFamily,
    TypographyFamily typographyFamily = TypographyFamily.body1,
    Color? color,
  }) {
    var style = typographies
        .byFontFamily(fontFamily)
        .byTypographyFamily(typographyFamily);

    // if color is not provided there is no reason to create a new instance
    // of the style
    if (color != null) {
      style = style.copyWith(color: color);
    }

    return style;
  }
}
