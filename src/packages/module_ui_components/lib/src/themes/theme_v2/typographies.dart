part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV2Typographies extends ITypographies {
  const _ThemeV2Typographies();

  static const _ThemeV2DMSansTypography _dmSansTypography =
      _ThemeV2DMSansTypography();

  @override
  ITypography byFontFamily([
    FontFamily? fontFamily,
  ]) {
    return _dmSansTypography;
  }
}

class _ThemeV2DMSansTypography extends ITypography {
  const _ThemeV2DMSansTypography();

  static const String fontFamilyName = 'DMSans';
  static const _h1HeadlineSize = 96.0; // remove
  static const _h2HeadlineSize = 60.0; // remove
  static const _h3HeadlineSize = 40.0; // xl display
  static const _h4HeadlineSize = 32.0; //lg display
  static const _h5HeadlineSize = 28.0; // md display
  static const _h6HeadlineSize = 24.0; //sm display
  static const _h7HeadlineSize = 20.0; // text 2xl
  static const _subtitle1 = 18.0; // text xl
  static const _subtitle2 = 14.0; // remove
  static const _body1 = 16.0; // text lg
  static const _body2 = 14.0; // text md
  static const _caption = 12.0; // text sm
  static const _overline = 10.0; // text xs
  static const _defaultTextColor = _ThemeV2ColorPallet.black;
  static const _textHeight = 1.5;

  TextStyle get _baseTextStyle => const TextStyle(
        fontFamily: fontFamilyName,
        fontWeight: FontWeight.w400,
        package: 'module_ui_components',
        fontSize: _body1,
        color: _defaultTextColor,
        height: _textHeight,
        leadingDistribution: TextLeadingDistribution.even,
      );

  @override
  TextStyle get headline1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h1HeadlineSize,
        height: 1.24,
      );

  @override
  TextStyle get headline2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h2HeadlineSize,
        height: 1.24,
      );

  @override
  TextStyle get headline3 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h3HeadlineSize,
        height: 1.24,
      );

  @override
  TextStyle get headline4 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h4HeadlineSize,
        height: 1.02,
      );

  @override
  TextStyle get headline5 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h5HeadlineSize,
      );

  @override
  TextStyle get headline6 => _baseTextStyle.copyWith(
        fontSize: _h6HeadlineSize,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headline7 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h7HeadlineSize,
      );

  @override
  TextStyle get subtitle1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _subtitle1,
      );

  @override
  TextStyle get subtitle2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _subtitle2,
      );

  @override
  TextStyle get body1 => _baseTextStyle;

  @override
  TextStyle get body2 => _baseTextStyle.copyWith(
        fontSize: _body2,
      );

  @override
  TextStyle get button => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _body2,
        height: _textHeight,
      );

  @override
  TextStyle get caption => _baseTextStyle.copyWith(
        fontSize: _caption,
      );

  @override
  TextStyle get overLine => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _overline,
      );

  @override
  TextStyle get dropDownCaption => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _caption,
      );

  @override
  TextStyle get navItemCaption => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _body2,
      );

  @override
  TextStyle get navItemSectionCaption => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _caption,
      );

  @override
  TextStyle get dialogTitle => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get textInputContentOutline => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _body2,
      );

  @override
  TextStyle get textInputContentFill => textInputContentOutline.copyWith(
        fontSize: _caption,
      );

  @override
  TextStyle get textInputHelper => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _overline,
      );

  @override
  TextStyle get iconCardTitle => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _body2,
      );
}
