import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:module_ui_components/theme/app_theme.dart';

class PAPLoading extends StatelessWidget {
  const PAPLoading({
    List<Color>? indicatorsColor,
    Color? backgroundColor,
    double? size,
    super.key,
  })  : _indicatorsColor = indicatorsColor,
        _backgroundColor = backgroundColor,
        _size = size;

  final List<Color>? _indicatorsColor;
  final Color? _backgroundColor;
  final double? _size;

  @override
  Widget build(BuildContext context) {
    final defaultLoadingColor = AppTheme.of(context).theme.colors.disabledText;
    const defaultSize = 20.0;

    return SizedBox(
      height: _size ?? defaultSize,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: _indicatorsColor ?? [defaultLoadingColor],
        backgroundColor: _backgroundColor ?? Colors.transparent,
        pathBackgroundColor: Colors.transparent,
      ),
    );
  }
}
