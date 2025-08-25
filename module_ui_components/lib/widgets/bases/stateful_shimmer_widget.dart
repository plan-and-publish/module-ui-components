import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:shimmer/shimmer.dart';

abstract class StatefulShimmerWidget extends StatefulWidget {
  const StatefulShimmerWidget({
    required bool isShimmerEnabled,
    super.key,
  }) : _isShimmerEnabled = isShimmerEnabled;

  final bool _isShimmerEnabled;
}

abstract class StatefulShimmerWidgetState<T extends StatefulShimmerWidget>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return !widget._isShimmerEnabled
        ? buildLoaded(context)
        : Shimmer.fromColors(
            baseColor: appTheme.colors.shimmerBase,
            highlightColor: appTheme.colors.shimmerHighlight,
            child: buildLoading(context),
          );
  }

  Widget buildLoaded(BuildContext context);
  Widget buildLoading(BuildContext context);
}
