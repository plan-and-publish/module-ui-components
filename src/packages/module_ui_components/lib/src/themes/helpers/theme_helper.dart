part of 'package:module_ui_components/theme/theme_provider.dart';

WidgetStateProperty<Color?>? materialStateColorBuilder({
  required Color hoverColor,
  required Color color,
  Color? pressedColor,
}) =>
    WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return pressedColor ?? hoverColor;
        } else if (states.contains(WidgetState.hovered)) {
          return hoverColor;
        }
        return color;
      },
    );

WidgetStateProperty<BorderSide?>? materialStateSideBuilder({
  required BorderSide hoverBorder,
  required BorderSide border,
  BorderSide? pressedBorder,
}) =>
    WidgetStateProperty.resolveWith<BorderSide>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return pressedBorder ?? hoverBorder;
        } else if (states.contains(WidgetState.hovered)) {
          return hoverBorder;
        }
        return border;
      },
    );

WidgetStateProperty<TextStyle?>? textStyleBuilder(
  textStyle,
) =>
    WidgetStateProperty.all<TextStyle>(textStyle);

WidgetStateProperty<OutlinedBorder?>? filledButtonShapeBuilder(
  borderRadius,
) =>
    WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

WidgetStateProperty<OutlinedBorder?>? navItemShapeBuilder(double cornerRadius) {
  final roundCorner = Radius.circular(cornerRadius);
  final navBorderRadius = BorderRadius.only(
    topRight: roundCorner,
    bottomRight: roundCorner,
  );
  return WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: navBorderRadius,
    ),
  );
}

WidgetStateProperty<OutlinedBorder?>? outlinedButtonShapeBuilder({
  required double borderRadius,
  required Color borderColor,
  required Color hoverBorderColor,
}) =>
    WidgetStateProperty.resolveWith<OutlinedBorder>(
      (states) {
        const interactiveStates = <WidgetState>{
          WidgetState.pressed,
          WidgetState.hovered,
          WidgetState.focused,
        };
        if (states.any(interactiveStates.contains)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: hoverBorderColor),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        );
      },
    );

WidgetStateProperty<EdgeInsetsGeometry?>? buttonPaddingBuilder(
  EdgeInsets padding,
) =>
    WidgetStateProperty.all<EdgeInsetsGeometry>(padding);

WidgetStateProperty<MouseCursor?>? disabledButtonsMouseCursorBuilder() =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.hovered)) {
          return SystemMouseCursors.click;
        }
        return SystemMouseCursors.basic;
      },
    );

WidgetStateProperty<OutlinedBorder?>? fabButtonShapeBuilder(borderRadius) =>
    WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

WidgetStateProperty<Size?>? buttonSizeBuilder(
  double width,
  double height,
) =>
    WidgetStateProperty.all<Size>(
      Size(width, height),
    );

WidgetStateProperty<RoundedRectangleBorder?>? fabOutlinedButtonShapeBuilder({
  required Color borderColor,
  required Color hoverBorderColor,
  required double hoverBorderWidth,
  required double borderRadius,
}) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.hovered)) {
          return RoundedRectangleBorder(
            side: BorderSide(
              width: hoverBorderWidth,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          );
        }
        return RoundedRectangleBorder(
          side: BorderSide(color: hoverBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        );
      },
    );

WidgetStateProperty<double?>? buttonElevationBuilder(
  double elevation,
) =>
    WidgetStateProperty.all<double>(elevation);

WidgetStateProperty<double?>? buttonIconSizeBuilder(
  double elevation,
) =>
    WidgetStateProperty.all<double>(elevation);

WidgetStateProperty<double?>? buttonElevationBuilderWithHover({
  required double hoverElevation,
  required double elevation,
}) =>
    WidgetStateProperty.resolveWith<double>(
      (states) {
        if (states.contains(WidgetState.hovered)) {
          return hoverElevation;
        }
        return elevation;
      },
    );

class CustomTabIndicator extends Decoration {
  const CustomTabIndicator({
    required this.radius,
    required this.indicatorHeight,
    required this.color,
  });
  final double radius;

  final Color color;

  final double indicatorHeight;

  @override
  CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }
}

class CustomPainter extends BoxPainter {
  CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
  ) : super(onChanged);
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final paint = Paint();
    var xAxisPos = offset.dx + configuration.size!.width / 2;
    var yAxisPos = offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.color = color;

    var fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
