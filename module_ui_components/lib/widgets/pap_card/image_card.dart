part of 'pap_card.dart';

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    required IAppThemeData appTheme,
    required String title,
    required String subtitle,
    required String imagePath,
    required List<ContextMenuAction>? menuActions,
    double? width,
    double height = 198.0,
  })  : _appTheme = appTheme,
        _title = title,
        _subTitle = subtitle,
        _imagePath = imagePath,
        _menuActions = menuActions,
        _width = width,
        _height = height;

  final String _title;
  final String _subTitle;
  final String _imagePath;
  final double? _width;
  final double _height;
  final IAppThemeData _appTheme;
  final List<ContextMenuAction>? _menuActions;

  static const _cardHeaderHeight = 80.0;
  static const _titlePadding = EdgeInsets.only(top: 40.0, bottom: 4.0);
  static const _subtitlePadding = EdgeInsets.only(left: 8, right: 8);
  static const _firebaseIconTopPosition = 44.0;
  static const _firebaseIconZeroPosition = 0.0;
  static const _iconContainerSize = 72.0;
  static const _actionIconTopPosition = 2.0;
  static const _actionIconRightPosition = 3.0;
  static const _defaultMenuWidth = 157.0;
  static const _cardHeaderBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(4.0),
    topRight: Radius.circular(4.0),
  );
  static const _defaultMenuShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: _cardHeaderHeight,
                decoration: BoxDecoration(
                  borderRadius: _cardHeaderBorderRadius,
                  color: _appTheme.colors.imageCardHeaderBackground,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: _titlePadding,
                      child: PAPText(
                        text: _title,
                        style: _appTheme.typographies
                            .byFontFamily()
                            .headline7
                            .copyWith(color: _appTheme.colors.cardTitleDefault),
                      ),
                    ),
                    Padding(
                      padding: _subtitlePadding,
                      child: PAPText(
                        text: _subTitle,
                        textAlign: TextAlign.center,
                        textOverflow: TextOverflow.ellipsis,
                        style: _appTheme.typographies
                            .byFontFamily()
                            .body2
                            .copyWith(
                              color: _appTheme.colors.cardSubTitleDefault,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: _firebaseIconTopPosition,
            left: _firebaseIconZeroPosition,
            right: _firebaseIconZeroPosition,
            child: Container(
              width: _iconContainerSize,
              height: _iconContainerSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _appTheme.colors.defaultBackground,
              ),
              child: Image.asset(_imagePath),
            ),
          ),
          if (_menuActions != null)
            Positioned(
              top: _actionIconTopPosition,
              right: _actionIconRightPosition,
              child: PAPContextMenu(
                actions: _menuActions,
                menuItemType: ContextMenuItemType.singleLineContext,
                menuWidth: _defaultMenuWidth,
                menuShapeBorder: _defaultMenuShape,
              ),
            ),
        ],
      ),
    );
  }
}
