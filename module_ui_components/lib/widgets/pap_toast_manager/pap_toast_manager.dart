import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'dart:async';

extension DefaultFlashControllerExtension on DefaultFlashController {
  bool get isDisposed {
    try {
      controller;
      return false;
    } catch (_) {
      return true;
    }
  }

  void safelyDismiss() {
    if (!isDisposed) {
      dismiss();
    }
  }
}

class ToastData {
  const ToastData({
    required this.icon,
    required this.backgroundColor,
    required this.captionColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.messages,
    this.actions,
    this.hasDismissOption = true,
    this.enableSwipeToDismiss = true,
    this.autoDismiss = true,
  });

  final Icon icon;
  final Color backgroundColor;
  final Color captionColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List<ToasterMessage> messages;
  final List<ToastAction>? actions;
  final bool hasDismissOption;
  final bool enableSwipeToDismiss;
  final bool autoDismiss;
}

class ToastManager extends ChangeNotifier {
  ToastManager._();
  static final ToastManager _instance = ToastManager._();
  static ToastManager get instance => _instance;

  final Duration animationDuration = Duration(
    milliseconds: 300,
  );
  static const int _maxToastsBeforeDismissAll = 3;
  static const Duration _baseDismissDuration = Duration(
    seconds: 8,
  );
  static const Duration _dismissInterval = Duration(
    milliseconds: 500,
  );
  static const Duration _dismissalOrchestratorInterval = Duration(
    milliseconds: 500,
  );

  Timer? _dismissalOrchestrator;
  final Map<FlashController, DateTime> _dismissalTimes = {};
  final List<FlashController> _activeToasts = [];
  final Map<FlashController, ToastData> _toastDataMap = {};
  final Map<FlashController, int> _toastIndices = {};
  final Set<FlashController> _dismissingToasts = {};
  final Set<FlashController> _permanentlyDismissed = {};
  bool _dismissingAllWithAnimation = false;
  bool _dismissAllTriggered = false;

  bool get isDismissingAllWithAnimation => _dismissingAllWithAnimation;
  FlashPosition get defaultPosition => FlashPosition.bottom;
  bool get shouldShowDismissAll =>
      _activeToasts.length >= _maxToastsBeforeDismissAll &&
      !_dismissAllTriggered;
  int get activeToastCount => _activeToasts.length - _dismissingToasts.length;
  List<FlashController> get activeToasts => List.unmodifiable(
        _activeToasts,
      );

  @override
  void dispose() {
    _stopDismissalOrchestrator();
    super.dispose();
  }

  void addToast(
    FlashController controller, [
    ToastData? toastData,
  ]) {
    if (_permanentlyDismissed.contains(
          controller,
        ) ||
        _activeToasts.contains(
          controller,
        )) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_permanentlyDismissed.contains(
            controller,
          ) ||
          _activeToasts.contains(
            controller,
          )) {
        return;
      }

      _activeToasts.add(
        controller,
      );
      if (toastData != null) {
        _toastDataMap[controller] = toastData;
      }
      _toastIndices[controller] = _activeToasts.length - 1;

      if (toastData?.autoDismiss == true) {
        _scheduleToastDismissal(
          controller,
        );
      }

      notifyListeners();
    });
  }

  void _ensureDismissalOrchestratorActive() {
    if (_dismissalTimes.isEmpty) {
      _stopDismissalOrchestrator();
      return;
    }

    if (_dismissalOrchestrator != null && _dismissalOrchestrator!.isActive) {
      return;
    }

    _dismissalOrchestrator =
        Timer.periodic(_dismissalOrchestratorInterval, (_) {
      _processDismissals();

      if (_dismissalTimes.isEmpty) {
        _stopDismissalOrchestrator();
      }
    });
  }

  void _stopDismissalOrchestrator() {
    _dismissalOrchestrator?.cancel();
    _dismissalOrchestrator = null;
  }

  void _processDismissals() {
    if (_dismissalTimes.isEmpty) return;

    final now = DateTime.now();
    final toastsToDismiss = <FlashController>[];

    _dismissalTimes.forEach((controller, dismissTime) {
      if (now.isAfter(dismissTime) &&
          _activeToasts.contains(controller) &&
          !_dismissingToasts.contains(
            controller,
          )) {
        toastsToDismiss.add(
          controller,
        );
      }
    });

    for (final controller in toastsToDismiss) {
      _executeActionAndDismiss(controller, () {});
      _dismissalTimes.remove(
        controller,
      );
    }

    if (_dismissalTimes.isEmpty) {
      _stopDismissalOrchestrator();
    }
  }

  void _scheduleToastDismissal(
    FlashController controller,
  ) {
    final position = _activeToasts.indexOf(
      controller,
    );
    final dismissDelay = _baseDismissDuration + (_dismissInterval * position);

    final dismissTime = DateTime.now().add(
      dismissDelay,
    );
    _dismissalTimes[controller] = dismissTime;

    _ensureDismissalOrchestratorActive();
  }

  void removeToast(
    FlashController controller,
  ) {
    if (!_activeToasts.contains(
      controller,
    )) {
      return;
    }

    _permanentlyDismissed.add(
      controller,
    );

    _dismissalTimes.remove(
      controller,
    );

    if (controller is DefaultFlashController && !controller.isDisposed) {
      controller.safelyDismiss();
    } else {
      try {
        controller.dismiss();
      } catch (_) {
        // Ignore if already dismissed
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_activeToasts.contains(
        controller,
      )) {
        _activeToasts.remove(
          controller,
        );
        _toastDataMap.remove(
          controller,
        );
        _toastIndices.remove(
          controller,
        );
        _updateRemainingToastIndices();
        notifyListeners();
      }
    });
  }

  void _updateRemainingToastIndices() {
    for (var i = 0; i < _activeToasts.length; i++) {
      _toastIndices[_activeToasts[i]] = i;
    }
  }

  void dismissAll() {
    if (_activeToasts.isEmpty) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dismissalTimes.clear();
      _stopDismissalOrchestrator();

      _dismissAllTriggered = true;
      _dismissingAllWithAnimation = true;
      final toastsToRemove = List<FlashController>.from(
        _activeToasts.where(
          (controller) => !_dismissingToasts.contains(
            controller,
          ),
        ),
      );

      for (var controller in toastsToRemove) {
        _markAsDismissing(
          controller,
        );
      }

      notifyListeners();

      Future.delayed(animationDuration, () {
        for (var controller in toastsToRemove) {
          if (_activeToasts.contains(controller)) {
            _tryDismissController(controller);
          }
        }

        Future.delayed(animationDuration, () {
          _clearAllToasts();
          _dismissingToasts.clear();
          _dismissingAllWithAnimation = false;
          _dismissAllTriggered = false;
          notifyListeners();
        });
      });
    });
  }

  void _tryDismissController(
    FlashController controller,
  ) {
    if (!_activeToasts.contains(controller)) {
      return;
    }

    if (controller is DefaultFlashController) {
      if (controller.isDisposed) {
        _activeToasts.remove(
          controller,
        );
        _toastDataMap.remove(
          controller,
        );
        _toastIndices.remove(
          controller,
        );
      } else {
        controller.safelyDismiss();
      }
      return;
    }

    try {
      controller.dismiss();
    } catch (_) {
      _activeToasts.remove(
        controller,
      );
      _toastDataMap.remove(
        controller,
      );
      _toastIndices.remove(
        controller,
      );
    }
  }

  void _clearAllToasts() {
    _dismissalTimes.clear();
    _stopDismissalOrchestrator();
    _permanentlyDismissed.addAll(
      _activeToasts,
    );
    _activeToasts.clear();
    _toastIndices.clear();
    _toastDataMap.clear();
  }

  void _runPostFrame(
    VoidCallback callback,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }

  void _notifyListenersPostFrame() {
    _runPostFrame(
      notifyListeners,
    );
  }

  ToastData? getToastData(
    int index,
  ) {
    if (index < 0 || index >= _activeToasts.length) {
      return null;
    }

    final controller = _activeToasts[index];
    return _toastDataMap[controller];
  }

  void updateToastData(
    FlashController controller,
    ToastData toastData,
  ) {
    if (_activeToasts.contains(
      controller,
    )) {
      _toastDataMap[controller] = toastData;
      _notifyListenersPostFrame();
    }
  }

  void _executeActionAndDismiss(
    FlashController controller,
    Function() action, {
    bool waitBeforeRemove = false,
  }) {
    final index = _activeToasts.indexOf(controller);
    if (index == -1) return;

    if (_dismissingToasts.contains(
      controller,
    )) {
      return;
    }

    _markAsDismissing(
      controller,
    );
    _tryExecuteAction(
      action,
    );
    _dismissalTimes.remove(
      controller,
    );

    if (waitBeforeRemove) {
      _removeAfterDelay(
        controller,
      );
    } else {
      _removeImmediately(
        controller,
      );
    }

    if (controller is DefaultFlashController && !controller.isDisposed) {
      controller.safelyDismiss();
    }

    if (_activeToasts.contains(
      controller,
    )) {
      _activeToasts.remove(
        controller,
      );
      _toastDataMap.remove(
        controller,
      );
      _toastIndices.remove(
        controller,
      );
      _updateRemainingToastIndices();
      notifyListeners();
    }
  }

  void _markAsDismissing(
    FlashController controller,
  ) {
    if (!_dismissingToasts.contains(
      controller,
    )) {
      _dismissingToasts.add(
        controller,
      );
    }
  }

  void _tryExecuteAction(
    Function() action,
  ) {
    action();
  }

  void _removeAfterDelay(
    FlashController controller,
  ) {
    Future.delayed(animationDuration, () {
      if (_activeToasts.contains(
        controller,
      )) {
        removeToast(
          controller,
        );
      }
      _dismissingToasts.remove(
        controller,
      );
    });
  }

  void _removeImmediately(
    FlashController controller,
  ) {
    if (_activeToasts.contains(
      controller,
    )) {
      removeToast(
        controller,
      );
    }
    _dismissingToasts.remove(
      controller,
    );
  }
}
