part of '../views/showcase.dart';

class _ContextMenuShowcase extends StatelessWidget {
  const _ContextMenuShowcase();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Frame(
      title: 'Context Menu',
      widgets: [
        _buildContextMenu(appTheme),
      ],
    );
  }

  Widget _buildContextMenu(IAppThemeData appTheme) {
    const menuShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    );
    const menuWidth = 214.0;
    const menuOffset = Offset(-8, 5);
    final menuChild = Icon(
      appTheme.icons.menuDotsVertical,
      size: 16.0,
      color: appTheme.colors.badgeDemotedIcon,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PAPText(text: 'Context menu'),
              PAPContextMenu(
                actions: [
                  ContextMenuAction(
                    icon: appTheme.icons.trash,
                    title: 'Delete project',
                    subtitle: 'Delete the project',
                    itemStyle: ContextMenuItemStyle.error,
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.pen,
                    title: 'Edit Project',
                    subtitle: 'Edit the project',
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.alertDanger,
                    title: 'Open',
                    subtitle: 'Open this project',
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PAPText(text: 'Icon context menu'),
              PAPContextMenu(
                actions: [
                  ContextMenuAction(
                    icon: appTheme.icons.trash,
                    onTap: () {},
                    itemStyle: ContextMenuItemStyle.error,
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.pen,
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.alertDanger,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PAPText(
                  text: 'Context menu single line with space divider'),
              PAPContextMenu(
                dividerType: PAPContextMenuDividerType.space,
                menuItemType: ContextMenuItemType.singleLineContext,
                menuOffset: menuOffset,
                menuWidth: menuWidth,
                widget: menuChild,
                menuShapeBorder: menuShape,
                actions: [
                  ContextMenuAction(
                    icon: appTheme.icons.trash,
                    title: 'Delete project',
                    itemStyle: ContextMenuItemStyle.error,
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.pen,
                    title: 'Edit Project',
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.alertDanger,
                    title: 'Open',
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PAPText(
                  text: 'Context menu single line with space divider'),
              PAPContextMenu(
                dividerType: PAPContextMenuDividerType.space,
                menuItemType: ContextMenuItemType.singleLineContext,
                menuOffset: menuOffset,
                menuWidth: menuWidth,
                widget: menuChild,
                menuShapeBorder: menuShape,
                actions: [
                  ContextMenuAction(
                    itemStyle: ContextMenuItemStyle.error,
                    title: 'Delete project',
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    title: 'Edit Project',
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    title: 'Open',
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PAPText(text: 'Context menu with custom overlay'),
              PAPContextMenu(
                useCustomOverlay: true,
                actions: [
                  ContextMenuAction(
                    icon: appTheme.icons.trash,
                    title: 'Delete project',
                    subtitle: 'Delete the project',
                    itemStyle: ContextMenuItemStyle.error,
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.pen,
                    title: 'Edit Project',
                    subtitle: 'Edit the project',
                    onTap: () {},
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.alertDanger,
                    title: 'Open',
                    subtitle: 'Disabled',
                  ),
                  ContextMenuAction(
                    icon: appTheme.icons.pen,
                    title: 'Open Project',
                    subtitle: 'Open the project',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
