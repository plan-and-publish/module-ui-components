part of '../views/showcase.dart';

class _NumericShowcase extends StatefulWidget {
  const _NumericShowcase();

  @override
  _NumericShowcaseState createState() => _NumericShowcaseState();
}

class _NumericShowcaseState extends State<_NumericShowcase> {
  final wordLimitTextFieldCtrl = TextEditingController();
  final withoutLimitTextFieldCtrl = TextEditingController();
  final generalTextFieldCtrl = TextEditingController();
  final disabledTextFieldCtrl = TextEditingController();
  final regEx = RegExp(r'^[a-zA-Z0-9 ._-]+$');
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
      return 'Invalid Value';
    }
    return null;
  }

  List<Widget> _buildTextInputs() {
    var widgets = <Widget>[];
    widgets.add(spacer);
    widgets.add(
      const PAPText(text: 'Limited to 4 as per design :'),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 127,
        child: PAPNumericInput.withValidation(
          controller: wordLimitTextFieldCtrl,
          label: 'Label',
          suffixLabel: 'PX',
          onChanged: (str) {},
          maxCharacterLimit: 4,
          validator: validatorFunction,
          onValidateChanged: (isValidated) {},
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 127,
        child: PAPNumericInput.withValidation(
          controller: wordLimitTextFieldCtrl,
          label: 'Label',
          suffixLabel: 'PX',
          onChanged: (str) {},
          maxCharacterLimit: 4,
          validator: validatorFunction,
          onValidateChanged: (isValidated) {},
          preserveCounterHeight: false,
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPNumericInput.plain(
          controller: withoutLimitTextFieldCtrl,
          label: 'Input without limit',
          suffixLabel: 'PX',
          onChanged: (str) {},
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPNumericInput.plain(
          controller: withoutLimitTextFieldCtrl,
          onChanged: (str) {},
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      const PAPText(text: 'Disabled as per design :'),
    );
    widgets.add(spacer);
    disabledTextFieldCtrl.text = 'Value';
    widgets.add(
      SizedBox(
        width: 400,
        child: PAPNumericInput.plain(
          isEnable: false,
          controller: disabledTextFieldCtrl,
          label: 'Disabled',
          suffixLabel: 'PX',
        ),
      ),
    );
    widgets.add(spacer);
    widgets.add(
      const PAPText(text: 'Compact mode :'),
    );
    widgets.add(spacer);
    widgets.add(
      SizedBox(
        width: 127,
        child: PAPNumericInput.withValidation(
          controller: wordLimitTextFieldCtrl,
          inputType: PAPNumericInputType.compact,
          label: 'Label',
          validator: validatorFunction,
          onChanged: (str) {},
        ),
      ),
    );
    return widgets;
  }
}
