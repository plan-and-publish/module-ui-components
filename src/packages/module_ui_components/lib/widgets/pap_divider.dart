import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

class PAPDivider extends StatelessWidget {
  const PAPDivider({
    required Axis orientation,
    required double thickness,
    Color? color,
    double? width,
    double? height,
    super.key,
  })  : _orientation = orientation,
        _thickness = thickness,
        _height = height,
        _width = width,
        _color = color;

  factory PAPDivider.horizontal({
    Axis orientation = Axis.horizontal,
    double thickness = 1.0,
    double? height,
    Color? color,
  }) {
    return PAPDivider(
      orientation: orientation,
      thickness: thickness,
      height: height,
      color: color,
    );
  }

  factory PAPDivider.vertical({
    Axis orientation = Axis.vertical,
    double thickness = 1.0,
    double? width,
    Color? color,
  }) {
    return PAPDivider(
      orientation: orientation,
      thickness: thickness,
      width: width,
      color: color,
    );
  }

  factory PAPDivider.spacer({
    double? width,
    double? height,
  }) {
    if (width == null || height == null) {
      if (width == null && height == null) {
        throw Exception(
          'either width or height must be provided',
        );
      }
    }
    if (width != null && height != null) {
      throw Exception(
        'width and height are mutually exclusive, only provide one of them',
      );
    }
    return width != null
        ? PAPDivider(
            orientation: Axis.vertical,
            thickness: 1.0,
            width: width,
            color: Colors.transparent,
          )
        : PAPDivider(
            orientation: Axis.horizontal,
            thickness: 1.0,
            height: height,
            color: Colors.transparent,
          );
  }

  final Axis _orientation;
  final double _thickness;
  final double? _width;
  final double? _height;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final color = _color ?? appTheme.colors.divider;
    return _orientation == Axis.horizontal
        ? Divider(
            color: color,
            thickness: _thickness,
            height: _height,
          )
        : VerticalDivider(
            color: color,
            thickness: _thickness,
            width: _width,
          );
  }
}
