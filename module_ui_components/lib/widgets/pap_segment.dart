import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/bases/stateless_shimmer_widget.dart';

enum PAPSegmentType {
  icon,
  text,
  textAndIcon,
}

enum PAPSegmentSize {
  normal,
  compact,
}

enum PAPSegmentWidthMode {
  fit,
  fill,
}

class PAPSegment extends StatelessShimmerWidget {
  const PAPSegment({
    required this.items,
    required this.segmentSize,
    this.widthMode = PAPSegmentWidthMode.fit,
    super.isShimmerEnabled = false,
    super.key,
  });

  factory PAPSegment.normal({
    required List<SegmentItemData> items,
    PAPSegmentWidthMode widthMode = PAPSegmentWidthMode.fit,
    Key? key,
  }) {
    return PAPSegment(
      items: items,
      widthMode: widthMode,
      segmentSize: PAPSegmentSize.normal,
      key: key,
    );
  }

  factory PAPSegment.compact({
    required List<SegmentItemData> items,
    PAPSegmentWidthMode widthMode = PAPSegmentWidthMode.fit,
    Key? key,
  }) {
    return PAPSegment(
      items: items,
      widthMode: widthMode,
      segmentSize: PAPSegmentSize.compact,
      key: key,
    );
  }

  factory PAPSegment.shimmer({
    required List<SegmentItemData> items,
    required PAPSegmentSize segmentSize,
  }) {
    return PAPSegment(
      items: items,
      segmentSize: segmentSize,
      isShimmerEnabled: true,
    );
  }

  final List<SegmentItemData> items;
  final PAPSegmentWidthMode widthMode;
  final PAPSegmentSize segmentSize;

  static const _normalHeight = 38.0;
  static const _compactHeight = 30.0;

  @override
  Widget buildLoaded(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final child = Container(
      height:
          segmentSize == PAPSegmentSize.normal ? _normalHeight : _compactHeight,
      clipBehavior: Clip.antiAlias,
      decoration: appTheme.segmentDecoration,
      child: IntrinsicWidth(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map(
                _mapSegmentDataToSegmentItem,
              )
              .toList(),
        ),
      ),
    );
    return widthMode == PAPSegmentWidthMode.fill
        ? Expanded(child: child)
        : child;
  }

  @override
  Widget buildLoading(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final child = Container(
      height:
          segmentSize == PAPSegmentSize.normal ? _normalHeight : _compactHeight,
      decoration: BoxDecoration(
        color: appTheme.colors.defaultBackground,
        borderRadius: BorderRadius.circular(appTheme.segmentBorderRadius),
      ),
      child: IntrinsicWidth(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map(
                _mapSegmentDataToSegmentItem,
              )
              .toList(),
        ),
      ),
    );
    return widthMode == PAPSegmentWidthMode.fill
        ? Expanded(child: child)
        : child;
  }

  Widget _mapSegmentDataToSegmentItem(SegmentItemData segmentItemData) {
    return widthMode == PAPSegmentWidthMode.fill
        ? Expanded(
            child: _PAPSegmentItem(
              type: segmentItemData.type!,
              title: segmentItemData.title,
              iconsData: segmentItemData.iconsData,
              segmentSize: segmentSize,
              isSelected: segmentItemData.isSelected,
              onTap: segmentItemData.onTap!,
              key: segmentItemData.key,
              isFirst: segmentItemData == items.first,
              isLast: segmentItemData == items.last,
            ),
          )
        : _PAPSegmentItem(
            type: segmentItemData.type!,
            title: segmentItemData.title,
            iconsData: segmentItemData.iconsData,
            segmentSize: segmentSize,
            isSelected: segmentItemData.isSelected,
            onTap: segmentItemData.onTap!,
            key: segmentItemData.key,
            isFirst: segmentItemData == items.first,
            isLast: segmentItemData == items.last,
          );
  }
}

class _PAPSegmentItem extends StatefulWidget {
  const _PAPSegmentItem({
    required this.type,
    required this.isSelected,
    required this.onTap,
    required this.segmentSize,
    this.title,
    this.iconsData,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  })  : assert(
          title != null || iconsData != null,
          'Either iconsData or title should be provided',
        ),
        assert(
          type != PAPSegmentType.icon ||
              iconsData != null && iconsData.length >= 1,
          'IconsData can not be empty when segment type is icon',
        ),
        assert(
          type != PAPSegmentType.icon || title == null,
          'Text can not be null when segment type is text',
        ),
        assert(
          type != PAPSegmentType.textAndIcon || title != null,
          'Text can not be null when segment type is textAndIcon',
        ),
        assert(
          type != PAPSegmentType.textAndIcon ||
              iconsData != null && iconsData.length >= 1,
          'IconsData can not be null when segment type is textAndIcon',
        );

  final String? title;
  final List<IconData>? iconsData;
  final PAPSegmentType type;
  final PAPSegmentSize segmentSize;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  @override
  State<_PAPSegmentItem> createState() => _PAPSegmentItemState();
}

class _PAPSegmentItemState extends State<_PAPSegmentItem> {
  static const _normalIconSize = 20.0;
  static const _compactIconSize = 16.0;
  static const _spaceBetweenTextAndIconNormal = 8.0;
  static const _spaceBetweenTextAndIconCompact = 4.0;
  static const _compactPadding = EdgeInsets.symmetric(
    horizontal: 7.0,
  );
  static const _normalPadding = EdgeInsets.symmetric(
    horizontal: 11.0,
  );
  static const _letterSpacing = 0.05;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contentWidget = _buildContentWidget();
    if (kIsWeb) {
      return MouseRegion(
        onHover: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: contentWidget,
      );
    } else {
      return contentWidget;
    }
  }

  Widget _buildContentWidget() {
    final appTheme = AppTheme.of(context).theme;
    final foregroundColor = appTheme.colors.segmentItemForeground;
    final backgroundColor = _isHovered && !widget.isSelected
        ? appTheme.colors.segmentItemHoveredBackground
        : widget.isSelected
            ? appTheme.colors.segmentItemSelectedBackground
            : appTheme.colors.segmentItemBackground;

    if (widget.type == PAPSegmentType.icon) {
      return _buildItem(
        child: _buildIconItem(iconColor: foregroundColor),
        backgroundColor: backgroundColor,
        appTheme: appTheme,
      );
    } else if (widget.type == PAPSegmentType.text) {
      return _buildItem(
        child: _buildTextItem(
          titleColor: foregroundColor,
          appTheme: appTheme,
        ),
        backgroundColor: backgroundColor,
        appTheme: appTheme,
      );
    } else {
      return _buildItem(
        child: Row(
          children: [
            _buildIconItem(iconColor: foregroundColor),
            SizedBox(
              width: widget.segmentSize == PAPSegmentSize.normal
                  ? _spaceBetweenTextAndIconNormal
                  : _spaceBetweenTextAndIconCompact,
            ),
            _buildTextItem(titleColor: foregroundColor, appTheme: appTheme),
          ],
        ),
        backgroundColor: backgroundColor,
        appTheme: appTheme,
      );
    }
  }

  Widget _buildItem({
    required Widget child,
    required Color backgroundColor,
    required IAppThemeData appTheme,
  }) {
    return GestureDetector(
      onTap: () => widget.onTap.call(),
      child: Container(
        padding: widget.segmentSize == PAPSegmentSize.normal
            ? _normalPadding
            : _compactPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            left: BorderSide(
              color: widget.isSelected && !widget.isFirst
                  ? appTheme.colors.segmentBorder
                  : backgroundColor,
            ),
            right: BorderSide(
              color: widget.isSelected && !widget.isLast
                  ? appTheme.colors.segmentBorder
                  : backgroundColor,
            ),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildIconItem({required Color iconColor}) {
    final content =
        widget.iconsData!.length == 1 ? _buildIcon : _buildComposedIcon;
    return content(iconColor: iconColor);
  }

  Widget _buildIcon({required Color iconColor}) {
    return Icon(
      widget.iconsData!.first,
      color: iconColor,
      size: widget.segmentSize == PAPSegmentSize.normal
          ? _normalIconSize
          : _compactIconSize,
    );
  }

  Widget _buildComposedIcon({required Color iconColor}) {
    return Row(
      children: widget.iconsData!
          .map(
            (iconData) => Icon(
              iconData,
              color: iconColor,
              size: widget.segmentSize == PAPSegmentSize.normal
                  ? _normalIconSize
                  : _compactIconSize,
            ),
          )
          .toList(),
    );
  }

  Widget _buildTextItem({
    required Color titleColor,
    required IAppThemeData appTheme,
  }) {
    return Text(
      widget.title!,
      style: appTheme.typographies.byFontFamily().caption.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w500,
            letterSpacing: _letterSpacing,
          ),
    );
  }
}

class SegmentItemData {
  SegmentItemData({
    this.title,
    this.iconsData,
    this.type,
    this.isSelected = false,
    this.onTap,
    this.key,
  })  : assert(
          title != null || iconsData != null,
          'Either iconsData or title should be provided',
        ),
        assert(
          type != PAPSegmentType.icon ||
              iconsData != null && iconsData.isNotEmpty,
          'IconsData can not be empty when segment type is icon',
        ),
        assert(
          type != PAPSegmentType.icon || title == null,
          'Text can not be null when segment type is text',
        ),
        assert(
          type != PAPSegmentType.textAndIcon || title != null,
          'Text can not be null when segment type is textAndIcon',
        ),
        assert(
          type != PAPSegmentType.textAndIcon ||
              iconsData != null && iconsData.isNotEmpty,
          'IconsData can not be null when segment type is textAndIcon',
        );

  final String? title;
  final List<IconData>? iconsData;
  final PAPSegmentType? type;
  final bool isSelected;
  final VoidCallback? onTap;
  final Key? key;
}
