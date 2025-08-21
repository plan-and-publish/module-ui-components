import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/bases/bases.dart';

part 'draggable_card.dart';
part 'list_item_with_handler_body.dart';
part 'image_card.dart';
part 'inline_card_item.dart';
part 'card_body.dart';
part 'action_card.dart';

enum CardViewType {
  card,
  list,
  listWithHandler,
  iconCard,
  draggableIconCard,
  imageCard,
  inlineCardItem,
  actionCard,
}

enum IconVerticalAlign {
  center,
  bottom,
}

enum IconCardType {
  small,
  medium,
}

class PAPCard<T> extends StatefulShimmerWidget {
  const PAPCard({
    required String title,
    required CardViewType viewType,
    required bool isSelected,
    Image? image,
    String? subtitle,
    String? description,
    int? descriptionMaxLines,
    String? imagePath,
    Function()? onTap,
    List<ContextMenuAction>? actions,
    bool showActionsDivider = false,
    T? draggableData,
    Function()? onDragStarted,
    Function()? onDragEnd,
    Function()? onEdgeIconTapped,
    List<PAPCardActionButton>? papActionButtons,
    IconData? icon,
    IconData? edgeIcon,
    double? width,
    double? height,
    double? iconSize,
    double? edgeIconSize,
    EdgeInsets? margin,
    IconVerticalAlign iconVerticalAlign = IconVerticalAlign.bottom,
    IconCardType iconCardType = IconCardType.small,
    bool isEnabled = true,
    String? actionButtonLabel,
    Function()? onActionButtonTap,
    double? titleMaxWidth,
    bool edgeIconHasBorder = false,
    super.isShimmerEnabled = false,
    super.key,
  })  : _image = image,
        _title = title,
        _subtitle = subtitle,
        _descriptionMaxLines = descriptionMaxLines,
        _description = description,
        _imagePath = imagePath,
        _onTap = onTap,
        _actions = actions,
        _showActionsDivider = showActionsDivider,
        _viewType = viewType,
        _isShimmerEnabled = isShimmerEnabled,
        _icon = icon,
        _edgeIcon = edgeIcon,
        _isSelected = isSelected,
        _draggableData = draggableData,
        _onDragStarted = onDragStarted,
        _onDragEnd = onDragEnd,
        _onEdgeIconTapped = onEdgeIconTapped,
        _papActionButtons = papActionButtons,
        _width = width,
        _height = height,
        _iconSize = iconSize,
        _edgeIconSize = edgeIconSize,
        _margin = margin,
        _iconVerticalAlign = iconVerticalAlign,
        _iconCardType = iconCardType,
        _isEnabled = isEnabled,
        _actionButtonLabel = actionButtonLabel,
        _onActionButtonTap = onActionButtonTap,
        _titleMaxWidth = titleMaxWidth,
        _edgeIconHasBorder = edgeIconHasBorder;

  factory PAPCard.cardItem({
    required String title,
    Image? image,
    String? subtitle,
    int? descriptionMaxLines,
    String? description,
    Function()? onTap,
    List<ContextMenuAction>? actions,
    List<PAPCardActionButton>? actionButtons,
    bool isShimmerEnabled = false,
    EdgeInsets? margin,
    bool isSelected = false,
    Key? key,
  }) {
    return PAPCard(
      title: title,
      actions: actions,
      papActionButtons: actionButtons,
      viewType: CardViewType.card,
      image: image,
      description: description,
      subtitle: subtitle,
      descriptionMaxLines: descriptionMaxLines,
      onTap: onTap,
      isShimmerEnabled: isShimmerEnabled,
      isSelected: isSelected,
      margin: margin,
      key: key,
    );
  }

  factory PAPCard.inlineCardItem({
    required String title,
    required String actionButtonLabel,
    Image? image,
    String? subtitle,
    int? descriptionMaxLines,
    String? description,
    Function()? onActionButtonTap,
    List<ContextMenuAction>? actions,
    bool isShimmerEnabled = false,
    EdgeInsets? margin,
    bool isSelected = false,
    Key? key,
  }) {
    return PAPCard(
      title: title,
      actions: actions,
      viewType: CardViewType.inlineCardItem,
      image: image,
      description: description,
      subtitle: subtitle,
      descriptionMaxLines: descriptionMaxLines,
      onActionButtonTap: onActionButtonTap,
      isShimmerEnabled: isShimmerEnabled,
      isSelected: isSelected,
      margin: margin,
      actionButtonLabel: actionButtonLabel,
      key: key,
    );
  }

  factory PAPCard.shimmerCardItem({
    EdgeInsets? margin,
  }) {
    return PAPCard(
      title: _shimmerTitle,
      viewType: CardViewType.card,
      description: _shimmerDescription,
      subtitle: _shimmerSubtitle,
      isShimmerEnabled: true,
      isSelected: false,
      margin: margin,
    );
  }

  factory PAPCard.listItem({
    required String title,
    String? subtitle,
    String? description,
    int? descriptionMaxLines,
    Function()? onTap,
    List<ContextMenuAction>? actions,
    List<PAPCardActionButton>? actionButtons,
    bool isShimmerEnabled = false,
    EdgeInsets? margin,
    Key? key,
  }) {
    return PAPCard(
      title: title,
      actions: actions,
      papActionButtons: actionButtons,
      viewType: CardViewType.list,
      description: description,
      descriptionMaxLines: descriptionMaxLines,
      subtitle: subtitle,
      onTap: onTap,
      isShimmerEnabled: isShimmerEnabled,
      isSelected: false,
      margin: margin,
      key: key,
    );
  }

  factory PAPCard.shimmerListItem({
    EdgeInsets? margin,
  }) {
    return PAPCard(
      title: _shimmerTitle,
      viewType: CardViewType.list,
      description: _shimmerDescription,
      subtitle: _shimmerSubtitle,
      isShimmerEnabled: true,
      isSelected: false,
      margin: margin,
    );
  }

  factory PAPCard.listItemWithHandler({
    required String title,
    required bool isSelected,
    bool isShimmerEnabled = false,
    T? draggableData,
    Function()? onTap,
    EdgeInsets? margin,
    List<ContextMenuAction>? menuActions,
    Key? key,
  }) {
    return PAPCard(
      title: title,
      actions: menuActions,
      viewType: CardViewType.listWithHandler,
      onTap: onTap,
      isSelected: isSelected,
      draggableData: draggableData,
      isShimmerEnabled: isShimmerEnabled,
      margin: margin,
      key: key,
    );
  }

  factory PAPCard.shimmerListItemWithHandler() {
    return const PAPCard(
      title: _shimmerTitle,
      viewType: CardViewType.listWithHandler,
      isShimmerEnabled: true,
      isSelected: false,
    );
  }

  factory PAPCard.iconCard({
    required String title,
    required IconData icon,
    IconData? edgeIcon,
    Function()? onTap,
    bool isShimmerEnabled = false,
    bool isSelected = false,
    T? draggableData,
    Function()? onDragStarted,
    Function()? onDragEnd,
    Function()? onEdgeIconTapped,
    double? width,
    double? height,
    double? iconSize,
    double? edgeIconSize,
    EdgeInsets? margin,
    IconVerticalAlign iconVerticalAlign = IconVerticalAlign.bottom,
    IconCardType iconCardType = IconCardType.small,
    double? titleMaxWidth,
    bool edgeIconHasBorder = false,
    Key? key,
  }) {
    return PAPCard(
      viewType: draggableData != null
          ? CardViewType.draggableIconCard
          : CardViewType.iconCard,
      title: title,
      icon: icon,
      edgeIcon: edgeIcon,
      onTap: onTap,
      isShimmerEnabled: isShimmerEnabled,
      isSelected: isSelected,
      draggableData: draggableData,
      onDragStarted: onDragStarted,
      onDragEnd: onDragEnd,
      onEdgeIconTapped: onEdgeIconTapped,
      width: width,
      height: height,
      iconSize: iconSize,
      edgeIconSize: edgeIconSize,
      margin: margin,
      iconVerticalAlign: iconVerticalAlign,
      iconCardType: iconCardType,
      edgeIconHasBorder: edgeIconHasBorder,
      key: key,
      titleMaxWidth: titleMaxWidth,
    );
  }

  factory PAPCard.shimmerIconCard({
    EdgeInsets? margin,
  }) {
    return PAPCard(
      viewType: CardViewType.iconCard,
      title: _shimmerTitle,
      isShimmerEnabled: true,
      isSelected: false,
      margin: margin,
    );
  }

  factory PAPCard.imageCard({
    required String title,
    required String subtitle,
    required String imagePath,
    bool isSelected = false,
    double? width,
    double height = 198.0,
    bool isShimmerEnabled = false,
    List<ContextMenuAction>? menuActions,
    Key? key,
  }) {
    return PAPCard(
      title: title,
      subtitle: subtitle,
      imagePath: imagePath,
      actions: menuActions,
      viewType: CardViewType.imageCard,
      isSelected: isSelected,
      isShimmerEnabled: isShimmerEnabled,
      width: width,
      height: height,
      key: key,
    );
  }

  factory PAPCard.actionCard({
    required String title,
    required String description,
    required Function()? onTap,
    int? descriptionMaxLines = 3,
    IconData? icon,
    bool isSelected = false,
    bool isEnabled = true,
    EdgeInsets? margin,
    Key? key,
  }) {
    return PAPCard(
      viewType: CardViewType.actionCard,
      title: title,
      description: description,
      descriptionMaxLines: descriptionMaxLines,
      icon: icon,
      onTap: onTap,
      key: key,
      isEnabled: isEnabled,
      isSelected: isSelected,
      margin: margin,
    );
  }

  final Image? _image;
  final String _title;
  final String? _subtitle;
  final String? _description;
  final int? _descriptionMaxLines;
  final String? _imagePath;
  final List<ContextMenuAction>? _actions;
  final bool _showActionsDivider;
  final Function()? _onTap;
  final CardViewType _viewType;
  final bool _isShimmerEnabled;
  final IconData? _icon;
  final IconData? _edgeIcon;
  final bool _isSelected;
  final double? _width;
  final double? _height;
  final double? _iconSize;
  final double? _edgeIconSize;
  final T? _draggableData;
  final Function()? _onDragStarted;
  final Function()? _onDragEnd;
  final Function()? _onEdgeIconTapped;
  final List<PAPCardActionButton>? _papActionButtons;
  final EdgeInsets? _margin;
  final IconVerticalAlign _iconVerticalAlign;
  final IconCardType _iconCardType;
  final bool _isEnabled;
  final String? _actionButtonLabel;
  final Function()? _onActionButtonTap;
  final double? _titleMaxWidth;
  final bool _edgeIconHasBorder;

  static const _shimmerTitle = 'Item Title';
  static const _shimmerSubtitle = 'Created: XX/XX/XX';
  static const _shimmerDescription =
      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate';

  @override
  State<PAPCard> createState() => _PAPCardState();
}

class _PAPCardState extends StatefulShimmerWidgetState<PAPCard> {
  late bool _isCardHovered;
  late bool _isIconHovered;
  late bool _isCardPressed;
  late bool _isDragging;

  static const _defaultMargin = 12.0;
  static const _cardsWithEdgeIconMargin = 6.0;

  static const _draggingIconCardMargin = EdgeInsets.all(1.0);

  @override
  void initState() {
    _isCardHovered = false;
    _isIconHovered = false;
    _isCardPressed = false;
    _isDragging = false;
    super.initState();
  }

  @override
  Widget buildLoaded(BuildContext context) {
    return Padding(
      padding: widget._viewType == CardViewType.listWithHandler
          ? widget._margin ??
              const EdgeInsets.symmetric(horizontal: _defaultMargin)
          : widget._margin ??
              EdgeInsets.all(
                widget._edgeIcon != null
                    ? _cardsWithEdgeIconMargin
                    : _defaultMargin,
              ),
      child: kIsWeb
          ? MouseRegion(
              onHover: (_) => _setCardHover(true),
              onEnter: (_) => _setCardHover(true),
              onExit: (_) {
                _setCardHover(false);
                _setCardPressed(false);
              },
              child: GestureDetector(
                onTap: () {
                  if (widget._onTap != null) {
                    _setCardHover(false);
                    _setCardPressed(true);
                    widget._onTap!();
                  }
                },
                child: _buildCardContent(),
              ),
            )
          : GestureDetector(
              onTap: widget._onTap,
              child: _buildCardContent(),
            ),
    );
  }

  void _setCardHover(isHover) {
    setState(() {
      _isCardHovered = isHover;
    });
  }

  void _setIconHover(isIconHover) {
    setState(() {
      _isIconHovered = isIconHover;
    });
  }

  void _setCardPressed(isCardPressed) {
    setState(() {
      _isCardPressed = isCardPressed;
    });
  }

  Widget _buildCardContent() {
    final appTheme = AppTheme.of(context).theme;
    final cardStyle = _getCardStyle(appTheme: appTheme);

    return widget._viewType == CardViewType.listWithHandler
        ? Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: widget._width ?? double.infinity,
                  height: widget._height,
                  child: _getContent(appTheme: appTheme, cardStyle: cardStyle),
                ),
              ),
            ],
          )
        : widget._viewType == CardViewType.draggableIconCard
            ? Draggable(
                data: widget._draggableData,
                childWhenDragging: widget._edgeIcon != null
                    ? _DraggableCard(
                        appTheme: appTheme,
                        isSelected: widget._isSelected,
                        width: widget._width,
                        height: widget._height,
                        edgeIcon: widget._edgeIcon,
                        edgeIconHasBorder: widget._edgeIconHasBorder,
                        onEdgeIconTapped: widget._onEdgeIconTapped,
                        edgeIconSize: widget._edgeIconSize,
                        draggableChild: _draggableChild(
                          appTheme: appTheme,
                          cardStyle: cardStyle,
                        ),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.grabbing,
                        child: _draggableChild(
                          appTheme: appTheme,
                          cardStyle: cardStyle,
                        ),
                      ),
                feedback: MouseRegion(
                  cursor: SystemMouseCursors.grabbing,
                  child: Material(
                    color: appTheme.colors.transparent,
                    child: Container(
                      margin: _draggingIconCardMargin,
                      decoration: !widget._isShimmerEnabled
                          ? appTheme.iconCardDraggingDecoration
                          : null,
                      child: SizedBox(
                        width: widget._width ?? double.infinity,
                        height: widget._height,
                        child: _getContent(
                          appTheme: appTheme,
                          cardStyle: cardStyle,
                          isFeedBack: true,
                        ),
                      ),
                    ),
                  ),
                ),
                onDragStarted: () {
                  widget._onDragStarted?.call();
                  setState(() {
                    _isDragging = true;
                  });
                },
                onDragEnd: (details) {
                  widget._onDragEnd?.call();
                  setState(() {
                    _isDragging = false;
                  });
                },
                onDragCompleted: () => widget._onDragEnd?.call(),
                onDraggableCanceled: (velocity, offset) {
                  widget._onDragEnd?.call();
                },
                child: widget._edgeIcon != null
                    ? _DraggableCard(
                        appTheme: appTheme,
                        isSelected: widget._isSelected,
                        width: widget._width,
                        height: widget._height,
                        edgeIcon: widget._edgeIcon,
                        onEdgeIconTapped: widget._onEdgeIconTapped,
                        edgeIconSize: widget._edgeIconSize,
                        edgeIconHasBorder: widget._edgeIconHasBorder,
                        draggableChild: _draggableChild(
                          appTheme: appTheme,
                          cardStyle: cardStyle,
                        ),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.grab,
                        child: _draggableChild(
                          appTheme: appTheme,
                          cardStyle: cardStyle,
                        ),
                      ),
              )
            : Container(
                decoration: !widget._isShimmerEnabled ? cardStyle : null,
                width: widget._width ??
                    (widget._viewType == CardViewType.inlineCardItem
                        ? null
                        : double.infinity),
                height: widget._height,
                child: _getContent(appTheme: appTheme, cardStyle: cardStyle),
              );
  }

  Widget _draggableChild({
    required IAppThemeData appTheme,
    required BoxDecoration cardStyle,
  }) {
    return Container(
      decoration: !widget._isShimmerEnabled ? cardStyle : null,
      width: widget._width ?? double.infinity,
      height: widget._height,
      child: _getContent(appTheme: appTheme, cardStyle: cardStyle),
    );
  }

  Widget _getContent({
    required IAppThemeData appTheme,
    required BoxDecoration cardStyle,
    bool isFeedBack = false,
  }) {
    final borderWidth = (cardStyle.border as Border?)?.right.width;

    switch (widget._viewType) {
      case CardViewType.listWithHandler:
        {
          return _ListItemWithHandlerBody(
            appTheme: appTheme,
            isSelected: widget._isSelected,
            isCardHovered: _isCardHovered,
            isDragging: _isDragging,
            isShimmerEnabled: widget._isShimmerEnabled,
            showActionsDivider: widget._showActionsDivider,
            title: widget._title,
            actions: widget._actions,
            draggableData: widget._draggableData,
            onDragStarted: () => setState(() {
              _isDragging = true;
            }),
            onDragEnd: (details) => setState(() {
              _isDragging = false;
            }),
          );
        }
      case CardViewType.iconCard:
      case CardViewType.draggableIconCard:
        {
          return _CardBody.buildIconItemBody(
            appTheme: appTheme,
            isCardHovered: _isCardHovered,
            isSelected: widget._isSelected,
            isShimmerEnabled: widget._isShimmerEnabled,
            isFeedBack: isFeedBack,
            iconVerticalAlign: widget._iconVerticalAlign,
            edgeIcon: widget._edgeIconHasBorder ? null : widget._edgeIcon,
            onEdgeIconTapped: widget._onEdgeIconTapped,
            edgeIconSize: widget._edgeIconSize,
            width: widget._width,
            height: widget._height,
            icon: widget._icon,
            title: widget._title,
            viewType: widget._viewType,
            iconSize: widget._iconSize,
            iconCardType: widget._iconCardType,
            titleMaxWidth: widget._titleMaxWidth,
          );
        }
      case CardViewType.imageCard:
        {
          return _ImageCard(
            appTheme: appTheme,
            title: widget._title,
            subtitle: widget._subtitle!,
            imagePath: widget._imagePath!,
            menuActions: widget._actions,
          );
        }
      case CardViewType.inlineCardItem:
        {
          return _InlineCardItem(
            appTheme: appTheme,
            title: widget._title,
            subtitle: widget._subtitle!,
            viewType: widget._viewType,
            actionButtonLabel: widget._actionButtonLabel!,
            image: widget._image,
            isIconHovered: _isIconHovered,
            showActionsDivider: widget._showActionsDivider,
            actions: widget._actions,
            onHover: (value) => _setCardHover(value),
            onIconHover: (value) => _setIconHover(value),
            description: widget._description!,
            onActionButtonTapped: widget._onActionButtonTap,
            borderWidth: borderWidth,
          );
        }
      case CardViewType.actionCard:
        {
          return _ActionCard(
            appTheme: appTheme,
            title: widget._title,
            description: widget._description!,
            onTap: widget._onTap!,
            icon: widget._icon,
            width: widget._width,
            height: widget._height,
            isEnabled: widget._isEnabled,
            descriptionMaxLines: widget._descriptionMaxLines,
          );
        }
      default:
        {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget._viewType == CardViewType.card)
                _CardBody.buildImage(
                  appTheme: appTheme,
                  isShimmerEnabled: widget._isShimmerEnabled,
                  image: widget._image,
                  viewType: widget._viewType,
                ),
              _CardBody.buildCardBody(
                appTheme: appTheme,
                isShimmerEnabled: widget._isShimmerEnabled,
                viewType: widget._viewType,
                title: widget._title,
                subtitle: widget._subtitle,
                descriptionMaxLines: widget._descriptionMaxLines,
                description: widget._description,
                isIconHovered: _isIconHovered,
                papActionButtons: widget._papActionButtons,
                actions: widget._actions,
                showActionsDivider: widget._showActionsDivider,
                onHover: (value) => _setCardHover(value),
                onIconHover: (value) => _setIconHover(value),
              )
            ],
          );
        }
    }
  }

  BoxDecoration _getCardStyle({
    required IAppThemeData appTheme,
  }) {
    switch (widget._viewType) {
      case CardViewType.iconCard:
        {
          return widget._isSelected
              ? appTheme.iconCardSelectedDecoration
              : _isCardHovered
                  ? appTheme.iconCardHoverDecoration
                  : appTheme.iconCardDecoration;
        }
      case CardViewType.draggableIconCard:
        {
          return widget._isSelected
              ? appTheme.iconCardDraggableSelectedDecoration
              : _isCardHovered
                  ? appTheme.iconCardDraggableHoverDecoration
                  : appTheme.iconCardDraggableDecoration;
        }
      case CardViewType.listWithHandler:
        {
          return widget._isSelected
              ? appTheme.listWithHandlerSelectedDecoration
              : _isCardHovered
                  ? appTheme.listWithHandlerHoverDecoration
                  : appTheme.listWithHandlerDecoration;
        }
      case CardViewType.actionCard:
        {
          return widget._isEnabled
              ? _isCardPressed
                  ? appTheme.actionCardPressedDecoration
                  : _isCardHovered
                      ? appTheme.actionCardHoverDecoration
                      : appTheme.actionCardDecoration
              : appTheme.actionCardDisabledDecoration;
        }
      default:
        {
          return widget._isSelected
              ? appTheme.cardSelectedDecoration
              : _isCardHovered
                  ? appTheme.cardHoverDecoration
                  : appTheme.baseCardDecoration;
        }
    }
  }

  @override
  Widget buildLoading(BuildContext context) {
    return Padding(
      padding: widget._margin ?? const EdgeInsets.all(_defaultMargin),
      child: _buildCardContent(),
    );
  }
}

class PAPCardActionButton {
  PAPCardActionButton({
    this.icon,
    this.onTap,
    this.iconSize,
  }) : assert(icon != null, 'Icon should be provided');

  final IconData? icon;
  final Function()? onTap;
  final double? iconSize;
}
