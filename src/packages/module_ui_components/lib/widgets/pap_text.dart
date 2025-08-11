import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/bases/bases.dart';

class PAPText extends StatelessShimmerWidget {
  const PAPText({
    required String text,
    FontFamily? fontFamily,
    TypographyFamily typography = TypographyFamily.body1,
    Color? color,
    TextStyle? style,
    int? maxLine,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    super.isShimmerEnabled = false,
    super.key,
  })  : _text = text,
        _typography = typography,
        _fontFamily = fontFamily,
        _color = color,
        _style = style,
        _maxLine = maxLine,
        _textAlign = textAlign,
        _softWrap = softWrap,
        _textOverflow = textOverflow;

  factory PAPText.shimmer({
    String text = 'Text',
    TypographyFamily typography = TypographyFamily.body1,
  }) {
    return PAPText(
      text: text,
      typography: typography,
      isShimmerEnabled: true,
    );
  }

  final String _text;
  final FontFamily? _fontFamily;
  final TypographyFamily _typography;
  final Color? _color;
  final TextStyle? _style;
  final int? _maxLine;
  final TextAlign? _textAlign;
  final bool? _softWrap;
  final TextOverflow? _textOverflow;

  @override
  Widget buildLoaded(BuildContext context) {
    final defaultStyle = _getDefaultStyle(context: context);
    return Text(
      _text,
      style: _style ?? defaultStyle,
      maxLines: _maxLine,
      textAlign: _textAlign,
      softWrap: _softWrap,
      overflow: _textOverflow,
    );
  }

  @override
  Widget buildLoading(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final defaultStyle = _getDefaultStyle(context: context);
    return Container(
      width: double.infinity,
      color: appTheme.colors.defaultBackground,
      child: Text(
        _text,
        style: _style ?? defaultStyle,
        maxLines: _maxLine,
      ),
    );
  }

  TextStyle _getDefaultStyle({required BuildContext context}) {
    final appTheme = AppTheme.of(context).theme;
    return appTheme.getTextStyle(
      fontFamily: _fontFamily,
      typographyFamily: _typography,
      color: _color ?? appTheme.colors.secondaryCaption,
    );
  }
}
