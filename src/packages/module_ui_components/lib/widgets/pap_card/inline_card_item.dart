part of 'pap_card.dart';

class _InlineCardItem extends StatelessWidget {
  const _InlineCardItem({
    required IAppThemeData appTheme,
    required String title,
    required String subtitle,
    required String description,
    required CardViewType viewType,
    required Image? image,
    required bool isIconHovered,
    required bool showActionsDivider,
    required List<ContextMenuAction>? actions,
    required ValueChanged<bool>? onHover,
    required ValueChanged<bool> onIconHover,
    required String actionButtonLabel,
    int descriptionMaxLines = 2,
    double? width,
    double height = 212.0,
    double? borderWidth,
    bool isShimmerEnabled = false,
    Function()? onActionButtonTapped,
  })  : _appTheme = appTheme,
        _title = title,
        _subtitle = subtitle,
        _description = description,
        _actionButtonLabel = actionButtonLabel,
        _descriptionMaxLines = descriptionMaxLines,
        _width = width,
        _height = height,
        _borderWidth = borderWidth,
        _isShimmerEnabled = isShimmerEnabled,
        _viewType = viewType,
        _image = image,
        _isIconHovered = isIconHovered,
        _showActionsDivider = showActionsDivider,
        _actions = actions,
        _onHover = onHover,
        _onIconHover = onIconHover,
        _onActionButtonTapped = onActionButtonTapped;

  final String _title;
  final String _subtitle;
  final String _description;
  final String _actionButtonLabel;
  final int _descriptionMaxLines;
  final double? _width;
  final double _height;
  final double? _borderWidth;
  final IAppThemeData _appTheme;
  final bool _isShimmerEnabled;
  final CardViewType _viewType;
  final Image? _image;
  final bool _isIconHovered;
  final bool _showActionsDivider;
  final List<ContextMenuAction>? _actions;
  final ValueChanged<bool>? _onHover;
  final ValueChanged<bool> _onIconHover;
  final Function()? _onActionButtonTapped;

  static const _spaceBetweenContentAndImage = 16.0;
  static const _mainContainerPadding = EdgeInsets.all(12.0);
  static const _minWidthToIncludeImage = 672;
  static const _minCardWidth = 328.0;
  static const _maxCardWidth = 966.0;
  static const _actionButtonPadding = EdgeInsets.only(
    left: 12.0,
    top: 10.0,
    bottom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final showImage = constraints.maxWidth + (_borderWidth ?? 0) * 2 >=
            _minWidthToIncludeImage;
        return Container(
          height: _height,
          width: _width,
          constraints: const BoxConstraints(
            maxWidth: _maxCardWidth,
            minWidth: _minCardWidth,
          ),
          padding: _mainContainerPadding,
          child: Row(
            children: [
              Expanded(
                child: _buildContentColumn(),
              ),
              if (showImage)
                const SizedBox(
                  width: _spaceBetweenContentAndImage,
                ),
              Visibility(
                visible: showImage,
                child: _buildImage(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContentColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardBody.buildCardBody(
          appTheme: _appTheme,
          isShimmerEnabled: _isShimmerEnabled,
          viewType: _viewType,
          title: _title,
          subtitle: _subtitle,
          description: _description,
          descriptionMaxLines: _descriptionMaxLines,
          isIconHovered: _isIconHovered,
          showActionsDivider: _showActionsDivider,
          papActionButtons: null,
          actions: _actions,
          onHover: _onHover,
          onIconHover: _onIconHover,
        ),
        Padding(
          padding: _actionButtonPadding,
          child: PAPButton.button(
            title: _actionButtonLabel,
            buttonSize: ButtonSize.small,
            styleType: ButtonStyleType.outline,
            onTap: _onActionButtonTapped,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: _CardBody.buildImage(
        appTheme: _appTheme,
        isShimmerEnabled: _isShimmerEnabled,
        image: _image,
        viewType: _viewType,
      ),
    );
  }
}
