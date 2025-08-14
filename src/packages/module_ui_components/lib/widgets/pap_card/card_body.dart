part of 'pap_card.dart';

class _CardBody {
  static const _cardBodyPadding = EdgeInsets.only(
    top: 24,
    left: 24,
    bottom: 24,
    right: 16,
  );
  static const _imageCardBodyPadding = EdgeInsets.only(
    top: 24,
    left: 24,
    bottom: 20,
    right: 16,
  );
  static const _defaultMargin = 4.0;
  static const _subtitleBottomMargin = 16.0;
  static const _edgeIconDragRightPosition = -9.5;
  static const _edgeIconDragBottomPosition = -10.5;
  static const _hotZoneSize = 48.0;
  static const _iconCardHeight = 214.0;
  static const _edgeIconDefaultSize = 24.0;
  static const _iconCardTopPadding = 16.0;
  static const _iconCardBottomPadding = 14.0;
  static const _iconCardIconSize = 88.0;
  static const _titleMaxLine = 1;
  static const _emptyValue = '';
  static const _descriptionMaxLine = 3;
  static const _defaultBorderRadius = 4.0;
  static const _imageHeight = 179.0;
  static const _spaceBetweenIconAndTitleSmall = 5.0;
  static const _spaceBetweenIconAndTitleMedium = 15.0;
  static const _iconCardSmallFontSize = 12.0;
  static const _imagePlaceHolderMargin = EdgeInsets.fromLTRB(12, 12, 12, 0);
  static const _inlineCardItemImagePadding = EdgeInsets.zero;
  static const _inlineCardItemPadding = EdgeInsets.all(12);

  static Widget buildCardBody({
    required IAppThemeData appTheme,
    required bool isShimmerEnabled,
    required CardViewType viewType,
    required String title,
    required String? subtitle,
    required String? description,
    required int? descriptionMaxLines,
    required bool isIconHovered,
    required bool showActionsDivider,
    required List<PAPCardActionButton>? papActionButtons,
    required List<ContextMenuAction>? actions,
    required ValueChanged<bool>? onHover,
    required ValueChanged<bool> onIconHover,
  }) {
    return Padding(
      padding: viewType == CardViewType.card
          ? _imageCardBodyPadding
          : viewType == CardViewType.inlineCardItem
              ? _inlineCardItemPadding
              : _cardBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle(
                      appTheme: appTheme,
                      isShimmerEnabled: isShimmerEnabled,
                      viewType: viewType,
                      title: title,
                    ),
                    const SizedBox(
                      height: _defaultMargin,
                    ),
                    buildSubtitle(
                      appTheme: appTheme,
                      subtitle: subtitle,
                      isShimmerEnabled: isShimmerEnabled,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildActionButtons(
                  appTheme: appTheme,
                  papActionButtons: papActionButtons,
                  isIconHovered: isIconHovered,
                  actions: actions,
                  showActionsDivider: showActionsDivider,
                  onIconHover: onIconHover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: _subtitleBottomMargin,
          ),
          buildDescription(
            appTheme: appTheme,
            isShimmerEnabled: isShimmerEnabled,
            description: description,
            descriptionMaxLines: descriptionMaxLines,
          ),
        ],
      ),
    );
  }

  static List<Widget> buildActionButtons({
    required IAppThemeData appTheme,
    required List<PAPCardActionButton>? papActionButtons,
    required bool isIconHovered,
    required List<ContextMenuAction>? actions,
    required bool showActionsDivider,
    required ValueChanged<bool> onIconHover,
  }) {
    final actionButtonsList = <Widget>[];

    if (papActionButtons != null) {
      actionButtonsList.addAll(
        papActionButtons.map(
          (actionButton) {
            return PAPButton.icon(
              icon: actionButton.icon!,
              onTap: actionButton.onTap,
            );
          },
        ),
      );
    }
    if (actions != null) {
      actionButtonsList.add(
        PAPContextMenu(
          actions: actions,
          dividerType: showActionsDivider
              ? PAPContextMenuDividerType.line
              : PAPContextMenuDividerType.space,
        ),
      );
    }

    return actionButtonsList;
  }

  static Widget buildIconItemBody({
    required IAppThemeData appTheme,
    required bool isCardHovered,
    required bool isSelected,
    required bool isShimmerEnabled,
    required IconVerticalAlign iconVerticalAlign,
    required IconData? icon,
    required IconData? edgeIcon,
    required Function()? onEdgeIconTapped,
    required double? edgeIconSize,
    required double? width,
    required double? height,
    required CardViewType viewType,
    required String title,
    required double? iconSize,
    required IconCardType iconCardType,
    required double? titleMaxWidth,
    bool isFeedBack = false,
  }) {
    final iconColor = isSelected || isFeedBack
        ? appTheme.colors.iconCardContentSelected
        : appTheme.colors.iconCardContentDefault;

    return !isShimmerEnabled
        ? SizedBox(
            width: width,
            height: height,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: _iconCardTopPadding - (isSelected ? 1 : 0),
                  bottom: _iconCardBottomPadding - (isSelected ? 1 : 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment:
                            iconVerticalAlign == IconVerticalAlign.bottom
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.center,
                        children: [
                          buildIcon(
                            appTheme: appTheme,
                            iconCardColor: iconColor,
                            icon: icon,
                            iconSize: iconSize ?? _iconCardIconSize,
                          ),
                          PAPDivider.spacer(
                            height: iconCardType == IconCardType.small
                                ? _spaceBetweenIconAndTitleSmall
                                : _spaceBetweenIconAndTitleMedium,
                          ),
                          SizedBox(
                            width: titleMaxWidth,
                            child: Center(
                              child: buildTitle(
                                appTheme: appTheme,
                                isShimmerEnabled: isShimmerEnabled,
                                viewType: viewType,
                                title: title,
                                iconCardType: iconCardType,
                                iconCardColor: isSelected || isFeedBack
                                    ? appTheme.colors.iconCardContentSelected
                                    : appTheme.colors.iconCardContentDefault,
                                hasSoftWrap: titleMaxWidth == null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (edgeIcon != null && isFeedBack)
                  Positioned(
                    bottom: _edgeIconDragBottomPosition,
                    right: _edgeIconDragRightPosition,
                    child: GestureDetector(
                      onTap: onEdgeIconTapped,
                      child: SizedBox(
                        width: _hotZoneSize,
                        height: _hotZoneSize,
                        child: Center(
                          child: Icon(
                            edgeIcon,
                            size: edgeIconSize ?? _edgeIconDefaultSize,
                            color: appTheme.colors.iconCardContentSelected,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Container(
            height: height ?? _iconCardHeight,
            width: width ?? double.infinity,
            color: appTheme.colors.defaultBackground,
          );
  }

  static Widget buildIcon({
    required IAppThemeData appTheme,
    required Color iconCardColor,
    required IconData? icon,
    required double? iconSize,
  }) {
    final setIconSize = iconSize ?? _iconCardIconSize;

    return Icon(
      icon,
      size: setIconSize,
      color: iconCardColor,
    );
  }

  static Widget buildImage({
    required IAppThemeData appTheme,
    required bool isShimmerEnabled,
    required Image? image,
    required CardViewType viewType,
  }) {
    return Container(
      margin: viewType == CardViewType.inlineCardItem
          ? _inlineCardItemImagePadding
          : _imagePlaceHolderMargin,
      decoration: !isShimmerEnabled
          ? BoxDecoration(
              color: appTheme.colors.cardImagePlaceHolder,
              borderRadius: const BorderRadius.all(
                Radius.circular(_defaultBorderRadius),
              ),
            )
          : null,
      height: viewType == CardViewType.inlineCardItem ? null : _imageHeight,
      color: isShimmerEnabled ? appTheme.colors.defaultBackground : null,
      child: image,
    );
  }

  static Widget buildTitle({
    required IAppThemeData appTheme,
    required bool isShimmerEnabled,
    required CardViewType viewType,
    required String title,
    IconCardType? iconCardType,
    Color? iconCardColor,
    bool hasSoftWrap = false,
  }) {
    return !isShimmerEnabled
        ? viewType != CardViewType.iconCard &&
                viewType != CardViewType.draggableIconCard
            ? PAPText(
                text: title,
                style: appTheme.typographies.byFontFamily().headline7.copyWith(
                      color: appTheme.colors.cardTitleDefault,
                    ),
                maxLine: _titleMaxLine,
                textOverflow: TextOverflow.ellipsis,
                softWrap: hasSoftWrap,
              )
            : PAPText(
                text: title,
                softWrap: hasSoftWrap,
                textOverflow: TextOverflow.ellipsis,
                style: iconCardType == IconCardType.small
                    ? appTheme.typographies
                        .byFontFamily()
                        .iconCardTitle
                        .copyWith(
                          color: iconCardColor,
                          fontSize: _iconCardSmallFontSize,
                        )
                    : appTheme.typographies
                        .byFontFamily()
                        .iconCardTitle
                        .copyWith(
                          color: iconCardColor,
                        ),
              )
        : Container(
            color: appTheme.colors.defaultBackground,
            child: Text(
              title,
              style: appTheme.cardTitleTextStyle,
              maxLines: _titleMaxLine,
            ),
          );
  }

  static Widget buildSubtitle({
    required IAppThemeData appTheme,
    required String? subtitle,
    required bool isShimmerEnabled,
  }) {
    return !isShimmerEnabled
        ? PAPText(
            text: subtitle ?? _emptyValue,
            style: appTheme.typographies.byFontFamily().caption.copyWith(
                  color: appTheme.colors.cardSubTitleDefault,
                ),
          )
        : Container(
            color: appTheme.colors.defaultBackground,
            child: PAPText(
              text: subtitle ?? _emptyValue,
              style: appTheme.typographies.byFontFamily().caption.copyWith(
                    color: appTheme.colors.cardSubTitleDefault,
                  ),
            ),
          );
  }

  static Widget buildDescription({
    required IAppThemeData appTheme,
    required bool isShimmerEnabled,
    required String? description,
    required int? descriptionMaxLines,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: !isShimmerEnabled
          ? PAPText(
              text: description ?? _emptyValue,
              textOverflow: TextOverflow.ellipsis,
              style: appTheme.typographies.byFontFamily().body2.copyWith(
                    color: appTheme.colors.cardSubTitleDefault,
                  ),
              maxLine: descriptionMaxLines ?? _descriptionMaxLine,
            )
          : Container(
              color: appTheme.colors.defaultBackground,
              child: PAPText(
                text: description ?? _emptyValue,
                textOverflow: TextOverflow.ellipsis,
                style: appTheme.typographies.byFontFamily().body2.copyWith(
                      color: appTheme.colors.cardSubTitleDefault,
                    ),
                maxLine: descriptionMaxLines ?? _descriptionMaxLine,
              ),
            ),
    );
  }
}
