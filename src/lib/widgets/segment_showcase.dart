part of '../views/showcase.dart';

class _SegmentShowcase extends StatelessWidget {
  const _SegmentShowcase();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Frame(
      title: 'Segment',
      widgets: _buildPAPSegment(appTheme),
    );
  }

    List<Widget> _buildPAPSegment(IAppThemeData appTheme) {
    return [
      PAPSegment.compact(
        items: [
          SegmentItemData(
            type: PAPSegmentType.text,
            title: 'NONE',
            isSelected: true,
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [appTheme.icons.hCenter],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceBetweenLeft,
              appTheme.icons.spaceBetweenRight
            ],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceAroundLeft,
              appTheme.icons.spaceAroundRight
            ],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceEvenlyLeft,
              appTheme.icons.spaceEvenlyRight
            ],
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      PAPSegment.compact(
        items: [
          SegmentItemData(
            type: PAPSegmentType.text,
            title: 'NONE',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [appTheme.icons.hCenter],
            title: 'Center',
            isSelected: true,
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceBetweenLeft,
              appTheme.icons.spaceBetweenRight
            ],
            title: 'Space Between',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceAroundLeft,
              appTheme.icons.spaceAroundRight
            ],
            title: 'Space Around',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceEvenlyLeft,
              appTheme.icons.spaceEvenlyRight
            ],
            title: 'Space Evenly',
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      PAPSegment.normal(
        items: [
          SegmentItemData(
            type: PAPSegmentType.text,
            title: 'NONE',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [appTheme.icons.hCenter],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceBetweenLeft,
              appTheme.icons.spaceBetweenRight
            ],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceAroundLeft,
              appTheme.icons.spaceAroundRight
            ],
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.icon,
            iconsData: [
              appTheme.icons.spaceEvenlyLeft,
              appTheme.icons.spaceEvenlyRight
            ],
            isSelected: true,
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      PAPSegment.normal(
        items: [
          SegmentItemData(
            type: PAPSegmentType.text,
            title: 'NONE',
            isSelected: true,
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [appTheme.icons.hCenter],
            title: 'Center',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceBetweenLeft,
              appTheme.icons.spaceBetweenRight
            ],
            title: 'Space Between',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceAroundLeft,
              appTheme.icons.spaceAroundRight
            ],
            title: 'Space Around',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceEvenlyLeft,
              appTheme.icons.spaceEvenlyRight
            ],
            title: 'Space Evenly',
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      PAPSegment.shimmer(
        segmentSize: PAPSegmentSize.normal,
        items: [
          SegmentItemData(
            type: PAPSegmentType.text,
            title: 'NONE',
            isSelected: true,
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [appTheme.icons.hCenter],
            title: 'Center',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceBetweenLeft,
              appTheme.icons.spaceBetweenRight
            ],
            title: 'Space Between',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceAroundLeft,
              appTheme.icons.spaceAroundRight
            ],
            title: 'Space Around',
            onTap: () {},
          ),
          SegmentItemData(
            type: PAPSegmentType.textAndIcon,
            iconsData: [
              appTheme.icons.spaceEvenlyLeft,
              appTheme.icons.spaceEvenlyRight
            ],
            title: 'Space Evenly',
            onTap: () {},
          ),
        ],
      ),
    ];
  }
}
