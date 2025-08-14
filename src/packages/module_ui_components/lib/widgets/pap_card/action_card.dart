part of 'pap_card.dart';

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required IAppThemeData appTheme,
    required String title,
    required String description,
    required Function() onTap,
    IconData? icon,
    double? width,
    double? height,
    bool isEnabled = true,
    int? descriptionMaxLines = 3,
  })  : _appTheme = appTheme,
        _title = title,
        _description = description,
        _icon = icon,
        _width = width,
        _isEnabled = isEnabled,
        _descriptionMaxLines = descriptionMaxLines,
        _onTap = onTap,
        _height = height;

  final IAppThemeData _appTheme;
  final String _title;
  final String _description;
  final double? _width;
  final double? _height;
  final bool _isEnabled;
  final IconData? _icon;
  final int? _descriptionMaxLines;
  final void Function() _onTap;

  static const _promptBoxPadding = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 16.0,
  );
  static const _spaceBetweenTitleAndChatText = 4.0;
  static const _spaceBetweenIconAndText = 16.0;
  static const _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isEnabled ? _onTap : null,
      child: SizedBox(
        width: _width,
        height: _height,
        child: Padding(
          padding: _promptBoxPadding,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PAPText(
                      text: _title,
                      style:
                          _appTheme.typographies.byFontFamily().body2.copyWith(
                                color: _isEnabled
                                    ? _appTheme.colors.actionCardTitleDefault
                                    : _appTheme.colors.actionCardTitleDisabled,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    const SizedBox(height: _spaceBetweenTitleAndChatText),
                    PAPText(
                      text: _description,
                      style: _appTheme.typographies
                          .byFontFamily()
                          .caption
                          .copyWith(
                            color: _isEnabled
                                ? _appTheme.colors.actionCardSubTitleDefault
                                : _appTheme.colors.actionCardSubTitleDisabled,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLine: _descriptionMaxLines,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: _spaceBetweenIconAndText,
              ),
              Icon(
                _icon,
                color: _appTheme.colors.actionCardDefaultIconColor,
                size: _iconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
