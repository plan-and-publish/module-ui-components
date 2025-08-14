import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

part '../widgets/button_showcase.dart';
part '../widgets/card_showcase.dart';
part '../widgets/dropdown_showcase.dart';
part '../widgets/numeric_showcase.dart';
part '../widgets/frame.dart';
part '../widgets/textfield_showcase.dart';
part '../widgets/context_menu_showcase.dart';
part '../widgets/icons_showcase.dart';
part '../widgets/segment_showcase.dart';
part '../widgets/popup_menu_showcase.dart';
part '../widgets/stepper_showcase.dart';

Widget _buildDivider({Axis orientation = Axis.horizontal}) {
  return orientation == Axis.horizontal
      ? PAPDivider.horizontal()
      : SizedBox(height: 40, child: PAPDivider.vertical());
}

const _spacer = SizedBox(height: 10);

class Showcase extends StatelessWidget {
  const Showcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildContent(context),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    var widgets = <Widget>[];

    widgets.add(const _StepperShowcase());

    widgets.add(const _DropdownShowcase());

    widgets.add(const _PopupMenuShowcase());

    widgets.add(const _SegmentShowcase());

    widgets.add(const _ButtonShowcase());

    widgets.add(const _CardShowcase());

    widgets.add(
      Frame(
        title: 'Numeric input fields',
        widgets: [
          const _NumericShowcase(),
        ],
      ),
    );

    widgets.add(
      const _ContextMenuShowcase(),
    );

    widgets.add(
      Frame(
        title: 'Sample Icons',
        widgets: [
          const _IconsShowcase(),
        ],
      ),
    );

    return widgets;
  }
}
