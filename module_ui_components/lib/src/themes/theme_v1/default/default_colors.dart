part of 'package:module_ui_components/theme/theme_provider.dart';

class _Colors implements IColors {
  const _Colors();

  static const _opacity = .5;

  @override
  Color get transparent => _ThemeV1Colors.transparent;

  @override
  Color get defaultText => _ThemeV1Colors.black;

  @override
  Color get primaryText => _ThemeV1Colors.blue01;

  @override
  Color get errorText => _ThemeV1Colors.red01;

  @override
  Color get primaryTitleText => _ThemeV1Colors.blue08;

  @override
  Color get appBackground => _ThemeV1Colors.white;

  @override
  Color get mainBackground => _ThemeV1Colors.blue05;

  @override
  Color get defaultBackground => _ThemeV1Colors.white;

  @override
  Color get areaBackground => _ThemeV1Colors.white;

  @override
  Color get subtitleText => _ThemeV1Colors.grey04;

  @override
  Color get selectedText => _ThemeV1Colors.blue05;

  @override
  Color get disabledPrimaryBackground => _ThemeV1Colors.grey04;

  @override
  Color get divider => _ThemeV1Colors.grey01;

  @override
  Color get disabledText => _ThemeV1Colors.grey02;

  @override
  Color get headerPrimaryBackground => _ThemeV1Colors.blue01.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get headerWarningBackground => _ThemeV1Colors.red0;

  @override
  Color get secondaryText => _ThemeV1Colors.white;

  @override
  Color get defaultBorder => _ThemeV1Colors.grey03;

  @override
  Color get warningBorder => _ThemeV1Colors.yellow01;

  @override
  Color get navItemText => _ThemeV1Colors.grey06;

  @override
  Color get navItemTextSelected => _ThemeV1Colors.grey06;

  @override
  Color get navItemBackground => _ThemeV1Colors.grey01;

  @override
  Color get navItemBackgroundHover => _ThemeV1Colors.grey01;

  @override
  Color get navItemBackgroundSelected => _ThemeV1Colors.grey01;

  @override
  Color get navItemBackgroundDisabled => _ThemeV1Colors.grey01;

  @override
  Color get navSectionText => _ThemeV1Colors.grey04;

  @override
  Color get successBackground => _ThemeV1Colors.green0;

  @override
  Color get successLight => _ThemeV1Colors.green04;

  @override
  Color get successCaption => _ThemeV1Colors.green05;

  @override
  Color get successDark => _ThemeV1Colors.green06;

  @override
  Color get errorBackground => _ThemeV1Colors.red0;

  @override
  Color get errorLight => _ThemeV1Colors.red04;

  @override
  Color get errorCaption => _ThemeV1Colors.red05;

  @override
  Color get errorDark => _ThemeV1Colors.red06;

  @override
  Color get primaryLightBackground => _ThemeV1Colors.blueBG;

  @override
  Color get primaryDarkBackground => _ThemeV1Colors.blue04;

  @override
  Color get primaryBackground => _ThemeV1Colors.blue0;

  @override
  Color get primaryLight => _ThemeV1Colors.blue03;

  @override
  Color get primaryCaption => _ThemeV1Colors.blue05;

  @override
  Color get primaryDark => _ThemeV1Colors.blue06;

  @override
  Color get warningBackground => _ThemeV1Colors.orange0;

  @override
  Color get warningLightBackground => _ThemeV1Colors.yellow01;

  @override
  Color get warningLight => _ThemeV1Colors.orange04;

  @override
  Color get warningCaption => _ThemeV1Colors.orange05;

  @override
  Color get warningDark => _ThemeV1Colors.orange06;

  @override
  Color get secondaryBackground => _ThemeV1Colors.grey0;

  @override
  Color get secondaryLight => _ThemeV1Colors.grey03;

  @override
  Color get secondaryCaption => _ThemeV1Colors.grey05;

  @override
  Color get secondaryDark => _ThemeV1Colors.grey06;

  @override
  Color get primaryBorder => _ThemeV1Colors.grey02;

  @override
  Color get secondaryBorder => _ThemeV1Colors.grey02;

  @override
  Color get drawerScrim => _ThemeV1Colors.black.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get shadow => _ThemeV1Colors.grey05.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get focusedBorder => _ThemeV1Colors.blue04;

  @override
  Color get focusedBorderDark => _ThemeV1Colors.blue05;

  @override
  Color get errorBorder => _ThemeV1Colors.red04;

  @override
  Color get errorBorderDark => _ThemeV1Colors.red05;

  @override
  Color get defaultLabel => _ThemeV1Colors.grey06;

  @override
  Color get focusedLabel => _ThemeV1Colors.blue04;

  @override
  Color get successLabel => _ThemeV1Colors.green05;

  @override
  Color get errorLabel => _ThemeV1Colors.red04;

  @override
  Color get defaultHelper => _ThemeV1Colors.grey03;

  @override
  Color get successIcon => _ThemeV1Colors.green05;

  @override
  Color get errorIcon => _ThemeV1Colors.red04;

  @override
  Color get shimmerBase => _ThemeV1Colors.grey01;

  @override
  Color get shimmerHighlight => _ThemeV1Colors.grey0;

  @override
  Color get breadCrumbBackground => _ThemeV1Colors.grey0;

  @override
  Color get breadCrumbItemHighlight => _ThemeV1Colors.grey01;

  @override
  Color get breadCrumbItemWithIcon => _ThemeV1Colors.purple04;

  @override
  List<Color> get greyScaleColors => _SharedPallet.greyScaleColors;

  @override
  List<Color> get themePalette => _SharedPallet.paletteColors;

  @override
  Color get contentBackground => _ThemeV1Colors.lightGrey.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get boxBorder => _ThemeV1Colors.lightGrey;

  @override
  Color get badgeDemotedBackground => _ThemeV1Colors.grey400;

  @override
  Color get badgeDemotedBorder => _ThemeV1Colors.grey500;

  @override
  Color get badgeDemotedIcon => _ThemeV1Colors.grey500;

  @override
  Color get badgeElevatedBackground => _ThemeV1Colors.grey600;

  @override
  Color get badgeElevatedBorder => _ThemeV1Colors.grey300;

  @override
  Color get badgeElevatedIcon => _ThemeV1Colors.white;

  @override
  Color get groupBoxTitle => _ThemeV1Colors.black;

  @override
  Color get dropDownActiveBackground => _ThemeV1Colors.blue0;

  @override
  Color get dropDownDefaultBackground => _ThemeV1Colors.grey0;

  @override
  Color get dropDownActiveBorder => Colors.transparent;

  @override
  Color get dropDownDefaultBorder => Colors.transparent;

  @override
  Color get dropDownErrorText => _ThemeV1Colors.red05;

  @override
  Color get dropDownDefaultText => _ThemeV1Colors.grey04;

  @override
  Color get dropDownDisabledText => _ThemeV1Colors.grey02;

  @override
  Color get dropDownActiveText => _ThemeV1Colors.blue05;

  @override
  Color get dropDownActiveIcon => _ThemeV1Colors.blue05;

  @override
  Color get dropDownDefaultIcon => _ThemeV1Colors.grey05;

  @override
  Color get dropDownDisabledIcon => _ThemeV1Colors.grey02;

  @override
  Color get dropDownErrorBackground => _ThemeV1Colors.red0;

  @override
  Color get dropDownOutlinedActiveBorder => _ThemeV1Colors.blue05;

  @override
  Color get dropDownOutlinedDefaultBorder => Colors.transparent;

  @override
  Color get dropDownTextInputCursorColor => _ThemeV1Colors.grey05;

  @override
  Color get heroBackground => _ThemeV1Colors.grey04;

  @override
  Color get heroText => _ThemeV1Colors.white;

  @override
  Color get fillSecondaryBackgroundDefault => _ThemeV1Colors.blue0;

  @override
  Color get fillSecondaryBackgroundHovered => _ThemeV1Colors.blue0;

  @override
  Color get fillSecondaryBackgroundPressed => _ThemeV1Colors.blue0;

  @override
  Color get fillSecondaryBackgroundDisabled => _ThemeV1Colors.blue0;

  @override
  Color get fillSecondaryTextDisabled => _ThemeV1Colors.blue05;

  @override
  Color get fillSecondaryTextHovered => _ThemeV1Colors.blue05;

  @override
  Color get fillSecondaryTextPressed => _ThemeV1Colors.blue05;

  @override
  Color get fillPrimaryBackgroundDefault => _ThemeV1Colors.blue04;

  @override
  Color get fillPrimaryBackgroundHovered => _ThemeV1Colors.blue04;

  @override
  Color get fillPrimaryBackgroundPressed => _ThemeV1Colors.blue04;

  @override
  Color get fillPrimaryBackgroundDisabled => _ThemeV1Colors.grey02;

  @override
  Color get fillPrimaryTextDisabled => _ThemeV1Colors.grey04;

  @override
  Color get outlineBackgroundDefault => _ThemeV1Colors.grey0;

  @override
  Color get outlineBackgroundHovered => _ThemeV1Colors.grey0;

  @override
  Color get outlineBackgroundPressed => _ThemeV1Colors.grey0;

  @override
  Color get outlineBackgroundDisabled => _ThemeV1Colors.grey0;

  @override
  Color get outlineBorderDefault => _ThemeV1Colors.grey02;

  @override
  Color get outlineBorderDisabled => _ThemeV1Colors.grey02;

  @override
  Color get outlineBorderHovered => _ThemeV1Colors.grey03;

  @override
  Color get outlineBorderPressed => _ThemeV1Colors.grey03;

  @override
  Color get outlineText => _ThemeV1Colors.grey06;

  @override
  Color get outlineTextDisabled => _ThemeV1Colors.grey06;

  @override
  Color get plainBackgroundDefault => _ThemeV1Colors.transparent;

  @override
  Color get plainBackgroundHovered => _ThemeV1Colors.grey01;

  @override
  Color get plainBackgroundPressed => _ThemeV1Colors.blueBG;

  @override
  Color get plainBackgroundDisabled => _ThemeV1Colors.transparent;

  @override
  Color get plainText => _ThemeV1Colors.grey05;

  @override
  Color get plainTextDisabled => _ThemeV1Colors.grey05;

  @override
  Color get plainTextHovered => _ThemeV1Colors.grey06;

  @override
  Color get plainTextPressed => _ThemeV1Colors.blue05;

  @override
  Color get fillErrorBackgroundDefault => _ThemeV1Colors.red05;

  @override
  Color get fillErrorBackgroundHovered => _ThemeV1Colors.red05;

  @override
  Color get fillErrorBackgroundPressed => _ThemeV1Colors.red05;

  @override
  Color get fillErrorBackgroundDisabled => _ThemeV1Colors.grey02;

  @override
  Color get fillErrorTextDisabled => _ThemeV1Colors.grey05;

  @override
  Color get dialogBorder => _ThemeV1Colors.grey03;

  @override
  Color get dialogHeaderText => _ThemeV1Colors.grey06;

  @override
  Color get dialogBarrier => _ThemeV1Colors.black.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get dialogCloseIcon => _ThemeV1Colors.grey05;

  @override
  Color get dialogFooterDivider => _ThemeV1Colors.grey01;

  @override
  Color get dialogTitleErrorColor => _ThemeV1Colors.red05;

  @override
  Color get dialogTitlePrimaryColor => _ThemeV1Colors.blue08;

  @override
  Color get dialogActionErrorColor => _ThemeV1Colors.red05;

  @override
  Color get dialogActionPrimaryColor => _ThemeV1Colors.blue05;

  @override
  Color get fabOverlay => _ThemeV1Colors.black.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get segmentBorder => _ThemeV1Colors.transparent;

  @override
  Color get segmentItemBackground => _ThemeV1Colors.transparent;

  @override
  Color get segmentItemSelectedBackground => _ThemeV1Colors.blue0;

  @override
  Color get segmentItemHoveredBackground => _ThemeV1Colors.blue0;

  @override
  Color get segmentItemForeground => _ThemeV1Colors.grey04;

  @override
  Color get appBarBackground => _ThemeV1Colors.white;

  @override
  Color get appBarForeground => _ThemeV1Colors.blue05;

  @override
  Color get appBarBorder => _ThemeV1Colors.transparent;

  @override
  Color get switchActiveBackground => _ThemeV1Colors.white;

  @override
  Color get switchActiveBorder => _ThemeV1Colors.blue05;

  @override
  Color get switchActiveDisabledBackground => _ThemeV1Colors.white;

  @override
  Color get switchBackground => _ThemeV1Colors.white;

  @override
  Color get switchBorder => _ThemeV1Colors.grey03;

  @override
  Color get switchDisabledBackground => _ThemeV1Colors.white;

  @override
  Color get switchDisabledBorder => _ThemeV1Colors.grey02;

  @override
  Color get switchThumbIcon => _ThemeV1Colors.grey03;

  @override
  Color get switchActiveThumbIcon => _ThemeV1Colors.blue05;

  @override
  Color get switchDisabledThumbIcon => _ThemeV1Colors.grey02;

  @override
  Color get textInputOutlineBackgroundDefault => _ThemeV1Colors.grey0;

  @override
  Color get textInputFillBackgroundDefault => _ThemeV1Colors.grey0;

  @override
  Color get textInputFillBackgroundFocused => _ThemeV1Colors.grey0;

  @override
  Color get textInputOutlineBackgroundDisabled => _ThemeV1Colors.grey500;

  @override
  Color get textInputBorderDefault => _ThemeV1Colors.grey500;

  @override
  Color get textInputBorderError => _ThemeV1Colors.grey500;

  @override
  Color get textInputBorderFocused => _ThemeV1Colors.blue04;

  @override
  Color get textInputBorderHovered => _ThemeV1Colors.grey500;

  @override
  Color get textInputContent => _ThemeV1Colors.grey500;

  @override
  Color get textInputIconDefault => _ThemeV1Colors.grey500;

  @override
  Color get textInputIconError => _ThemeV1Colors.red04;

  @override
  Color get textInputIconFocused => _ThemeV1Colors.grey500;

  @override
  Color get textInputHintText => _ThemeV1Colors.grey02;

  @override
  Color get textInputHelperDefault => _ThemeV1Colors.grey05;

  @override
  Color get textInputContentDisabled => _ThemeV1Colors.grey05;

  @override
  Color get textInputHelperError => _ThemeV1Colors.red04;

  @override
  Color get textInputHelperFocused => _ThemeV1Colors.blue04;

  @override
  Color get textInputIconSuccess => _ThemeV1Colors.green04;

  @override
  Color get cardDefaultBorder => _ThemeV1Colors.grey03;

  @override
  Color get cardHoverBorder => _ThemeV1Colors.blue05;

  @override
  Color get cardSelectedBorder => _ThemeV1Colors.grey03;

  @override
  Color get cardBackground => _ThemeV1Colors.white;

  @override
  Color get iconCardDefaultBackground => _ThemeV1Colors.white;

  @override
  Color get iconCardSelectedBackground => _ThemeV1Colors.white;

  @override
  Color get listCardDefaultBackground => _ThemeV1Colors.white;

  @override
  Color get listCardSelectedBackground => _ThemeV1Colors.white;

  @override
  Color get draggableCardDefaultBorder => _ThemeV1Colors.grey03;

  @override
  Color get draggableCardHoverBorder => _ThemeV1Colors.grey03;

  @override
  Color get draggableCardSelectedBorder => _ThemeV1Colors.grey03;

  @override
  Color get iconCardDefaultBorder => _ThemeV1Colors.grey03;

  @override
  Color get iconCardHoverBorder => _ThemeV1Colors.grey03;

  @override
  Color get iconCardSelectedBorder => _ThemeV1Colors.grey03;

  @override
  Color get cardSubTitleDefault => _ThemeV1Colors.grey03;

  @override
  Color get cardTitleDefault => _ThemeV1Colors.grey03;

  @override
  Color get iconCardContentDefault => _ThemeV1Colors.grey03;

  @override
  Color get iconCardContentSelected => _ThemeV1Colors.grey03;

  @override
  Color get listCardIconDefault => _ThemeV1Colors.grey03;

  @override
  Color get listCardIconHovered => _ThemeV1Colors.grey03;

  @override
  Color get listCardIconSelected => _ThemeV1Colors.grey03;

  @override
  Color get listCardTitleDefault => _ThemeV1Colors.grey03;

  @override
  Color get listCardTitleSelected => _ThemeV1Colors.grey03;

  @override
  Color get cardEdgeIconColorDefault => _ThemeV1Colors.grey03;

  @override
  Color get cardEdgeIconBorder => _ThemeV1Colors.grey03;

  @override
  Color get imageCardHeaderBackground => _ThemeV1Colors.white;

  @override
  Color get cardImagePlaceHolder => _ThemeV1Colors.grey02;

  @override
  Color get actionCardDefaultBackground => _ThemeV1Colors.grey0;

  @override
  Color get actionCardDefaultBorder => _ThemeV1Colors.grey01;

  @override
  Color get actionCardDisabledBackground => _ThemeV1Colors.grey0;

  @override
  Color get actionCardPressedBorder => _ThemeV1Colors.grey0;

  @override
  Color get actionCardHoverBorder => _ThemeV1Colors.blue03;

  @override
  Color get actionCardSubTitleDefault => _ThemeV1Colors.grey02;

  @override
  Color get actionCardSubTitleDisabled => _ThemeV1Colors.grey03;

  @override
  Color get actionCardTitleDefault => _ThemeV1Colors.grey0;

  @override
  Color get actionCardTitleDisabled => _ThemeV1Colors.grey0;

  @override
  Color get actionCardDefaultIconColor => _ThemeV1Colors.grey02;

  @override
  Color get numericInputDefaultBackground => _ThemeV1Colors.blue0;

  @override
  Color get numericInputFocusBackground => _ThemeV1Colors.grey0;

  @override
  Color get numericInputEmbeddedBackground => _ThemeV1Colors.blue0;

  @override
  Color get numericInputDefaultBorder => _ThemeV1Colors.transparent;

  @override
  Color get numericInputFocusBorder => _ThemeV1Colors.transparent;

  @override
  Color get numericInputDefaultForeground => _ThemeV1Colors.black;

  @override
  Color get numericInputDisabledForeground => _ThemeV1Colors.grey02;

  @override
  Color get numericInputErrorForeground => _ThemeV1Colors.red01;

  @override
  Color get numericInputSuffixIcon => _ThemeV1Colors.grey05;

  @override
  Color get stepperDefaultBackground => _ThemeV1Colors.grey0;

  @override
  Color get stepperFocusBackground => _ThemeV1Colors.grey0;

  @override
  Color get stepperDefaultBorder => _ThemeV1Colors.grey02;

  @override
  Color get stepperFocusBorder => _ThemeV1Colors.blue04;

  @override
  Color get iconBoxDefaultBackground => _ThemeV1Colors.grey0;

  @override
  Color get iconBoxDefaultBorder => _ThemeV1Colors.grey02;

  @override
  Color get iconBoxDefaultIcon => _ThemeV1Colors.grey02;

  @override
  Color get iconBoxHoverBorder => _ThemeV1Colors.grey02;

  @override
  Color get iconBoxSelectedBackground => _ThemeV1Colors.grey0;

  @override
  Color get iconBoxSelectedBorder => _ThemeV1Colors.blue04;

  @override
  Color get iconBoxSelectedIcon => _ThemeV1Colors.blue04;

  @override
  Color get checkBoxDefaultBorder => _ThemeV1Colors.grey02;

  @override
  Color get checkBoxHoverBorder => _ThemeV1Colors.grey02;

  @override
  Color get checkBoxSelectedBackground => _ThemeV1Colors.blue04;

  @override
  Color get checkBoxDefaultBackground => _ThemeV1Colors.blue04;

  @override
  Color get checkBoxIconColor => _ThemeV1Colors.grey0;

  @override
  Color get checkBoxTitleColor => _ThemeV1Colors.grey0;

  @override
  Color get checkBoxDisableBorder => _ThemeV1Colors.grey02;

  @override
  Color get checkBoxDisableDefaultBackground => _ThemeV1Colors.grey02;

  @override
  Color get checkBoxDisableIconColor => _ThemeV1Colors.grey02;

  @override
  Color get checkBoxDisableSelectedBackground => _ThemeV1Colors.blue03;

  @override
  Color get checkBoxDisableTitleColor => _ThemeV1Colors.grey02;

  @override
  Color get breadCrumbItemOnlongPress => _ThemeV1Colors.grey0;

  @override
  Color get breadCrumbTextOnlongPress => _ThemeV1Colors.blue03;

  @override
  Color get toasterDismissAllButton => _ThemeV1Colors.grey02;

  @override
  Color get radioButtonOuterCircleColor => _ThemeV1Colors.grey02;

  @override
  Color get radioButtonInnerCircleColor => _ThemeV1Colors.blue04;
  
  @override
  Color get folderIconColor => _ThemeV1Colors.blue03;
}
