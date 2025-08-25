import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components/widgets/pap_toast_manager/pap_toast_manager.dart';

enum ToastType {
  basic,
  success,
  error,
  info,
  warning,
}

enum ToastActionType {
  ok,
  cancel,
  submit,
  dismiss,
}

class Toaster {
  Toaster._();
  static final Toaster _instance = Toaster._();
  static Toaster get instance => _instance;
  static ToastManager get _toastManager => ToastManager.instance;
  static const _toastDuration = Duration(seconds: 3);
  static OverlayEntry? _overlayEntry;
  static bool disableAutoOverlay = false;
  static bool _isShowingToast = false;
  static const Duration _toastShowDelay = Duration(milliseconds: 50);
  static const Duration _toastAnimationDelay = Duration(milliseconds: 500);
  static const EdgeInsets containerPadding = EdgeInsets.only(
    right: 12.0,
    bottom: 12.0,
  );
  static const double containerMarginFromTop = 140.0;

  static void _ensureOverlayEntryExists(BuildContext context) {
    if (disableAutoOverlay || _overlayEntry != null) return;

    final overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => const ToastOverlay(
        containerPadding: containerPadding,
        containerMarginFromTop: containerMarginFromTop,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_overlayEntry != null) {
        overlayState.insert(_overlayEntry!);
      }
    });
  }

  static void disposeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static void showToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    required ToastType toastType,
    String? caption,
    bool hasDismissOption = true,
    bool dismissByHorizontalDrag = false,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
    FlashPosition? position,
    double? width,
    List<ToastAction>? actions,
  }) {
    if (_isShowingToast) {
      _scheduleDelayedToast(
        context: context,
        message: message,
        toastType: toastType,
        caption: caption,
        hasDismissOption: hasDismissOption,
        dismissByHorizontalDrag: dismissByHorizontalDrag,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
        position: position,
        width: width,
        actions: actions,
      );
      return;
    }

    _isShowingToast = true;

    final appTheme = AppTheme.of(context).theme;
    final decorationData = _getDecorationData(
      appTheme: appTheme,
      toastType: toastType,
    );

    _ensureOverlayEntryExists(
      context,
    );

    void showFlashCallback(_) {
      try {
        if (!context.mounted) {
          _isShowingToast = false;
          return;
        }

        showFlash(
          context: context,
          duration: _toastDuration,
          builder: (
            context,
            controller,
          ) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                _toastManager.addToast(
                  controller,
                  ToastData(
                    icon: decorationData.icon,
                    backgroundColor: decorationData.backgroundColor,
                    captionColor: decorationData.captionColor,
                    primaryColor: decorationData.primaryColor,
                    secondaryColor: decorationData.secondaryColor,
                    messages: message,
                    actions: actions,
                    hasDismissOption: hasDismissOption,
                    enableSwipeToDismiss: enableSwipeToDismiss,
                    autoDismiss: autoDismiss,
                  ),
                );

                if (autoDismiss) {
                  Future.delayed(_toastDuration + _toastAnimationDelay, () {
                    if (context.mounted &&
                        _toastManager.activeToasts.contains(
                          controller,
                        )) {
                      _toastManager.removeToast(controller);
                    }
                  });
                }
              }
            });

            return const SizedBox.shrink();
          },
        );
      } finally {
        _isShowingToast = false;
      }
    }

    WidgetsBinding.instance.addPostFrameCallback(showFlashCallback);
  }

  static void _scheduleDelayedToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    required ToastType toastType,
    String? caption,
    bool hasDismissOption = true,
    bool dismissByHorizontalDrag = false,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
    FlashPosition? position,
    double? width,
    List<ToastAction>? actions,
  }) {
    final messagesCopy = List<ToasterMessage>.from(
      message,
    );
    final typeCopy = toastType;
    final captionCopy = caption;

    void showToastCallback() {
      if (context.mounted) {
        showToast(
          context: context,
          message: messagesCopy,
          toastType: typeCopy,
          caption: captionCopy,
          hasDismissOption: hasDismissOption,
          dismissByHorizontalDrag: dismissByHorizontalDrag,
          enableSwipeToDismiss: enableSwipeToDismiss,
          autoDismiss: autoDismiss,
          position: position,
          width: width,
          actions: actions,
        );
      }
    }

    Future.delayed(
      _toastShowDelay,
      showToastCallback,
    );
  }

  static _ToastDecorationData _getDecorationData({
    required IAppThemeData appTheme,
    required ToastType toastType,
  }) {
    switch (toastType) {
      case ToastType.success:
        return _ToastDecorationData.success(
          appTheme.colors,
          appTheme.icons,
        );
      case ToastType.error:
        return _ToastDecorationData.error(
          appTheme.colors,
          appTheme.icons,
        );
      case ToastType.info:
        return _ToastDecorationData.info(
          appTheme.colors,
          appTheme.icons,
        );
      case ToastType.warning:
        return _ToastDecorationData.warning(
          appTheme.colors,
          appTheme.icons,
        );
      case ToastType.basic:
        return _ToastDecorationData.basic(
          appTheme.colors,
          appTheme.icons,
        );
    }
  }

  static void defaultToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) =>
      _showToast(
        context: context,
        message: message,
        caption: caption,
        toastType: ToastType.basic,
        actions: actions,
        position: position,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
      );

  static void successToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) =>
      _showToast(
        context: context,
        message: message,
        caption: caption,
        toastType: ToastType.success,
        actions: actions,
        position: position,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
      );

  static void errorToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) =>
      _showToast(
        context: context,
        message: message,
        caption: caption,
        toastType: ToastType.error,
        actions: actions,
        position: position,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
      );

  static void infoToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) =>
      _showToast(
        context: context,
        message: message,
        caption: caption,
        toastType: ToastType.info,
        actions: actions,
        position: position,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
      );

  static void warningToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) =>
      _showToast(
        context: context,
        message: message,
        caption: caption,
        toastType: ToastType.warning,
        actions: actions,
        position: position,
        enableSwipeToDismiss: enableSwipeToDismiss,
        autoDismiss: autoDismiss,
      );

  static void _showToast({
    required BuildContext context,
    required List<ToasterMessage> message,
    required ToastType toastType,
    String? caption,
    List<ToastAction>? actions,
    FlashPosition? position,
    bool enableSwipeToDismiss = true,
    bool autoDismiss = true,
  }) {
    showToast(
      context: context,
      message: message,
      caption: caption,
      toastType: toastType,
      actions: actions,
      position: position,
      enableSwipeToDismiss: enableSwipeToDismiss,
      autoDismiss: autoDismiss,
    );
  }
}

class _ToastDecorationData {
  const _ToastDecorationData({
    required this.icon,
    required this.backgroundColor,
    required this.captionColor,
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory _ToastDecorationData.success(
    IColors colors,
    IIcons icons,
  ) {
    return _ToastDecorationData(
      icon: Icon(
        icons.checkCircle,
        color: colors.successCaption,
      ),
      backgroundColor: colors.successBackground,
      captionColor: colors.successCaption,
      primaryColor: colors.successDark,
      secondaryColor: colors.successLight,
    );
  }

  factory _ToastDecorationData.error(
    IColors colors,
    IIcons icons,
  ) {
    return _ToastDecorationData(
      icon: Icon(
        icons.clearCircle,
        color: colors.errorCaption,
      ),
      backgroundColor: colors.errorBackground,
      captionColor: colors.errorCaption,
      primaryColor: colors.errorDark,
      secondaryColor: colors.errorLight,
    );
  }

  factory _ToastDecorationData.info(
    IColors colors,
    IIcons icons,
  ) {
    return _ToastDecorationData(
      icon: Icon(
        icons.info,
        color: colors.primaryDarkBackground,
      ),
      backgroundColor: colors.primaryBackground,
      captionColor: colors.primaryCaption,
      primaryColor: colors.primaryDark,
      secondaryColor: colors.primaryLight,
    );
  }

  factory _ToastDecorationData.warning(
    IColors colors,
    IIcons icons,
  ) {
    return _ToastDecorationData(
      icon: Icon(
        icons.alertDangerTriangle,
        color: colors.warningCaption,
      ),
      backgroundColor: colors.warningBackground,
      captionColor: colors.warningCaption,
      primaryColor: colors.warningDark,
      secondaryColor: colors.warningLight,
    );
  }

  factory _ToastDecorationData.basic(
    IColors colors,
    IIcons icons,
  ) {
    return _ToastDecorationData(
      icon: Icon(
        icons.arrowSync,
        color: colors.secondaryCaption,
      ),
      backgroundColor: colors.secondaryBackground,
      captionColor: colors.secondaryCaption,
      primaryColor: colors.secondaryDark,
      secondaryColor: colors.secondaryLight,
    );
  }

  final Icon icon;
  final Color backgroundColor;
  final Color captionColor;
  final Color primaryColor;
  final Color secondaryColor;
}

class ToastAction {
  const ToastAction({
    required this.title,
    required this.actionType,
    required this.onTap,
    required this.buttonType,
  });

  factory ToastAction.ok({
    Function()? onTap,
    PapComponentStyle buttonType = PapComponentStyle.primary,
  }) =>
      ToastAction(
        title: EnumHelpers.humanize(
          ToastActionType.ok,
        ),
        actionType: ToastActionType.ok,
        onTap: onTap ?? () {},
        buttonType: buttonType,
      );

  factory ToastAction.cancel({
    Function()? onTap,
    PapComponentStyle buttonType = PapComponentStyle.secondary,
  }) =>
      ToastAction(
        title: EnumHelpers.humanize(
          ToastActionType.cancel,
        ),
        actionType: ToastActionType.cancel,
        onTap: onTap ?? () {},
        buttonType: buttonType,
      );

  factory ToastAction.submit({
    Function()? onTap,
    PapComponentStyle buttonType = PapComponentStyle.primary,
  }) =>
      ToastAction(
        title: EnumHelpers.humanize(
          ToastActionType.submit,
        ),
        actionType: ToastActionType.submit,
        onTap: onTap ?? () {},
        buttonType: buttonType,
      );

  factory ToastAction.dismiss({
    Function()? onTap,
    PapComponentStyle buttonType = PapComponentStyle.secondary,
  }) =>
      ToastAction(
        title: EnumHelpers.humanize(
          ToastActionType.dismiss,
        ),
        actionType: ToastActionType.dismiss,
        onTap: onTap ?? () {},
        buttonType: buttonType,
      );

  final String title;
  final ToastActionType actionType;
  final Function() onTap;
  final PapComponentStyle buttonType;
}

class ToasterMessage {
  const ToasterMessage({
    required this.message,
    this.messageStyle,
  });

  final String message;
  final TextStyle? messageStyle;

  static ToasterMessage combine(List<ToasterMessage> messages) {
    if (messages.isEmpty) return const ToasterMessage(message: '');
    if (messages.length == 1) return messages.first;
    return ToasterMessage(
        message: messages
            .map(
              (m) => m.message,
            )
            .join(' '));
  }

  ToasterMessage append(
    ToasterMessage other,
  ) =>
      ToasterMessage(
        message: '$message ${other.message}',
        messageStyle: messageStyle,
      );

  ToasterMessage appendText(String text) => ToasterMessage(
        message: '$message $text',
        messageStyle: messageStyle,
      );
}

mixin ToasterMixin {
  void toast({
    required BuildContext context,
    required List<ToasterMessage> message,
    required ToastType type,
    String? caption,
    bool autoDismiss = true,
  }) {
    switch (type) {
      case ToastType.success:
        Toaster.successToast(
          context: context,
          caption: caption,
          message: message,
          autoDismiss: autoDismiss,
        );
      case ToastType.error:
        Toaster.errorToast(
          context: context,
          caption: caption,
          message: message,
          autoDismiss: autoDismiss,
        );
      case ToastType.info:
        Toaster.infoToast(
          context: context,
          caption: caption,
          message: message,
          autoDismiss: autoDismiss,
        );
      case ToastType.warning:
        Toaster.warningToast(
          context: context,
          caption: caption,
          message: message,
          autoDismiss: autoDismiss,
        );
      case ToastType.basic:
        Toaster.defaultToast(
          context: context,
          caption: caption,
          message: message,
          autoDismiss: autoDismiss,
        );
    }
  }

  List<ToasterMessage> createMessages(
    List<String> messages,
  ) =>
      messages
          .map(
            (
              msg,
            ) =>
                ToasterMessage(
              message: msg,
            ),
          )
          .toList();
  void toastMultiple({
    required BuildContext context,
    required List<String> messages,
    required ToastType type,
    String? caption,
  }) =>
      toast(
        context: context,
        message: createMessages(messages),
        type: type,
        caption: caption,
      );
}
