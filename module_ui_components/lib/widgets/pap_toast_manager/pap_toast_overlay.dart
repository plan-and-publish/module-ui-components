import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/pap_toast_manager/pap_toast_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class _ToastConstants {
  static const EdgeInsets toastSpacing = EdgeInsets.only(
    bottom: 8.0,
  );
  static const EdgeInsets actionContainerLeftMargin = EdgeInsets.only(
    left: 10.0,
  );
  static const EdgeInsets dismissButtonPadding = EdgeInsets.all(
    16.0,
  );
  static const double actionDividerHeight = 20.0;
  static const double actionDividerWidth = 20.0;
  static const double scrollThresholdBuffer = 5.0;
  static const int maxToastsWithoutScroll = 3;
  static const EdgeInsets dismissAllButtonPadding = EdgeInsets.only(
    top: 9.5,
    bottom: 9.5,
    left: 20.0,
    right: 8.0,
  );
  static const double messageVerticalPadding = 12.0;
  static const double fadeAnimationBegin = 0.0;
  static const double fadeAnimationEnd = 1.0;
  static const double closeIconSize = 20.0;
  static const String dismissAllText = 'Dismiss all';
  static const double dismissAllFontSize = 14.0;
  static const double toastWidth = 388.0;
  static const Curve animationCurve = Curves.easeInOut;
  static const FontWeight defaultFontWeight = FontWeight.w500;
  static const double defaultFontSize = 16.0;
  static const double dismissThresholdMultiplier = 0.3;
  static const double dismissVelocityThreshold = 1000.0;
  static const double defaultDragOffset = 0.0;
  static const double transformYOffset = 0.0;
  static const double transformZOffset = 0.0;
  static const EdgeInsets iconPadding = EdgeInsets.only(
    left: 16.0,
    right: 12.0,
  );
  static const String toastListKeyPrefix = 'toast-list-';
  static const String toastItemKeyPrefix = 'toast-';
  static const String widgetKeyPrefix = 'widget-';
  static const Duration dragTransitionDuration = Duration(
    milliseconds: 50,
  );
}

class ToastOverlay extends StatefulWidget {
  const ToastOverlay({
    required this.containerPadding,
    required this.containerMarginFromTop,
    super.key,
  });

  final EdgeInsets containerPadding;
  final double containerMarginFromTop;

  @override
  State<ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<ToastOverlay> {
  final ToastManager _toastManager = ToastManager.instance;
  final ScrollController _scrollController = ScrollController();
  final Map<String, Key> _toastKeys = {};
  bool _isUpdating = false;
  late final EdgeInsets _containerPadding;
  late final double _containerMarginFromTop;
  late final Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _toastManager.addListener(
      _onToastsChanged,
    );
    _containerPadding = widget.containerPadding;
    _containerMarginFromTop = widget.containerMarginFromTop;
    _alignment = kIsWeb ? Alignment.bottomRight : Alignment.bottomCenter;
  }

  @override
  void dispose() {
    _toastManager.removeListener(
      _onToastsChanged,
    );
    _scrollController.dispose();
    _toastKeys.clear();
    super.dispose();
  }

  void _onToastsChanged() {
    if (_isUpdating || !mounted) return;

    setState(() {
      _isUpdating = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        setState(() {
          _isUpdating = false;
        });
        return;
      }

      if (_toastManager.isDismissingAllWithAnimation) {
        _animateAllToastsOut();
        setState(() {
          _isUpdating = false;
        });
        return;
      }

      setState(() {
        _isUpdating = false;
      });

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: _toastManager.animationDuration,
          curve: _ToastConstants.animationCurve,
        );
      }
    });
  }

  void _animateAllToastsOut() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final toasts = _toastManager.activeToasts;
      for (final controller in toasts) {
        if (mounted &&
            _toastManager.activeToasts.contains(
              controller,
            )) {
          ToastManager.instance.removeToast(
            controller,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final toasts = _toastManager.activeToasts;
    final shouldShowDismissAll = _toastManager.shouldShowDismissAll;

    if (toasts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: Container(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            child: Align(
              alignment: _alignment,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildToastContainerWithDismissButton(
                    toasts,
                    context,
                    shouldShowDismissAll,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToastContainerWithDismissButton(
    List<FlashController> toasts,
    BuildContext context,
    bool shouldShowDismissAll,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = screenHeight - _containerMarginFromTop;

    return Padding(
      padding: _containerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (shouldShowDismissAll)
            Padding(
              padding: _ToastConstants.dismissAllButtonPadding,
              child: _buildDismissAllButton(
                context,
              ),
            ),
          LimitedBox(
            maxHeight: maxHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final toastList = _buildToastList(toasts);
                final shouldScroll =
                    toasts.length > _ToastConstants.maxToastsWithoutScroll ||
                        constraints.maxHeight <
                            _ToastConstants.scrollThresholdBuffer;

                return shouldScroll
                    ? SingleChildScrollView(
                        controller: _scrollController,
                        child: toastList,
                      )
                    : toastList;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToastList(
    List<FlashController> toasts,
  ) {
    return Column(
      key: ValueKey<String>(
          '${_ToastConstants.toastListKeyPrefix}${toasts.length}'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: toasts
          .asMap()
          .entries
          .map((entry) {
            final index = entry.key;
            final controller = entry.value;
            final uniqueKeyString =
                '${_ToastConstants.toastItemKeyPrefix}${controller.hashCode}';

            return _buildToastItem(
              index,
              controller,
              uniqueKeyString,
            );
          })
          .toList()
          .reversed
          .toList(),
    );
  }

  Widget _buildToastItem(
    int index,
    FlashController controller,
    String keyString,
  ) {
    final widgetKey =
        ValueKey<String>('${_ToastConstants.widgetKeyPrefix}$keyString');

    return Container(
      margin: _ToastConstants.toastSpacing,
      child: _ToastWidget(
        index: index,
        controller: controller,
        key: widgetKey,
      ),
    );
  }

  Widget _buildDismissAllButton(BuildContext context) {
    final appTheme = AppTheme.of(
      context,
    ).theme;
    return Padding(
      padding: _ToastConstants.dismissAllButtonPadding,
      child: TextButton(
        onPressed: () => _toastManager.dismissAll(),
        child: PAPText(
          text: _ToastConstants.dismissAllText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _ToastConstants.dismissAllFontSize,
            color: appTheme.colors.toasterDismissAllButton,
          ),
        ),
      ),
    );
  }
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({
    required this.index,
    required this.controller,
    super.key,
  });

  final int index;
  final FlashController controller;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  bool _isDismissing = false;
  double _dragOffset = 0.0;

  @override
  void initState() {
    super.initState();
    final toastManager = ToastManager.instance;

    _animationController = AnimationController(
      vsync: this,
      duration: toastManager.animationDuration,
    );

    _fadeAnimation = Tween<double>(
      begin: _ToastConstants.fadeAnimationBegin,
      end: _ToastConstants.fadeAnimationEnd,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _ToastConstants.animationCurve,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final toastManager = ToastManager.instance;
    final toastData = toastManager.getToastData(
      widget.index,
    );
    final appTheme = AppTheme.of(
      context,
    ).theme;

    if (toastData == null) {
      return const SizedBox.shrink();
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedContainer(
        duration: _ToastConstants.dragTransitionDuration,
        curve: _ToastConstants.animationCurve,
        transform: Matrix4.translationValues(
          _dragOffset,
          _ToastConstants.transformYOffset,
          _ToastConstants.transformZOffset,
        ),
        child: GestureDetector(
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: _buildToastContent(
            toastData,
            appTheme,
            toastManager,
          ),
        ),
      ),
    );
  }

  bool _isAnimationControllerActive() {
    try {
      return _animationController.isAnimating ||
          _animationController.isDismissed ||
          _animationController.isCompleted;
    } catch (_) {
      return false;
    }
  }

  void _onHorizontalDragUpdate(
    DragUpdateDetails details,
  ) {
    if (_isDismissing) return;

    final toastManager = ToastManager.instance;
    final toastData = toastManager.getToastData(
      widget.index,
    );
    if (toastData?.enableSwipeToDismiss != true) return;

    setState(() {
      _dragOffset += details.delta.dx;
    });
  }

  void _onHorizontalDragEnd(
    DragEndDetails details,
  ) {
    if (_isDismissing) return;

    final toastManager = ToastManager.instance;
    final toastData = toastManager.getToastData(
      widget.index,
    );
    if (toastData?.enableSwipeToDismiss != true) return;

    final velocity = details.velocity.pixelsPerSecond.dx;
    final width = context.size?.width ?? _ToastConstants.toastWidth;
    final dismissThreshold = width * _ToastConstants.dismissThresholdMultiplier;

    if (velocity.abs() > _ToastConstants.dismissVelocityThreshold ||
        _dragOffset.abs() > dismissThreshold) {
      _dismissToast();
    } else {
      setState(() {
        _dragOffset = _ToastConstants.defaultDragOffset;
      });
    }
  }

  List<Widget> _buildActionButtons({
    required List<ToastAction> actions,
    required ToastData toastData,
  }) {
    final actionList = <Widget>[];

    for (var i = 0; i < actions.length; i++) {
      final action = actions[i];

      actionList.add(
        GestureDetector(
          onTap: () => _dismissToast(
            action.onTap,
          ),
          child: PAPText(
            text: action.title,
            color: action.buttonType == PapComponentStyle.primary
                ? toastData.primaryColor
                : toastData.secondaryColor,
          ),
        ),
      );
      if (i < actions.length - 1) {
        actionList.add(
          SizedBox(
            height: _ToastConstants.actionDividerHeight,
            child: VerticalDivider(
              width: _ToastConstants.actionDividerWidth,
            ),
          ),
        );
      }
    }

    return actionList;
  }

  Widget _buildToastContent(
    ToastData toastData,
    IAppThemeData appTheme,
    ToastManager toastManager,
  ) {
    return Material(
      borderRadius: appTheme.toastBorderRadius,
      child: Container(
        width: _ToastConstants.toastWidth,
        decoration: BoxDecoration(
          color: toastData.backgroundColor,
          borderRadius: appTheme.toastBorderRadius,
        ),
        child: Row(
          children: [
            Padding(
              padding: _ToastConstants.iconPadding,
              child: toastData.icon,
            ),
            Expanded(
              child: _buildMessageColumn(
                toastData,
                appTheme,
              ),
            ),
            if (toastData.actions != null && toastData.actions!.isNotEmpty)
              _buildActionsContainer(
                toastData,
              ),
            if (toastData.hasDismissOption)
              _buildDismissButton(
                toastData,
                appTheme,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageColumn(
    ToastData toastData,
    IAppThemeData appTheme,
  ) {
    if (toastData.messages.isEmpty) return const SizedBox.shrink();

    var defaultStyle = appTheme.typographies.byFontFamily().body1.copyWith(
          color: toastData.captionColor,
          fontWeight: _ToastConstants.defaultFontWeight,
          fontSize: _ToastConstants.defaultFontSize,
        );

    if (toastData.messages.length == 1) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: _ToastConstants.messageVerticalPadding,
        ),
        child: PAPText(
          text: toastData.messages.first.message,
          style: toastData.messages.first.messageStyle ?? defaultStyle,
          softWrap: true,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _ToastConstants.messageVerticalPadding,
      ),
      child: RichText(
        text: TextSpan(
          style: defaultStyle,
          children: [
            for (int i = 0; i < toastData.messages.length; i++) ...[
              if (i > 0) const TextSpan(text: ' '),
              TextSpan(
                text: toastData.messages[i].message,
                style: toastData.messages[i].messageStyle ?? defaultStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionsContainer(
    ToastData toastData,
  ) {
    return Container(
      margin: _ToastConstants.actionContainerLeftMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildActionButtons(
          actions: toastData.actions!,
          toastData: toastData,
        ),
      ),
    );
  }

  Widget _buildDismissButton(
    ToastData toastData,
    IAppThemeData appTheme,
  ) {
    return GestureDetector(
      onTap: _dismissToast,
      child: Padding(
        padding: _ToastConstants.dismissButtonPadding,
        child: Icon(
          appTheme.icons.close,
          color: toastData.captionColor,
          size: _ToastConstants.closeIconSize,
        ),
      ),
    );
  }

  void _dismissToast([Function()? onTap]) {
    if (_isDismissing) return;

    _isDismissing = true;
    try {
      if (_isAnimationControllerActive()) {
        _animationController.reverse().then((_) {
          final action = onTap ?? () {};
          action();
          if (mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ToastManager.instance.removeToast(
                widget.controller,
              );
            });
          }
        });
      } else {
        if (onTap != null) {
          onTap();
        }

        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ToastManager.instance.removeToast(
              widget.controller,
            );
          });
        }
      }
    } catch (_) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ToastManager.instance.removeToast(
            widget.controller,
          );
        });
      }
    }
  }
}
