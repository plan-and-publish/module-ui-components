import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';
import 'package:module_ui_components_showcase/views/showcase.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Module UI Components Showcase'),
      ),
      drawer: SafeArea(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: appTheme.drawerDecoration,
          child: const Drawer(),
        ),
      ),
      body: Center(
        child: Showcase(),
      ),
    );
  }
}
