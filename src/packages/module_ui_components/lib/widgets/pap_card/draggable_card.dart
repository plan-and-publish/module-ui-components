part of 'pap_card.dart';

class _DraggableCard extends StatelessWidget {
  const _DraggableCard({
    required IAppThemeData appTheme,
    required bool isSelected,
    required double? width,
    required double? height,
    required Widget draggableChild,
    required IconData? edgeIcon,
    required Function()? onEdgeIconTapped,
    double? edgeIconSize,
    bool edgeIconHasBorder = false,
  })  : _appTheme = appTheme,
        _isSelected = isSelected,
        _width = width,
        _height = height,
        _draggableChild = draggableChild,
        _edgeIcon = edgeIcon,
        _onEdgeIconTapped = onEdgeIconTapped,
        _edgeIconSize = edgeIconSize,
        _edgeIconHasBorder = edgeIconHasBorder;

  final IAppThemeData _appTheme;
  final bool _isSelected;
  final double? _width;
  final double? _height;
  final Widget _draggableChild;
  final IconData? _edgeIcon;
  final Function()? _onEdgeIconTapped;
  final double? _edgeIconSize;
  final bool _edgeIconHasBorder;

  static const _edgeIconDefaultSize = 24.0;
  static const _edgeIconWithBorderDefaultSize = 16.0;
  static const _hotZoneSize = 48.0;
  static const _extraSize = 6.0;
  static const _edgeIconDragBottomPosition = -13.5;
  static const _edgeIconDragRightPosition = -12.5;
  static const _edgeIconWithBorderDragBottomPosition = -2.0;
  static const _edgeIconWithBorderDragRightPosition = -2.0;
  static const _edgeIconContainerSize = 24.0;
  static const _edgeIconContainerBorderRadius = 4.0;
  static const _edgeIconPadding = EdgeInsets.only(
    right: 22.0,
    bottom: 22.0,
  );
  static const _transparentColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final edgeIconColor = _isSelected
        ? _appTheme.colors.listCardIconSelected
        : _edgeIconHasBorder
            ? _appTheme.colors.iconBoxDefaultIcon
            : _appTheme.colors.cardEdgeIconColorDefault;
    return SizedBox(
      width: _width != null ? _width + _extraSize : double.infinity,
      height: _height != null ? _height + _extraSize : null,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            child: MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: _draggableChild,
            ),
          ),
          if (_edgeIcon != null)
            Positioned(
              bottom: _edgeIconHasBorder
                  ? _edgeIconWithBorderDragBottomPosition
                  : _edgeIconDragBottomPosition,
              right: _edgeIconHasBorder
                  ? _edgeIconWithBorderDragRightPosition
                  : _edgeIconDragRightPosition,
              child: GestureDetector(
                onTap: _onEdgeIconTapped,
                child: Container(
                  color: _transparentColor,
                  width: _hotZoneSize,
                  height: _hotZoneSize,
                  child: Center(
                    child: Container(
                      width: _edgeIconHasBorder ? _edgeIconContainerSize : null,
                      height:
                          _edgeIconHasBorder ? _edgeIconContainerSize : null,
                      padding: _edgeIconHasBorder
                          ? EdgeInsets.zero
                          : _edgeIconPadding,
                      decoration: _edgeIconHasBorder
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                _edgeIconContainerBorderRadius,
                              ),
                              border: Border.all(
                                color: _appTheme.colors.cardEdgeIconBorder,
                              ),
                            )
                          : null,
                      child: Icon(
                        _edgeIcon,
                        size: _edgeIconSize ??
                            (_edgeIconHasBorder
                                ? _edgeIconWithBorderDefaultSize
                                : _edgeIconDefaultSize),
                        color: edgeIconColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
