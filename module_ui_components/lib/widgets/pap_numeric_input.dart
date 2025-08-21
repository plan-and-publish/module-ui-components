import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

enum PAPNumericInputType {
  normal,
  compact,
}

class PAPNumericInput extends StatefulWidget {
  const PAPNumericInput({
    required TextEditingController controller,
    required bool autoFocus,
    required bool isEnable,
    required int maxCharacterLimit,
    required PAPNumericInputType inputType,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    String? label,
    String? suffixLabel,
    String? Function(String)? validator,
    ValueChanged<bool>? onValidateChanged,
    TextInputAction textInputAction = TextInputAction.done,
    double labelWidth = 47.0,
    bool? submitOnClear,
    bool? preserveCounterHeight,
    bool? isEmbedded,
    Key? formKey,
    FocusNode? focusNode,
    super.key,
  })  : assert(maxCharacterLimit >= 0,
            'Maximum character limit should be equal or greater than zero'),
        _controller = controller,
        _label = label,
        _autoFocus = autoFocus,
        _isEnable = isEnable,
        _onChanged = onChanged,
        _onSubmitted = onSubmitted,
        _validator = validator,
        _suffixLabel = suffixLabel,
        _inputType = inputType,
        _maxCharacterLimit = maxCharacterLimit,
        _onValidateChanged = onValidateChanged,
        _labelWidth = labelWidth,
        _textInputAction = textInputAction,
        _submitOnClear = submitOnClear ?? true,
        _preserveCounterHeight = preserveCounterHeight ?? true,
        _isEmbedded = isEmbedded ?? false,
        _formKey = formKey,
        _focusNode = focusNode;

  factory PAPNumericInput.plain({
    required TextEditingController controller,
    String? label,
    bool autoFocus = false,
    bool isEnable = true,
    PAPNumericInputType inputType = PAPNumericInputType.normal,
    String? suffixLabel,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    bool? preserveCounterHeight,
    FocusNode? focusNode,
  }) {
    return PAPNumericInput(
      controller: controller,
      label: label,
      autoFocus: autoFocus,
      isEnable: isEnable,
      inputType: inputType,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: 0,
      suffixLabel: suffixLabel,
      preserveCounterHeight: preserveCounterHeight,
      focusNode: focusNode,
    );
  }

  factory PAPNumericInput.withLimitation({
    required TextEditingController controller,
    required int maxCharacterLimit,
    String? label,
    PAPNumericInputType inputType = PAPNumericInputType.normal,
    bool autoFocus = false,
    bool isEnable = true,
    String? suffixLabel,
    String? Function(String)? validator,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    bool? preserveCounterHeight,
    double labelWidth = 47.0,
    FocusNode? focusNode,
  }) {
    return PAPNumericInput(
      controller: controller,
      label: label,
      autoFocus: autoFocus,
      isEnable: isEnable,
      inputType: inputType,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: maxCharacterLimit,
      suffixLabel: suffixLabel,
      preserveCounterHeight: preserveCounterHeight,
      labelWidth: labelWidth,
      focusNode: focusNode,
    );
  }

  factory PAPNumericInput.withValidation({
    required TextEditingController controller,
    required String? Function(String) validator,
    String? label,
    bool autoFocus = false,
    bool isEnable = true,
    PAPNumericInputType inputType = PAPNumericInputType.normal,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    int maxCharacterLimit = 0,
    String? suffixLabel,
    ValueChanged<bool>? onValidateChanged,
    bool? preserveCounterHeight,
    FocusNode? focusNode,
  }) {
    return PAPNumericInput(
      controller: controller,
      label: label,
      autoFocus: autoFocus,
      isEnable: isEnable,
      inputType: inputType,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: maxCharacterLimit,
      validator: validator,
      onValidateChanged: onValidateChanged,
      suffixLabel: suffixLabel,
      preserveCounterHeight: preserveCounterHeight,
      focusNode: focusNode,
    );
  }

  final TextEditingController _controller;
  final String? _label;
  final String? _suffixLabel;
  final bool _autoFocus;
  final bool _isEnable;
  final Function(String)? _onChanged;
  final Function(String)? _onSubmitted;
  final Function(String)? _validator;
  final TextInputAction _textInputAction;
  final int _maxCharacterLimit;
  final ValueChanged<bool>? _onValidateChanged;
  final PAPNumericInputType _inputType;
  final double? _labelWidth;
  final bool _submitOnClear;
  final bool _preserveCounterHeight;
  final bool _isEmbedded;
  final Key? _formKey;
  final FocusNode? _focusNode;

  @override
  State<PAPNumericInput> createState() => _PAPNumericInputState();
}

class _PAPNumericInputState extends State<PAPNumericInput> {
  static const radius = 4.0;
  static const labelMargin = 29.0;
  static const inputContentPaddingWeb = EdgeInsets.only(
    left: 8,
    top: 11.0,
    bottom: 11.0,
  );
  static const inputContentPaddingTouch = EdgeInsets.only(
    left: 8,
    top: 7.0,
    bottom: 7.0,
  );
  static const compactInputContentPaddingWeb = EdgeInsets.only(
    left: 3.0,
    top: 6.0,
    bottom: 6.0,
  );
  static const embeddedInputContentPaddingWeb = EdgeInsets.only(
    top: 11,
    bottom: 11,
    left: 7.0,
  );
  static const compactInputContentPaddingTouch = EdgeInsets.only(
    left: 3.0,
    top: 2.5,
    bottom: 2.5,
  );
  static const embeddedInputContentPaddingTouch = EdgeInsets.only(
    left: 3.0,
    top: 8.0,
    bottom: 8.0,
  );
  static const inputSuffixConstraints = BoxConstraints(
    maxWidth: 28.0,
    minWidth: 28.0,
    maxHeight: 18.0,
    minHeight: 18.0,
  );
  static const inputSuffixIconWidth = 12.0;
  static const cursorHeight = 12.0;
  static const compactInputHeight = 24.0;
  static const embeddedInputHeight = 32.0;

  String? errorMessage;
  late bool isTouched;
  late String currentValue;
  late final FocusNode focusNode;

  @override
  void initState() {
    isTouched = false;
    focusNode = widget._focusNode ?? FocusNode();
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
    currentValue = widget._controller.text;
    if (widget._controller.text.isNotEmpty) _validate();
  }

  @override
  void dispose() {
    if (widget._focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final hasFocus = focusNode.hasFocus;
    final maxCharacterLimit = widget._maxCharacterLimit;

    return Row(
      children: [
        if (widget._inputType == PAPNumericInputType.normal &&
            widget._label != null)
          _buildLabel(appTheme: appTheme),
        Expanded(
          child: _buildTextFormField(
            appTheme: appTheme,
            maxCharacterLimit: maxCharacterLimit,
            hasFocus: hasFocus,
          ),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required IAppThemeData appTheme,
    required int maxCharacterLimit,
    required bool hasFocus,
  }) {
    final form = Form(
      key: widget._formKey,
      child: TextFormField(
        keyboardType: !kIsWeb && Platform.isIOS
            ? const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              )
            : TextInputType.number,
        enabled: widget._isEnable,
        validator: widget._validator != null
            ? (str) {
                setState(() {
                  errorMessage = widget._validator?.call(str!);
                  isTouched = true;
                });
                return errorMessage;
              }
            : null,
        focusNode: focusNode,
        cursorColor: appTheme.colors.secondaryCaption,
        textAlignVertical: TextAlignVertical.top,
        textAlign: widget._inputType == PAPNumericInputType.compact
            ? TextAlign.center
            : TextAlign.start,
        maxLength: maxCharacterLimit > 0
            ? double.tryParse(widget._controller.text) != null &&
                    double.parse(widget._controller.text).truncateToDouble() !=
                        double.parse(widget._controller.text)
                ? maxCharacterLimit + 1
                : maxCharacterLimit
            : null,
        buildCounter: (
          context, {
          required int currentLength,
          required bool isFocused,
          required int? maxLength,
        }) {
          return (widget._preserveCounterHeight && !widget._isEmbedded)
              ? const PAPText(text: '')
              : null;
        },
        autofocus: widget._autoFocus,
        controller: widget._controller,
        showCursor: widget._isEnable,
        textInputAction: widget._textInputAction,
        cursorRadius: const Radius.circular(radius),
        cursorHeight: cursorHeight,
        decoration: _getDecoration(
          appTheme: appTheme,
          hasFocus: hasFocus,
        ),
        style: appTheme.typographies.byFontFamily().caption.copyWith(
              color: (!widget._isEnable
                  ? appTheme.colors.numericInputDisabledForeground
                  : errorMessage != null
                      ? appTheme.colors.numericInputErrorForeground
                      : _isControllerValueNumeric()
                          ? appTheme.colors.numericInputDefaultForeground
                          : appTheme.colors.numericInputSuffixIcon),
            ),
        onChanged: (value) {
          isTouched = true;
          currentValue = value;
          _validate();
          widget._onValidateChanged?.call(errorMessage == null);
          setState(() {});
          widget._onChanged?.call(value);
        },
        onFieldSubmitted: _onSubmit,
      ),
    );

    if (widget._inputType == PAPNumericInputType.compact) {
      return _forceFormHeight(
        child: form,
      );
    } else {
      return form;
    }
  }

  bool _isControllerValueNumeric() {
    return widget._controller.text.isNotEmpty &&
        double.tryParse(widget._controller.text) != null;
  }

  void _onSubmit(String value) {
    isTouched = true;
    _validate();
    widget._onValidateChanged?.call(errorMessage == null);
    setState(() {});
    if (errorMessage == null || !widget._preserveCounterHeight) {
      widget._onSubmitted?.call(value);
    }
  }

  Widget _forceFormHeight({required Widget child}) {
    return SizedBox(
      height: widget._isEmbedded ? embeddedInputHeight : compactInputHeight,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: child,
        ),
      ),
    );
  }

  Widget _buildLabel({
    required IAppThemeData appTheme,
  }) {
    return Container(
      padding: widget._preserveCounterHeight
          ? const EdgeInsets.only(bottom: labelMargin)
          : null,
      width: widget._labelWidth,
      child: PAPText(
        text: widget._label!,
        style: appTheme.typographies.byFontFamily().caption.copyWith(
              color: appTheme.colors.plainText,
            ),
      ),
    );
  }

  void _validate() {
    errorMessage = widget._validator?.call(widget._controller.text);
  }

  InputDecoration _getDecoration({
    required IAppThemeData appTheme,
    required bool hasFocus,
  }) {
    return InputDecoration(
      isDense: true,
      alignLabelWithHint: true,
      contentPadding: widget._inputType == PAPNumericInputType.normal
          ? kIsWeb
              ? inputContentPaddingWeb
              : inputContentPaddingTouch
          : kIsWeb
              ? widget._isEmbedded
                  ? embeddedInputContentPaddingWeb
                  : compactInputContentPaddingWeb
              : widget._isEmbedded
                  ? embeddedInputContentPaddingTouch
                  : compactInputContentPaddingTouch,
      suffixIconConstraints: inputSuffixConstraints,
      suffixIcon: widget._inputType == PAPNumericInputType.normal
          ? focusNode.hasFocus
              ? IconButton(
                  splashRadius: inputSuffixIconWidth,
                  iconSize: inputSuffixIconWidth,
                  color: appTheme.colors.numericInputSuffixIcon,
                  icon: Icon(appTheme.icons.close),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget._controller.text = '';
                    errorMessage = '';
                    isTouched = false;
                    if (widget._submitOnClear) {
                      widget._onSubmitted?.call(widget._controller.text);
                    }
                    _validate();
                    setState(() {});
                  },
                )
              : widget._suffixLabel != null && widget._suffixLabel!.isNotEmpty
                  ? PAPText(
                      text: widget._suffixLabel!,
                      textAlign: TextAlign.center,
                      style: appTheme.typographies
                          .byFontFamily()
                          .caption
                          .copyWith(
                            color: appTheme.colors.numericInputSuffixIcon,
                            fontWeight: FontWeight.w500,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                    )
                  : null
          : null,
      errorText: widget._preserveCounterHeight ? errorMessage : null,
      errorStyle: appTheme.typographies.byFontFamily().caption.copyWith(
            color: appTheme.colors.errorCaption,
          ),
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (widget._isEmbedded) {
          return appTheme.colors.numericInputEmbeddedBackground;
        } else {
          if (states.contains(WidgetState.error) ||
              states.contains(WidgetState.focused)) {
            return appTheme.colors.numericInputFocusBackground;
          } else {
            return appTheme.colors.numericInputDefaultBackground;
          }
        }
      }),
      hoverColor: widget._isEmbedded
          ? appTheme.colors.numericInputEmbeddedBackground
          : appTheme.colors.numericInputDefaultBackground,
      border: MaterialStateOutlineInputBorder.resolveWith(
        (states) => OutlineInputBorder(
          borderSide: BorderSide(
            color: widget._isEmbedded
                ? appTheme.colors.transparent
                : states.contains(WidgetState.focused) ||
                        states.contains(WidgetState.hovered) ||
                        states.contains(WidgetState.error)
                    ? appTheme.colors.numericInputFocusBorder
                    : appTheme.colors.numericInputDefaultBorder,
          ),
        ),
      ),
    );
  }
}
