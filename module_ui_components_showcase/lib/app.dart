import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components_showcase/views/homepage.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeProvider.getTheme(
      Version.themeV2,
      Mode.light,
    );

    return AppTheme(
      appThemeData: themeData,
      child: MaterialApp(
        title: 'Module UI Components Showcase',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: themeData.mainTheme,
        home: const HomePage(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
