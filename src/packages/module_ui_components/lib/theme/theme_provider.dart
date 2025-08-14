import 'package:module_ui_components/module_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/theme/app_theme/theme.dart';

part 'package:module_ui_components/src/themes/helpers/theme_helper.dart';
part 'package:module_ui_components/src/themes/shared/shared_pallet.dart';

part 'package:module_ui_components/src/themes/theme_v1/theme_v1.dart';
part 'package:module_ui_components/src/themes/theme_v1/icons.dart';
part 'package:module_ui_components/src/themes/theme_v1/typographies.dart';
part 'package:module_ui_components/src/themes/theme_v1/bases/colors.dart';
part 'package:module_ui_components/src/themes/theme_v1/default/theme_v1_default.dart';
part 'package:module_ui_components/src/themes/theme_v1/default/default_colors.dart';

part 'package:module_ui_components/src/themes/theme_v2/theme_v2.dart';
part 'package:module_ui_components/src/themes/theme_v2/bases/color_pallet.dart';
part 'package:module_ui_components/src/themes/theme_v2/bases/colors.dart';
part 'package:module_ui_components/src/themes/theme_v2/light/light_tokens.dart';
part 'package:module_ui_components/src/themes/theme_v2/dark/dark_tokens.dart';
part 'package:module_ui_components/src/themes/theme_v2/typographies.dart';
part 'package:module_ui_components/src/themes/theme_v2/icons.dart';
part 'package:module_ui_components/src/themes/theme_v2/theme_v2_data.dart';
part 'package:module_ui_components/src/themes/theme_v2/bases/tokens_base.dart';

enum Version {
  themeV1,
  themeV2,
}

enum Mode {
  light,
  dark,
}

class ThemeProvider {
  factory ThemeProvider() {
    return _instance;
  }
  ThemeProvider._internal();

  static final ThemeProvider _instance = ThemeProvider._internal();

  static IAppThemeData getTheme(Version version, Mode mode) {
    switch (version) {
      case Version.themeV1:
        return _ThemeV1().getThemeData(mode);
      case Version.themeV2:
        return _ThemeV2().getThemeData(mode);
    }
  }
}
