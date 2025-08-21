part of '../views/showcase.dart';

class _TextFieldShowcase extends StatefulWidget {
  const _TextFieldShowcase();

  @override
  _TextFieldShowcaseState createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends State<_TextFieldShowcase> {
  final wordLimitTextFieldCtrl = TextEditingController();
  final withoutLimitTextFieldCtrl = TextEditingController();
  final generalTextFieldCtrl = TextEditingController();
  final generalMultiStyleTextFieldCtrl = TextEditingController();
  final disabledTextFieldCtrl = TextEditingController();
  final filledTextFieldCtrl = TextEditingController();
  final withIconTextFieldCtrl = TextEditingController();
  final regEx = RegExp(r'^[a-zA-Z0-9 _-]+$');
  final spacer = const SizedBox(
    height: 7,
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final widgets = _buildTextInputs();
    widgets.add(
      Container(
        margin: const EdgeInsets.all(8),
        child: PAPButton.button(
          title: 'Submit',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              Toaster.successToast(
                context: context,
                message: [
                  ToasterMessage(
                    message: 'Form is valid',
                  )
                ],
              );
            } else {
              Toaster.errorToast(
                context: context,
                message: [
                  ToasterMessage(
                    message: 'Form is invalid',
                  )
                ],
              );
            }
          },
        ),
      ),
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      child: Form(
        /// Do not forget to add this line for the Form widget
        /// as it clears the form state on user interaction
        /// for instance: when the form is evaluated, if the user tries to remove the error
        /// form state still remains the same whereas the user removed the error
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(children: widgets),
      ),
    );
  }

  String? validatorFunction(str) {
    if (str.isEmpty || !regEx.hasMatch(str)) {
      return 'Contains illegal character or empty';
    }
    return null;
  }

  List<Widget> _buildTextInputs() {
    final appTheme = AppTheme.of(context).theme;
    var widgets = <Widget>[];
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.withLimitation(
          submitKeyType: SubmitKeyType.enter,
          controller: wordLimitTextFieldCtrl,
          label: 'Input with word limit up to 10',
          onChanged: (str) {},
          maxCharacterLimit: 10,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.withValidation(
          submitKeyType: SubmitKeyType.ctrlEnter,
          controller: withoutLimitTextFieldCtrl,
          label: 'Input without word limit',
          onChanged: (str) {},
          validator: validatorFunction,
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.withValidation(
          submitKeyType: SubmitKeyType.enter,
          controller: withIconTextFieldCtrl,
          label: 'Input with validation and icon.',
          onChanged: (str) {},
          validator: validatorFunction,
          hideCounter: true,
          icon: appTheme.icons.eyeClose,
        ),
      ),
    );
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.withValidation(
          submitKeyType: SubmitKeyType.enter,
          controller: withIconTextFieldCtrl,
          label: 'Input with validation and without icon.',
          onChanged: (str) {},
          validator: validatorFunction,
          hideCounter: true,
          showSuffixIcon: false,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: 'Input with icon',
          onChanged: (str) {},
          icon: Icons.ac_unit_rounded,
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 200,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: generalTextFieldCtrl,
          label: 'MultiLine input without validation',
          isMultiline: true,
          icon: Icons.library_add,
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 120,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.ctrlEnter,
          isMultiStyle: true,
          controller: generalMultiStyleTextFieldCtrl,
          label: 'MultiStyle input without validation',
          isMultiline: true,
          icon: Icons.library_add,
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 120,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.ctrlEnter,
          isMultiStyle: true,
          controller: generalMultiStyleTextFieldCtrl,
          label: 'MultiStyle input without validation',
          isMultiline: true,
          hideCounter: true,
          hasClearIcon: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 40,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          isEnable: false,
          controller: disabledTextFieldCtrl,
          label: 'Disabled',
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 40,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          isEnable: false,
          controller: TextEditingController(text: 'email'),
          label: 'Disabled',
          hideCounter: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 32.0,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          styleType: PAPTextInputStyle.fill,
          hasClearIcon: true,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 32.0,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          styleType: PAPTextInputStyle.fill,
          hasClearIcon: true,
          icon: appTheme.icons.search,
          iconPosition: PAPTextInputIconPosition.left,
          placeHolder: 'Search Icons...',
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          hasClearIcon: true,
          icon: appTheme.icons.search,
          iconPosition: PAPTextInputIconPosition.left,
          placeHolder: 'Search Icons...',
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 100.0,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          styleType: PAPTextInputStyle.fill,
          isMultiline: true,
          placeHolder: 'Multiline',
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 100.0,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          styleType: PAPTextInputStyle.fill,
          isMultiline: true,
          hasClearIcon: true,
          placeHolder: 'Multiline with clear icon',
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        height: 100.0,
        child: PAPTextInput.plain(
          submitKeyType: SubmitKeyType.enter,
          controller: withoutLimitTextFieldCtrl,
          label: '',
          onChanged: (str) {},
          hideCounter: true,
          styleType: PAPTextInputStyle.fill,
          isMultiline: true,
          hasClearIcon: true,
          isMultiStyle: true,
          placeHolder: 'MutliStyle and Multiline',
        ),
      ),
    );
    return widgets;
  }
}
