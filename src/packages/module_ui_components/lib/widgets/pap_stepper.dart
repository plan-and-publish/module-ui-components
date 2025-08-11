import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

class PAPStepper extends StatefulWidget {
  const PAPStepper({
    required TextEditingController textController,
    Function(String)? onChanged,
    int maxCharacterLimit = 4,
    double stepSize = 1.0,
    double? incrementalStepSize,
    double? decrementalStepSize,
    int fractionDigits = 0,
    double? minimumValue,
    double? maximumValue,
    List<String>? allowedValues,
    super.key,
  })  : _stepSize = stepSize,
        _incrementalStepSize = incrementalStepSize,
        _decrementalStepSize = decrementalStepSize,
        _onChanged = onChanged,
        _minimumValue = minimumValue,
        _maximumValue = maximumValue,
        _maxCharacterLimit = maxCharacterLimit,
        _numericInputController = textController,
        _fractionDigits = fractionDigits,
        _allowedValues = allowedValues;

  factory PAPStepper.withVariousIncrementDecrementStep({
    required TextEditingController textController,
    required double incrementalStepSize,
    required double decrementalStepSize,
    Key? key,
    Function(String)? onChanged,
    int maxCharacterLimit = 4,
    int fractionDigits = 0,
    double? minimumValue,
    double? maximumValue,
    List<String>? allowedValues,
  }) {
    return PAPStepper(
      textController: textController,
      onChanged: onChanged,
      maxCharacterLimit: maxCharacterLimit,
      stepSize: incrementalStepSize,
      incrementalStepSize: incrementalStepSize,
      decrementalStepSize: decrementalStepSize,
      fractionDigits: fractionDigits,
      minimumValue: minimumValue,
      maximumValue: maximumValue,
      allowedValues: allowedValues,
      key: key,
    );
  }

  factory PAPStepper.normal({
    required TextEditingController textController,
    Key? key,
    Function(String)? onChanged,
    int maxCharacterLimit = 4,
    double stepSize = 1.0,
    double? incrementalStepSize,
    double? decrementalStepSize,
    int fractionDigits = 0,
    double? minimumValue,
    double? maximumValue,
    List<String>? allowedValues,
  }) {
    return PAPStepper(
      textController: textController,
      onChanged: onChanged,
      maxCharacterLimit: maxCharacterLimit,
      stepSize: stepSize,
      incrementalStepSize: incrementalStepSize,
      decrementalStepSize: decrementalStepSize,
      fractionDigits: fractionDigits,
      minimumValue: minimumValue,
      maximumValue: maximumValue,
      allowedValues: allowedValues,
      key: key,
    );
  }

  final TextEditingController _numericInputController;
  final int _maxCharacterLimit;
  final Function(String)? _onChanged;
  final double _stepSize;
  final double? _minimumValue;
  final double? _maximumValue;
  final int _fractionDigits;
  final double? _incrementalStepSize;
  final double? _decrementalStepSize;
  final List<String>? _allowedValues;

  @override
  State<PAPStepper> createState() => _PAPStepperState();
}

class _PAPStepperState extends State<PAPStepper> {
  late String _value;
  static const _boxHeight = 32.0;
  static const _boxBorderRadius = 4.0;
  final _formKey = GlobalKey<FormState>();
  var _isHovered = false;
  var _isFocused = false;

  @override
  void initState() {
    _value = widget._numericInputController.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: _boxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_boxBorderRadius),
          border: Border.all(
            color: _isHovered
                ? appTheme.colors.stepperFocusBorder
                : appTheme.colors.stepperDefaultBorder,
          ),
          color: _isFocused
              ? appTheme.colors.stepperFocusBackground
              : appTheme.colors.stepperDefaultBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PAPButton.icon(
              isEnable: _isDecreaseEnabled(),
              onTap: _onDecrease,
              icon: appTheme.icons.mathMinusSmall,
              buttonSize: ButtonSize.small,
            ),
            Expanded(
              child: Focus(
                onFocusChange: _onFocusChange,
                child: PAPNumericInput(
                  formKey: _formKey,
                  controller: widget._numericInputController,
                  autoFocus: false,
                  isEnable: true,
                  maxCharacterLimit: widget._maxCharacterLimit,
                  onSubmitted: _submit,
                  validator: _validator,
                  preserveCounterHeight: true,
                  isEmbedded: true,
                  inputType: PAPNumericInputType.compact,
                ),
              ),
            ),
            PAPButton.icon(
              isEnable: _isIncreaseEnabled(),
              onTap: _onIncrease,
              icon: appTheme.icons.mathPlus,
              buttonSize: ButtonSize.small,
            ),
          ],
        ),
      ),
    );
  }

  void _submit(String value) {
    if (_validator(value) == null) {
      final newValueAsString = double.tryParse(value)?.toStringAsFixed(
            widget._fractionDigits,
          ) ??
          _value;
      widget._numericInputController.text = newValueAsString;
      _value = newValueAsString;
      setState(() {
        widget._onChanged?.call(newValueAsString);
      });
    }
  }

  void _onIncrease() {
    final currentValue = double.tryParse(widget._numericInputController.text);
    if (currentValue != null) {
      final newValue =
          currentValue + (widget._incrementalStepSize ?? widget._stepSize);
      _submit(newValue.toString());
    }
  }

  void _onDecrease() {
    final currentValue = double.tryParse(widget._numericInputController.text);
    if (currentValue != null) {
      final newValue =
          currentValue - (widget._decrementalStepSize ?? widget._stepSize);
      _submit(newValue.toString());
    }
  }

  bool _isDecreaseEnabled() {
    if (widget._minimumValue == null) {
      return true;
    }
    final value = double.tryParse(widget._numericInputController.text);
    if (value == null) {
      return false;
    }
    return value >=
        widget._minimumValue! +
            (widget._decrementalStepSize ?? widget._stepSize);
  }

  bool _isIncreaseEnabled() {
    if (widget._maximumValue == null) {
      return true;
    }
    final value = double.tryParse(widget._numericInputController.text);
    if (value == null) {
      return false;
    }
    return value <=
        widget._maximumValue! -
            (widget._incrementalStepSize ?? widget._stepSize);
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (widget._allowedValues?.contains(value) ?? false) {
      return null;
    }

    final newValue = double.tryParse(value);
    if (newValue == null) {
      return '';
    }
    if (widget._maximumValue == null && widget._minimumValue == null) {
      return null;
    }
    if (widget._minimumValue != null) {
      if (newValue < widget._minimumValue!) {
        return '';
      }
    }
    if (widget._maximumValue != null) {
      if (newValue > widget._maximumValue!) {
        return '';
      }
    }
    return null;
  }

  void _onFocusChange(bool focused) {
    if (focused) {
      widget._numericInputController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: widget._numericInputController.value.text.length,
      );
      _isFocused = true;
      setState(() {});
    } else {
      widget._numericInputController.text = _value.toString();
      _formKey.currentState?.validate();
      _isFocused = false;
      setState(() {});
    }
  }
}
