part of '../views/showcase.dart';

class _DropdownShowcase extends StatelessWidget {
  const _DropdownShowcase();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Frame(
      title: 'DropDown',
      widgets: [
        SizedBox(
          child: _buildDropDown(
            appTheme: appTheme,
          ),
        ),
      ],
    );
  }

  Widget _buildDropDown({required IAppThemeData appTheme}) {
    bool validatorFunction(str) {
      if (str.isEmpty || str.length > 4) {
        return false;
      }
      return true;
    }

    final items = [
      PAPDropDownItem(
        title: 'First Item with long title',
        subtitle: 'This is the first item',
        onTap: () {},
        indentationLevel: 0,
      ),
      PAPDropDownItem(
        title: 'Second Item',
        subtitle:
            'and next one and it is a long one actually and wanted to test how can be..',
        indentationLevel: 1,
      ),
      PAPDropDownItem(
        title: 'Third Item',
        subtitle: 'and the final one',
        isSelected: true,
        indentationLevel: 2,
      ),
    ];

    final itemsWithTitleStyle = [
      PAPDropDownItem(
        title: 'First Item',
        style: const TextStyle(letterSpacing: 4),
        onTap: () {},
      ),
      PAPDropDownItem(
        title: 'Second Item',
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      PAPDropDownItem(
        title: 'Third Item',
        isSelected: true,
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
    ];

    return Wrap(
      runAlignment: WrapAlignment.center,
      runSpacing: 10.0,
      spacing: 30,
      children: [
        SizedBox(
          child: PAPDropDown(
            dropDownMenuWidth: 299,
            dropDownButtonWidth: 160,
            contextMenuItemType: ContextMenuItemType.singleLineContext,
            textInputMinWidth: 80,
            hasInput: true,
            dropDownTextController: TextEditingController(text: '20'),
            validator: validatorFunction,
            items: items,
          ),
        ),
        SizedBox(
          child: PAPDropDown(
            dropDownMenuWidth: 299,
            dropDownButtonWidth: 160,
            contextMenuItemType: ContextMenuItemType.singleLineContext,
            textInputMinWidth: 80,
            hasInput: true,
            dropDownTextController: TextEditingController(text: 'mix'),
            validator: validatorFunction,
            items: items,
          ),
        ),
        SizedBox(
          width: 300,
          child: PAPDropDown(
            contextMenuItemType: ContextMenuItemType.singleLineContext,
            dropDownButtonWidth: 300,
            items: itemsWithTitleStyle,
          ),
        ),
        const SizedBox(
          width: 300,
          child: PAPDropDown(
            contextMenuItemType: ContextMenuItemType.singleLineContext,
            dropDownButtonWidth: 300,
            items: [],
          ),
        ),
        SizedBox(
          width: 300,
          child: PAPDropDown(
            dropDownButtonWidth: 300,
            items: items,
          ),
        ),
        SizedBox(
          width: 109,
          child: PAPDropDown(
            items: items,
            dropDownMenuWidth: 300,
            styleType: DropDownStyleType.plain,
          ),
        ),
        SizedBox(
          width: 200,
          child: PAPDropDown(
            items: items,
            styleType: DropDownStyleType.plain,
          ),
        ),
        const SizedBox(
          width: 200,
          child: PAPDropDown(
            items: [],
            disabledHintText: 'Disabled Dropdown',
            styleType: DropDownStyleType.plain,
          ),
        ),
        const SizedBox(
          width: 200,
          child: PAPDropDown(
            items: [],
            showEmptyAsError: true,
            placeHolder: 'Empty Error Dropdown',
          ),
        )
      ],
    );
  }
}
