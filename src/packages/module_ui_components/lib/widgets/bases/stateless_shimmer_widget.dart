import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:shimmer/shimmer.dart';

abstract class StatelessShimmerWidget extends StatelessWidget {
  const StatelessShimmerWidget({
    required bool isShimmerEnabled,
    super.key,
  }) : _isShimmerEnabled = isShimmerEnabled;

  final bool _isShimmerEnabled;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return !_isShimmerEnabled
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
