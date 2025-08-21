import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

abstract class DecorationHelper {
  static InnerShadow getChildWithShadowEffect({
    required Widget child,
    double blur = 0,
    Color color = Colors.black,
    Offset offset = const Offset(0, 0),
  }) {
    return InnerShadow(
      blur: blur,
      color: color,
      offset: offset,
      child: child,
    );
  }

  static int opacityToAlpha(double opacity) {
    return (opacity * 255).round();
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    required Widget child,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    super.key,
  }) : super(
          child: child,
        );

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = RenderInnerShadow();
    updateRenderObject(
      context,
      renderObject,
    );
    return renderObject;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderInnerShadow renderObject,
  ) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
    if (child == null) return;

    final rectOuter = offset & size;
    final rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final canvas = context.canvas
      ..saveLayer(
        rectOuter,
        Paint(),
      );
    context.paintChild(
      child!,
      offset,
    );
    final shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
      )
      ..colorFilter = ColorFilter.mode(
        color,
        BlendMode.srcOut,
      );

    canvas
      ..saveLayer(
        rectOuter,
        shadowPaint,
      )
      ..saveLayer(
        rectInner,
        Paint(),
      )
      ..translate(
        dx,
        dy,
      );
    context.paintChild(
      child!,
      offset,
    );
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
