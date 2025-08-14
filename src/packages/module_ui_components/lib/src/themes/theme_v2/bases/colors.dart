part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV2Colors implements IColors {
  const _ThemeV2Colors(this._tokensBase);

  static const _opacity = 0.4;
  static const _dialogBarrierOpacity = 0.64;
  static const _checkBoxDisableOpacity = 0.4;
  static const _drawerScrimOpacity = 0.64;
  final _TokensBase _tokensBase;

  @override
  Color get transparent => _ThemeV2ColorPallet.transparent;

  @override
  Color get defaultText => _tokensBase.contentPrimaryLight;

  @override
  Color get primaryText => _tokensBase.contentStatic;

  @override
  Color get errorText => _tokensBase.contentStatic;

  @override
  Color get primaryTitleText => _tokensBase.contentPrimary;

  @override
  Color get appBackground => _tokensBase.surfaceArea;

  @override
  Color get mainBackground => _tokensBase.surfaceAccentDefault;

  @override
  Color get defaultBackground => _tokensBase.surfaceDefault;

  @override
  Color get areaBackground => _tokensBase.surfaceAreaDarker;

  @override
  Color get subtitleText => _tokensBase.contentTertiary;

  @override
  Color get selectedText => _tokensBase.contentAccent;

  @override
  Color get disabledPrimaryBackground => _tokensBase.contentPrimary;

  @override
  Color get divider => _tokensBase.borderDefault;

  @override
  Color get disabledText => _tokensBase.contentAccentDisabled;

  @override
  Color get headerPrimaryBackground => _tokensBase.surfaceMinimal;

  @override
  Color get headerWarningBackground => _tokensBase.surfaceMinimal;

  @override
  Color get secondaryText => _tokensBase.contentAccent;

  @override
  Color get defaultBorder => _tokensBase.contentSecondary;

  @override
  Color get warningBorder => _tokensBase.borderWarning;

  @override
  Color get navItemText => _tokensBase.contentPrimary;

  @override
  Color get navItemTextSelected => _tokensBase.contentAccent;

  @override
  Color get navItemBackground => _tokensBase.surfaceDefault;

  @override
  Color get navItemBackgroundSelected => _tokensBase.surfaceAccentLightSubtle;

  @override
  Color get navItemBackgroundHover => _tokensBase.surfaceMinimal;

  @override
  Color get navItemBackgroundDisabled => _tokensBase.surfaceSubtleLighter;

  @override
  Color get navSectionText => _tokensBase.contentTertiary;

  @override
  Color get successBackground => _tokensBase.surfaceSuccess;

  @override
  Color get successLight => _tokensBase.contentSuccess;

  @override
  Color get successCaption => _tokensBase.contentSuccess;

  @override
  Color get successDark => _tokensBase.contentSuccess;

  @override
  Color get errorBackground => _tokensBase.surfaceError;

  @override
  Color get errorLight => _tokensBase.contentError;

  @override
  Color get errorCaption => _tokensBase.contentError;

  @override
  Color get errorDark => _tokensBase.contentError;

  @override
  Color get primaryLightBackground => _tokensBase.surfaceDefault;

  @override
  Color get primaryDarkBackground => _tokensBase.contentAccent;

  @override
  Color get primaryBackground => _tokensBase.surfaceInfo;

  @override
  Color get primaryLight => _tokensBase.contentInfo;

  @override
  Color get primaryCaption => _tokensBase.contentInfo;

  @override
  Color get primaryDark => _tokensBase.contentInfo;

  @override
  Color get warningBackground => _tokensBase.surfaceWarning;

  @override
  Color get warningLightBackground => _tokensBase.contentWarning;

  @override
  Color get warningLight => _tokensBase.contentWarning;

  @override
  Color get warningCaption => _tokensBase.contentWarning;

  @override
  Color get warningDark => _tokensBase.contentWarning;

  @override
  Color get secondaryBackground => _tokensBase.surfaceSubtle;

  @override
  Color get secondaryLight => _tokensBase.contentPrimaryLight;

  @override
  Color get secondaryCaption => _tokensBase.contentPrimaryLight;

  @override
  Color get secondaryDark => _tokensBase.contentPrimaryLight;

  @override
  Color get primaryBorder => _tokensBase.borderDefaultLight;

  @override
  Color get secondaryBorder => _tokensBase.borderDefaultSubtle;

  @override
  Color get drawerScrim => _tokensBase.surfaceBackdrop.withAlpha(
        DecorationHelper.opacityToAlpha(_drawerScrimOpacity),
      );

  @override
  Color get shadow => _tokensBase.surfaceStrong;

  @override
  Color get focusedBorder => _tokensBase.borderAccent;

  @override
  Color get focusedBorderDark => _tokensBase.borderAccent;

  @override
  Color get errorBorder => _tokensBase.borderError;

  @override
  Color get errorBorderDark => _tokensBase.borderError;

  @override
  Color get defaultLabel => _tokensBase.contentTertiary;

  @override
  Color get focusedLabel => _tokensBase.contentAccent;

  @override
  Color get successLabel => _tokensBase.contentSuccess;

  @override
  Color get errorLabel => _tokensBase.contentError;

  @override
  Color get defaultHelper => _tokensBase.contentTertiary;

  @override
  Color get successIcon => _tokensBase.contentSuccess;

  @override
  Color get errorIcon => _tokensBase.contentError;

  @override
  Color get shimmerBase => _tokensBase.surfaceModerate;

  @override
  Color get shimmerHighlight => _tokensBase.surfaceMinimal;

  @override
  Color get breadCrumbBackground => _tokensBase.surfaceSubtle;

  @override
  Color get breadCrumbItemHighlight => _tokensBase.surfaceSubtleLighter;

  @override
  Color get breadCrumbItemWithIcon => _tokensBase.contentWarning;

  @override
  List<Color> get greyScaleColors => _SharedPallet.greyScaleColors;

  @override
  List<Color> get themePalette => _SharedPallet.paletteColors;

  @override
  Color get contentBackground => _tokensBase.surfaceDefault;

  @override
  Color get boxBorder => _tokensBase.borderDefault;

  @override
  Color get badgeDemotedBackground => _tokensBase.surfaceStatic;

  @override
  Color get badgeDemotedBorder => _tokensBase.borderDefault;

  @override
  Color get badgeDemotedIcon => _tokensBase.contentAccentDisabled;

  @override
  Color get badgeElevatedBackground => _tokensBase.contentAccent;

  @override
  Color get badgeElevatedBorder => _tokensBase.contentStatic;

  @override
  Color get badgeElevatedIcon => _tokensBase.contentStatic;

  @override
  Color get groupBoxTitle => _tokensBase.contentPrimary;

  @override
  Color get dropDownActiveBackground => _tokensBase.surfaceCanvas;

  @override
  Color get dropDownDefaultBackground => _tokensBase.surfaceMinimal;

  @override
  Color get dropDownActiveBorder => _tokensBase.borderDark;

  @override
  Color get dropDownDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get dropDownErrorText => _tokensBase.contentError;

  @override
  Color get dropDownDefaultText => _tokensBase.contentPrimaryLight;

  @override
  Color get dropDownDisabledText => _tokensBase.contentTertiary;

  @override
  Color get dropDownActiveText => _tokensBase.contentPrimaryLight;

  @override
  Color get dropDownActiveIcon => _tokensBase.contentPrimaryLight;

  @override
  Color get dropDownDefaultIcon => _tokensBase.contentTertiary;

  @override
  Color get dropDownDisabledIcon => _tokensBase.contentTertiary;

  @override
  Color get dropDownErrorBackground => _tokensBase.surfaceCanvas;

  @override
  Color get dropDownOutlinedActiveBorder => _tokensBase.borderDark;

  @override
  Color get dropDownOutlinedDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get dropDownTextInputCursorColor => _tokensBase.contentPrimaryLight;

  @override
  Color get heroBackground => _tokensBase.surfaceAccentLightMinimal;

  @override
  Color get heroText => _tokensBase.contentAccent;

  @override
  Color get fillPrimaryBackgroundDefault => _tokensBase.surfaceAccentDefault;

  @override
  Color get fillPrimaryBackgroundHovered =>
      _tokensBase.surfaceAccentDefaultLighter;

  @override
  Color get fillPrimaryBackgroundPressed =>
      _tokensBase.surfaceAccentDefaultDarker;

  @override
  Color get fillPrimaryBackgroundDisabled => _tokensBase.surfaceStrong;

  @override
  Color get fillPrimaryTextDisabled => _tokensBase.contentAccentDisabled;

  @override
  Color get fillSecondaryBackgroundDefault =>
      _tokensBase.surfaceActionSecondary;

  @override
  Color get fillSecondaryBackgroundHovered => _tokensBase.surfaceActionPrimary;

  @override
  Color get fillSecondaryBackgroundPressed => _tokensBase.surfaceActionTertiary;

  @override
  Color get fillSecondaryBackgroundDisabled =>
      _tokensBase.surfaceActionSecondary.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get fillSecondaryTextDisabled => _tokensBase.contentAccent.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get fillSecondaryTextHovered => _tokensBase.contentAccentDarker;

  @override
  Color get fillSecondaryTextPressed => _tokensBase.contentAccentDarker;

  @override
  Color get outlineBackgroundDefault => _tokensBase.surfaceSubtle;

  @override
  Color get outlineBackgroundHovered => _tokensBase.surfaceMinimal;

  @override
  Color get outlineBackgroundPressed => _tokensBase.surfaceSubtle;

  @override
  Color get outlineBackgroundDisabled => _tokensBase.surfaceMinimal.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get outlineText => _tokensBase.contentPrimaryLight;

  @override
  Color get outlineTextDisabled => _tokensBase.contentPrimaryLight.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get outlineBorderDefault => _tokensBase.borderDark;

  @override
  Color get outlineBorderDisabled => _tokensBase.borderDark.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get outlineBorderHovered => _tokensBase.borderDarker;

  @override
  Color get outlineBorderPressed => _tokensBase.borderDarker;

  @override
  Color get plainBackgroundDefault => _ThemeV2ColorPallet.transparent;

  @override
  Color get plainBackgroundHovered => _tokensBase.surfaceMinimal;

  @override
  Color get plainBackgroundPressed => _tokensBase.surfaceAccentLightSubtle;

  @override
  Color get plainBackgroundDisabled => _ThemeV1Colors.transparent;

  @override
  Color get plainText => _tokensBase.contentSecondary;

  @override
  Color get plainTextDisabled => _tokensBase.contentSecondary.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get plainTextHovered => _tokensBase.contentPrimaryLight;

  @override
  Color get plainTextPressed => _tokensBase.contentAccent;

  @override
  Color get fillErrorBackgroundDefault => _tokensBase.surfaceActionErrorDefault;

  @override
  Color get fillErrorBackgroundHovered => _tokensBase.surfaceActionErrorLighter;

  @override
  Color get fillErrorBackgroundPressed => _tokensBase.surfaceActionErrorDarker;

  @override
  Color get fillErrorBackgroundDisabled => _tokensBase.surfaceStrong;

  @override
  Color get fillErrorTextDisabled => _tokensBase.contentAccentDisabled;

  @override
  Color get dialogBorder => _tokensBase.borderDefault;

  @override
  Color get dialogHeaderText => _tokensBase.contentPrimary;

  @override
  Color get dialogBarrier => _tokensBase.surfaceBackdrop.withAlpha(
        DecorationHelper.opacityToAlpha(_dialogBarrierOpacity),
      );

  @override
  Color get dialogCloseIcon => _tokensBase.contentTertiary;

  @override
  Color get dialogFooterDivider => _ThemeV2ColorPallet.transparent;

  @override
  Color get dialogTitleErrorColor => _tokensBase.contentPrimary;

  @override
  Color get dialogTitlePrimaryColor => _tokensBase.contentPrimary;

  @override
  Color get dialogActionErrorColor => _tokensBase.surfaceActionErrorDefault;

  @override
  Color get dialogActionPrimaryColor => _tokensBase.surfaceAccentDefault;

  @override
  Color get fabOverlay => _tokensBase.surfaceBackdrop;

  @override
  Color get segmentBorder => _tokensBase.borderDefaultLight;

  @override
  Color get segmentItemBackground => _tokensBase.surfaceMinimal;

  @override
  Color get segmentItemSelectedBackground => _tokensBase.surfaceCanvas;

  @override
  Color get segmentItemHoveredBackground => _tokensBase.surfaceModerate;

  @override
  Color get segmentItemForeground => _tokensBase.contentPrimaryLight;

  @override
  Color get appBarBackground => _tokensBase.surfaceDefault;

  @override
  Color get appBarForeground => _tokensBase.contentTertiary;

  @override
  Color get appBarBorder => _tokensBase.borderDefault;

  @override
  Color get switchActiveBackground => _tokensBase.surfaceAccentDefault;

  @override
  Color get switchActiveBorder => _ThemeV2ColorPallet.transparent;

  @override
  Color get switchActiveDisabledBackground =>
      _tokensBase.surfaceAccentDefault.withAlpha(
        DecorationHelper.opacityToAlpha(_opacity),
      );

  @override
  Color get switchBackground => _tokensBase.surfaceStrong;

  @override
  Color get switchBorder => _ThemeV2ColorPallet.transparent;

  @override
  Color get switchDisabledBackground => _tokensBase.surfaceModerate;

  @override
  Color get switchDisabledBorder => _ThemeV2ColorPallet.transparent;

  @override
  Color get switchDisabledThumbIcon => _tokensBase.surfaceDefault;

  @override
  Color get switchThumbIcon => _tokensBase.surfaceDefault;

  @override
  Color get switchActiveThumbIcon => _tokensBase.surfaceDefault;

  @override
  Color get textInputOutlineBackgroundDefault => _tokensBase.surfaceSubtle;

  @override
  Color get textInputFillBackgroundDefault => _tokensBase.surfaceMinimal;

  @override
  Color get textInputFillBackgroundFocused => _tokensBase.surfaceCanvas;

  @override
  Color get textInputOutlineBackgroundDisabled => _tokensBase.surfaceModerate;

  @override
  Color get textInputBorderDefault => _tokensBase.borderDefaultLight;

  @override
  Color get textInputBorderError => _tokensBase.borderError;

  @override
  Color get textInputBorderFocused => _tokensBase.borderAccent;

  @override
  Color get textInputBorderHovered => _tokensBase.borderDark;

  @override
  Color get textInputContent => _tokensBase.contentPrimaryLight;

  @override
  Color get textInputIconDefault => _tokensBase.contentTertiary;

  @override
  Color get textInputIconError => _tokensBase.contentError;

  @override
  Color get textInputIconFocused => _tokensBase.contentAccent;

  @override
  Color get textInputHintText => _tokensBase.contentTertiary;

  @override
  Color get textInputHelperDefault => _tokensBase.contentTertiary;

  @override
  Color get textInputContentDisabled => _tokensBase.contentTertiary;

  @override
  Color get textInputHelperError => _tokensBase.contentError;

  @override
  Color get textInputHelperFocused => _tokensBase.contentAccent;

  @override
  Color get textInputIconSuccess => _tokensBase.contentPrimaryLight;

  @override
  Color get cardDefaultBorder => _tokensBase.borderDefault;

  @override
  Color get cardHoverBorder => _tokensBase.borderDark;

  @override
  Color get cardSelectedBorder => _tokensBase.borderAccent;

  @override
  Color get cardBackground => _tokensBase.surfaceDefault;

  @override
  Color get iconCardDefaultBackground => _tokensBase.surfaceSubtleLighter;

  @override
  Color get iconCardSelectedBackground => _tokensBase.surfaceDefault;

  @override
  Color get listCardDefaultBackground => _tokensBase.surfaceSubtleLighter;

  @override
  Color get listCardSelectedBackground => _tokensBase.surfaceDefault;

  @override
  Color get draggableCardDefaultBorder => _tokensBase.borderDark;

  @override
  Color get draggableCardHoverBorder => _tokensBase.borderDarker;

  @override
  Color get draggableCardSelectedBorder => _tokensBase.borderAccent;

  @override
  Color get iconCardDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get iconCardHoverBorder => _tokensBase.borderDarker;

  @override
  Color get iconCardSelectedBorder => _tokensBase.borderAccent;

  @override
  Color get cardSubTitleDefault => _tokensBase.contentSecondary;

  @override
  Color get cardTitleDefault => _tokensBase.contentPrimary;

  @override
  Color get iconCardContentDefault => _tokensBase.contentPrimaryLight;

  @override
  Color get iconCardContentSelected => _tokensBase.contentAccentStrong;

  @override
  Color get listCardIconDefault => _tokensBase.contentTertiary;

  @override
  Color get listCardIconHovered => _tokensBase.contentSecondary;

  @override
  Color get listCardIconSelected => _tokensBase.contentAccentStrong;

  @override
  Color get listCardTitleDefault => _tokensBase.contentPrimary;

  @override
  Color get listCardTitleSelected => _tokensBase.contentAccentStrong;

  @override
  Color get cardEdgeIconColorDefault => _tokensBase.contentTertiary;

  @override
  Color get cardEdgeIconBorder => _tokensBase.borderDark;

  @override
  Color get imageCardHeaderBackground => _tokensBase.surfaceMinimal;

  @override
  Color get cardImagePlaceHolder => _tokensBase.surfaceModerate;

  @override
  Color get actionCardDefaultBackground => _tokensBase.surfaceDefault;

  @override
  Color get actionCardDefaultBorder => _tokensBase.borderDefault;

  @override
  Color get actionCardDisabledBackground => _tokensBase.surfaceMinimal;

  @override
  Color get actionCardPressedBorder => _tokensBase.borderAccent;

  @override
  Color get actionCardHoverBorder => _tokensBase.borderDark;

  @override
  Color get actionCardSubTitleDefault => _tokensBase.contentSecondary;

  @override
  Color get actionCardSubTitleDisabled => _tokensBase.contentTertiary;

  @override
  Color get actionCardTitleDefault => _tokensBase.contentPrimaryLight;

  @override
  Color get actionCardTitleDisabled => _tokensBase.contentTertiary;

  @override
  Color get actionCardDefaultIconColor => _tokensBase.contentTertiary;

  @override
  Color get numericInputDefaultBackground => _tokensBase.surfaceMinimal;

  @override
  Color get numericInputFocusBackground => _tokensBase.surfaceCanvas;

  @override
  Color get numericInputEmbeddedBackground => _tokensBase.surfaceSubtle;

  @override
  Color get numericInputDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get numericInputFocusBorder => _tokensBase.borderDark;

  @override
  Color get numericInputDefaultForeground => _tokensBase.contentPrimaryLight;

  @override
  Color get numericInputDisabledForeground => _tokensBase.contentTertiary;

  @override
  Color get numericInputErrorForeground => _tokensBase.contentError;

  @override
  Color get numericInputSuffixIcon => _tokensBase.contentTertiary;

  @override
  Color get stepperDefaultBackground => _tokensBase.surfaceSubtle;

  @override
  Color get stepperFocusBackground => _tokensBase.surfaceCanvas;

  @override
  Color get stepperDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get stepperFocusBorder => _tokensBase.borderDark;

  @override
  Color get iconBoxDefaultBackground => _tokensBase.surfaceSubtleLighter;

  @override
  Color get iconBoxDefaultBorder => _tokensBase.borderDefaultLight;

  @override
  Color get iconBoxDefaultIcon => _tokensBase.contentPrimaryLight;

  @override
  Color get iconBoxHoverBorder => _tokensBase.borderDarker;

  @override
  Color get iconBoxSelectedBackground => _tokensBase.surfaceDefault;

  @override
  Color get iconBoxSelectedBorder => _tokensBase.borderAccent;

  @override
  Color get iconBoxSelectedIcon => _tokensBase.contentAccent;

  @override
  Color get checkBoxDefaultBorder => _tokensBase.borderDark;

  @override
  Color get checkBoxHoverBorder => _tokensBase.borderDarker;

  @override
  Color get checkBoxSelectedBackground => _tokensBase.contentAccent;

  @override
  Color get checkBoxDefaultBackground => _tokensBase.surfaceSubtleLighter;

  @override
  Color get checkBoxIconColor => _tokensBase.contentStatic;

  @override
  Color get checkBoxTitleColor => _tokensBase.contentPrimaryLight;

  @override
  Color get checkBoxDisableBorder => _tokensBase.borderDark.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get checkBoxDisableDefaultBackground =>
      _tokensBase.surfaceSubtleLighter.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get checkBoxDisableIconColor => _tokensBase.contentStatic.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get checkBoxDisableSelectedBackground =>
      _tokensBase.contentAccent.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get checkBoxDisableTitleColor =>
      _tokensBase.contentPrimaryLight.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get breadCrumbItemOnlongPress => _tokensBase.surfaceMinimal;

  @override
  Color get breadCrumbTextOnlongPress => _tokensBase.contentPrimaryLight;

  @override
  Color get toasterDismissAllButton => _tokensBase.contentPrimary.withAlpha(
        DecorationHelper.opacityToAlpha(_checkBoxDisableOpacity),
      );

  @override
  Color get radioButtonInnerCircleColor => _tokensBase.surfaceAccentDefault;

  @override
  Color get radioButtonOuterCircleColor => _tokensBase.borderDark;

  @override
  Color get folderIconColor => _tokensBase.surfaceAccentLightModerate;
}
