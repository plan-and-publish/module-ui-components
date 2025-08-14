import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

@immutable
class AppTheme extends InheritedWidget {
  const AppTheme({
    required IAppThemeData appThemeData,
    required super.child,
    super.key,
  }) : _theme = appThemeData;

  final IAppThemeData _theme;

  IAppThemeData get theme => _theme;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as AppTheme).theme != theme;
  }

  static AppTheme of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(theme != null, 'AppTheme should be provided');
    return theme!;
  }
}
