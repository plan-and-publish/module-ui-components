part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV1 implements ITheme {
  @override
  IAppThemeData getThemeData(Mode? mode) {
    return _ThemeV1Default();
  }
}
