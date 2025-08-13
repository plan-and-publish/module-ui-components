part of '../views/showcase.dart';

class _CardShowcase extends StatelessWidget {
  const _CardShowcase();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Frame(
      title: 'ListItems [Card , List, ListWithHandler]',
      widgets: _buildCards(appTheme),
    );
  }

  List<Widget> _buildCards(IAppThemeData appTheme) {
    const cardMargin = EdgeInsets.all(
      12.0,
    );
    final cardActions = [
      ContextMenuAction(
        icon: appTheme.icons.trash,
        title: 'delete',
        itemStyle: ContextMenuItemStyle.error,
        onTap: () {},
        subtitle: 'delete the item',
      ),
      ContextMenuAction(
        icon: appTheme.icons.save,
        title: 'edit',
        onTap: () {},
        subtitle: 'edit the item',
      ),
    ];
    final imageBannerCardActions = [
      ContextMenuAction(
        title: 'disconnect',
        onTap: () {},
        itemType: ContextMenuItemType.singleLineContext,
        itemStyle: ContextMenuItemStyle.error,
      ),
    ];
    var widgets = <Widget>[];
    widgets.addAll(
      [
        _buildDivider(),
        PAPCard.cardItem(
          title: 'Project name',
          subtitle: 'Created: 21/05/06',
          description:
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate',
          actions: cardActions,
          margin: cardMargin,
          isSelected: true,
        ),
        PAPCard.cardItem(
          title: 'Project card with settings ',
          subtitle: 'Created: 16/06/23',
          description:
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate',
          actions: cardActions,
          margin: cardMargin,
          actionButtons: [
            PAPCardActionButton(
              icon: appTheme.icons.setting,
              onTap: () => debugPrint('on settings icon tapped'),
            ),
          ],
        ),
        _spacer,
        PAPCard.inlineCardItem(
          title: 'Inline Project card',
          subtitle: 'Created: 04/11/24',
          description:
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate',
          actions: cardActions,
          margin: cardMargin,
          actionButtonLabel: 'Edit app',
          onActionButtonTap: () => debugPrint('Inline card tapped'),
        ),
        _spacer,
        PAPCard.shimmerCardItem(
          margin: cardMargin,
        ),
        _spacer,
        PAPCard.listItem(
          title: 'Project name',
          subtitle: 'Created: 21/05/06',
          description:
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate',
          margin: cardMargin,
        ),
        PAPCard.listItem(
          title: 'Project card with settings ',
          subtitle: 'Created: 16/06/23',
          description:
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate',
          actions: cardActions,
          margin: cardMargin,
          actionButtons: [
            PAPCardActionButton(
              icon: appTheme.icons.setting,
              onTap: () => debugPrint('on settings icon tapped'),
            ),
          ],
        ),
        _spacer,
        PAPCard.shimmerListItem(
          margin: cardMargin,
        ),
      ],
    );
    widgets.add(
      Wrap(
        children: [
          PAPCard.iconCard(
            title: 'Content page',
            icon: appTheme.icons.mobileContent,
            onTap: () {},
            width: 160,
            height: 133,
            iconSize: 64,
            margin: cardMargin,
            isSelected: true,
          ),
          PAPCard.iconCard(
            title: 'Blank page',
            icon: appTheme.icons.mobileBlank,
            onTap: () {},
            width: 160,
            height: 133,
            iconSize: 64,
            margin: cardMargin,
          ),
          PAPCard.iconCard(
            title: 'Draggable Icon Card',
            icon: appTheme.icons.mobileBlank,
            onTap: () {},
            width: 160,
            height: 133,
            iconSize: 64,
            draggableData: 'Draggable Icon Card',
          ),
          PAPCard.iconCard(
            title: 'edge icon',
            edgeIconSize: 24,
            iconSize: 24,
            edgeIcon: appTheme.icons.expand,
            onEdgeIconTapped: () {
              debugPrint('Icon tapped');
            },
            icon: appTheme.icons.modules,
            onTap: () {},
            width: 96,
            height: 82,
            draggableData: 'Draggable Icon Card',
          ),
          PAPCard.iconCard(
            title: 'compound card',
            edgeIconSize: 16,
            iconSize: 24,
            edgeIconHasBorder: true,
            edgeIcon: appTheme.icons.trash,
            onEdgeIconTapped: () {
              debugPrint('Icon tapped');
            },
            icon: appTheme.icons.modules,
            onTap: () {},
            width: 96,
            height: 82,
            draggableData: 'Draggable Icon Card',
            titleMaxWidth: 32.0,
          ),
          SizedBox(
            width: 160,
            height: 133,
            child: PAPCard.shimmerIconCard(
              margin: cardMargin,
            ),
          ),
        ],
      ),
    );
    widgets.add(
      PAPCard.imageCard(
        width: 248.0,
        title: 'Firebase',
        subtitle: 'Lorem ipsum lorem ipsum lorem ipsum',
        imagePath: 'assets/images/sample_avatar.png',
        menuActions: imageBannerCardActions,
      ),
    );
    widgets.addAll(
      [
        PAPCard.actionCard(
          title: 'ActionCard Default',
          description: 'Lorem ipsum lorem ipsum lorem ipsum',
          icon: appTheme.icons.send,
          onTap: () {},
        ),
        PAPCard.actionCard(
          title: 'ActionCard Disabled',
          description: 'Lorem ipsum lorem ipsum lorem ipsum',
          icon: appTheme.icons.send,
          onTap: () {},
          isEnabled: false,
        ),
      ],
    );
    widgets.addAll(
      [
        PAPCard.listItemWithHandler(
          title: 'Project name',
          menuActions: cardActions,
          isSelected: false,
        ),
        PAPCard.listItemWithHandler(
          title: 'Project name',
          menuActions: cardActions,
          isSelected: true,
        ),
        PAPCard.listItemWithHandler(
          title: 'Project name',
          menuActions: cardActions,
          isSelected: false,
        ),
        PAPCard.shimmerListItemWithHandler(),
      ],
    );

    return widgets;
  }
}
