part of 'package:module_ui_components/theme/theme_provider.dart';

class _ThemeV2 implements ITheme {
  @override
  IAppThemeData getThemeData(Mode? mode) {
    switch (mode) {
      case Mode.light:
        return _ThemeV2Data(_LightTokens());
      case Mode.dark:
        return _ThemeV2Data(_DarkTokens());
      default:
        return _ThemeV2Data(_LightTokens());
    }
  }
}
