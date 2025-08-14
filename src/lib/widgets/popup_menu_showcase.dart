part of '../views/showcase.dart';

class _PopupMenuShowcase extends StatefulWidget {
  const _PopupMenuShowcase();

  @override
  State<_PopupMenuShowcase> createState() => _PopupMenuShowcaseState();
}

class _PopupMenuShowcaseState extends State<_PopupMenuShowcase> {
  final controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Frame(
      title: 'Popup Menu',
      widgets: _buildPopupMenu(appTheme),
    );
  }

  List<Widget> _buildPopupMenu(IAppThemeData appTheme) {
    const menuWidth = 214.0;
    return [
      PAPPopupButton(
        controller: controller,
        menuWidth: menuWidth,
        icon: appTheme.icons.menuDotsVertical,
        popupItems: [
          PopupButtonAction(
            title: 'Firebase',
          )
        ],
      ),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
