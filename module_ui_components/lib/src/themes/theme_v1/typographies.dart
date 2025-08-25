part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV1Typographies extends ITypographies {
  const _ThemeV1Typographies();

  static const _ThemeV1ManropeTypography _manropeTypography =
      _ThemeV1ManropeTypography();

  @override
  ITypography byFontFamily([
    FontFamily? fontFamily,
  ]) {
    return _manropeTypography;
  }
}

class _ThemeV1ManropeTypography extends ITypography {
  const _ThemeV1ManropeTypography();

  static const String manropeFontFamily = 'Manrope';
  static const _h1HeadlineSize = 96.0;
  static const _h2HeadlineSize = 60.0;
  static const _h3HeadlineSize = 48.0;
  static const _h4HeadlineSize = 34.0;
  static const _h5HeadlineSize = 30.0;
  static const _h6HeadlineSize = 24.0;
  static const _h7HeadlineSize = 20.0;
  static const _subtitle1 = 16.0;
  static const _subtitle2 = 14.0;
  static const _body1 = 16.0;
  static const _body2 = 14.0;
  static const _button = 16.0;
  static const _caption = 12.0;
  static const _overline = 10.0;
  static const _defaultTextColor = _ThemeV1Colors.black;
  static const _textInputContentHeight = 1.0;
  static const _h6HeadlineLetterSpacing = 0.18;
  static const _h7HeadlineLetterSpacing = 0.15;
  static const _subtitle1LetterSpacing = 0.08;
  static const _subtitle2LetterSpacing = 0.07;
  static const _buttonLetterSpacing = 1.5;
  static const _body1LetterSpacing = 0.27;
  static const _body2LetterSpacing = 0.24;
  static const _captionLetterSpacing = 0.36;
  static const _overlineLetterSpacing = 1.50;

  TextStyle get _baseTextStyle => const TextStyle(
        fontFamily: manropeFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: _body1,
        color: _defaultTextColor,
      );

  @override
  TextStyle get headline1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h1HeadlineSize,
      );

  @override
  TextStyle get headline2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h2HeadlineSize,
      );

  @override
  TextStyle get headline3 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h3HeadlineSize,
      );

  @override
  TextStyle get headline4 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h4HeadlineSize,
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
        letterSpacing: _h6HeadlineLetterSpacing,
      );

  @override
  TextStyle get headline7 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h7HeadlineSize,
        letterSpacing: _h7HeadlineLetterSpacing,
      );

  @override
  TextStyle get subtitle1 => _getSubtitle1TextStyle();

  @override
  TextStyle get subtitle2 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _subtitle2,
        letterSpacing: _subtitle2LetterSpacing,
      );

  @override
  TextStyle get body1 => _baseTextStyle.copyWith(
        letterSpacing: _body1LetterSpacing,
      );

  @override
  TextStyle get body2 => _baseTextStyle.copyWith(
        fontSize: _body2,
        letterSpacing: _body2LetterSpacing,
      );

  @override
  TextStyle get button => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _button,
        letterSpacing: _buttonLetterSpacing,
      );

  @override
  TextStyle get caption => _baseTextStyle.copyWith(
        fontSize: _caption,
        letterSpacing: _captionLetterSpacing,
      );

  @override
  TextStyle get overLine => _getOverlineTextStyle();

  @override
  TextStyle get dropDownCaption => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: _overline,
        letterSpacing: _overlineLetterSpacing,
      );

  @override
  TextStyle get navItemCaption => _getSubtitle1TextStyle();

  @override
  TextStyle get navItemSectionCaption => _getOverlineTextStyle();

  TextStyle _getSubtitle1TextStyle() {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: _subtitle1,
      letterSpacing: _subtitle1LetterSpacing,
    );
  }

  TextStyle _getOverlineTextStyle() {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: _overline,
      letterSpacing: _overlineLetterSpacing,
    );
  }

  @override
  TextStyle get dialogTitle => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h7HeadlineSize,
        letterSpacing: _h7HeadlineLetterSpacing,
      );

  @override
  TextStyle get textInputContentOutline => caption.copyWith(
        height: _textInputContentHeight,
      );

  @override
  TextStyle get textInputContentFill => textInputContentOutline;

  @override
  TextStyle get textInputHelper => _baseTextStyle.copyWith(
        fontSize: _caption,
        letterSpacing: _captionLetterSpacing,
      );

  @override
  TextStyle get iconCardTitle => _getSubtitle1TextStyle();
}
