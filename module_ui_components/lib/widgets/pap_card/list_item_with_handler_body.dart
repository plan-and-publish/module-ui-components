part of 'pap_card.dart';

class _ListItemWithHandlerBody<T> extends StatefulWidget {
  const _ListItemWithHandlerBody({
    required IAppThemeData appTheme,
    required bool isSelected,
    required bool isCardHovered,
    required bool isDragging,
    required bool isShimmerEnabled,
    required bool showActionsDivider,
    required String title,
    required List<ContextMenuAction>? actions,
    required void Function() onDragStarted,
    required void Function(DraggableDetails) onDragEnd,
    required T? draggableData,
    bool isDraggable = true,
    super.key,
  })  : _appTheme = appTheme,
        _isSelected = isSelected,
        _isCardHovered = isCardHovered,
        _isDragging = isDragging,
        _isShimmerEnabled = isShimmerEnabled,
        _showActionsDivider = showActionsDivider,
        _title = title,
        _actions = actions,
        _draggableData = draggableData,
        _onDragStarted = onDragStarted,
        _onDragEnd = onDragEnd,
        _isDraggable = isDraggable;

  final IAppThemeData _appTheme;
  final bool _isSelected;
  final bool _isCardHovered;
  final bool _isDragging;
  final bool _isShimmerEnabled;
  final bool _showActionsDivider;
  final String _title;
  final List<ContextMenuAction>? _actions;
  final bool _isDraggable;
  final T? _draggableData;
  final Function() _onDragStarted;
  final Function(DraggableDetails) _onDragEnd;

  @override
  State<_ListItemWithHandlerBody> createState() =>
      _BuildListItemWithHandlerBodyState();
}

class _BuildListItemWithHandlerBodyState
    extends State<_ListItemWithHandlerBody> {
  static const listItemWithHandlerWidthFeedback = 304.0;
  static const listItemWithHandlerHeight = 48.0;
  static const listItemWithHandlerHeightFeedback = 48.0;
  static const iconMargin = EdgeInsets.all(4.0);
  static const itemHandlerMargin = EdgeInsets.all(4.0);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final iconColor =
        widget._isSelected || widget._isDragging || !widget._isDraggable
            ? appTheme.colors.listCardIconSelected
            : widget._isCardHovered
                ? appTheme.colors.listCardIconHovered
                : appTheme.colors.listCardIconDefault;
    final titleColor =
        widget._isSelected || widget._isDragging || !widget._isDraggable
            ? appTheme.colors.listCardTitleSelected
            : appTheme.colors.listCardTitleDefault;
    return Material(
      color: widget._appTheme.colors.transparent,
      child: Container(
        width: widget._isDraggable ? null : listItemWithHandlerWidthFeedback,
        height: widget._isDraggable
            ? listItemWithHandlerHeight
            : listItemWithHandlerHeightFeedback,
        decoration: !widget._isDraggable
            ? appTheme.listWithHandlerDraggingDecoration
            : widget._isSelected
                ? appTheme.listWithHandlerSelectedDecoration
                : widget._isCardHovered
                    ? appTheme.listWithHandlerHoverDecoration
                    : appTheme.listWithHandlerDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget._isDraggable
                ? Draggable(
                    data: widget._draggableData,
                    feedback: _ListItemWithHandlerBody(
                      appTheme: widget._appTheme,
                      isSelected: widget._isSelected,
                      isCardHovered: widget._isCardHovered,
                      isDragging: false,
                      isShimmerEnabled: widget._isShimmerEnabled,
                      showActionsDivider: widget._showActionsDivider,
                      title: widget._title,
                      actions: widget._actions,
                      draggableData: widget._draggableData,
                      onDragEnd: (details) => widget._onDragEnd(details),
                      onDragStarted: () => widget._onDragStarted(),
                      isDraggable: false,
                    ),
                    child: Padding(
                      padding: itemHandlerMargin,
                      child: PAPButton.icon(
                        icon: appTheme.icons.navGripVertical,
                        foregroundColor: iconColor,
                        onTap: () {},
                      ),
                    ),
                  )
                : Padding(
                    padding: itemHandlerMargin,
                    child: PAPButton.icon(
                      icon: appTheme.icons.navGripVertical,
                      foregroundColor: iconColor,
                    ),
                  ),
            Expanded(
              child: PAPText(
                style: appTheme.typographies.byFontFamily().body2.copyWith(
                      color: titleColor,
                    ),
                text: widget._title,
                color: titleColor,
                typography: TypographyFamily.subtitle1,
              ),
            ),
            if (widget._actions != null)
              Container(
                margin: iconMargin,
                child: PAPContextMenu(
                  actions: widget._actions!,
                  dividerType: widget._showActionsDivider
                      ? PAPContextMenuDividerType.line
                      : PAPContextMenuDividerType.space,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
