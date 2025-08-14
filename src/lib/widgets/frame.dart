part of '../views/showcase.dart';

class Frame extends StatelessWidget {
  const Frame({
    required this.title,
    required this.widgets,
    super.key,
  });

  final String title;
  final List<Widget> widgets;

  static const _padding = 4.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final decoration = BoxDecoration(
      border: Border.all(),
      color: appTheme.colors.defaultBackground,
    );
    const spacer = SizedBox(height: 10);
    final titleWidget = PAPText(
      text: title,
      typography: TypographyFamily.headline6,
    );

    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(_padding),
                decoration: decoration,
                child: titleWidget,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(_padding),
                      decoration: decoration,
                      child: Column(
                        children: [
                          spacer,
                          ...widgets,
                        ],
                      ),
                    ),
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
