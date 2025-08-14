import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_ui_components/module_ui_components.dart';

enum SubmitKeyType {
  enter,
  ctrlEnter,
}

enum ValidateMode {
  always,
  onUnFocused,
}

enum PAPTextInputStyle {
  fill,
  outline,
}

enum PAPTextInputIconPosition {
  left,
  right,
}

class PAPTextInput extends StatefulWidget {
  const PAPTextInput({
    required TextEditingController controller,
    required String label,
    required bool autoFocus,
    required bool isEnable,
    required bool isMultiline,
    required Function(String)? onChanged,
    required Function(String)? onSubmitted,
    required int maxCharacterLimit,
    required SubmitKeyType submitKeyType,
    required bool hideCounter,
    PAPTextInputStyle styleType = PAPTextInputStyle.outline,
    bool isMultiStyle = false,
    String? placeHolder,
    TextInputAction textInputAction = TextInputAction.done,
    String? Function(String?)? validator,
    ValueChanged<bool>? onValidateChanged,
    ValidateMode validateMode = ValidateMode.always,
    double? height,
    EdgeInsets? contentPadding,
    IconData? icon,
    PAPTextInputIconPosition iconPosition = PAPTextInputIconPosition.right,
    bool hasClearIcon = false,
    bool obscureText = false,
    bool showSuffixIcon = true,
    bool showErrorText = true,
    VoidCallback? onIconTap,
    super.key,
  })  : assert(maxCharacterLimit >= 0,
            'Maximum character limit should be equal or greater than zero'),
        assert(
            !(hasClearIcon &&
                icon != null &&
                iconPosition == PAPTextInputIconPosition.right),
            'Only clear icon or suffix icon should be provided'),
        _controller = controller,
        _label = label,
        _autoFocus = autoFocus,
        _isEnable = isEnable,
        _isMultiline = isMultiline,
        _onChanged = onChanged,
        _onSubmitted = onSubmitted,
        _validator = validator,
        _maxCharacterLimit = maxCharacterLimit,
        _submitKeyType = submitKeyType,
        _isMultiStyle = isMultiStyle,
        _placeHolder = placeHolder,
        _textInputAction = textInputAction,
        _onValidateChanged = onValidateChanged,
        _validateMode = validateMode,
        _hideCounter = hideCounter,
        _height = height,
        _contentPadding = contentPadding,
        _icon = icon,
        _iconPosition = iconPosition,
        _hasClearIcon = hasClearIcon,
        _styleType = styleType,
        _obscureText = obscureText,
        _showSuffixIcon = showSuffixIcon,
        _showErrorText = showErrorText,
        _onIconTap = onIconTap;

  factory PAPTextInput.plain({
    required TextEditingController controller,
    required String label,
    required SubmitKeyType submitKeyType,
    PAPTextInputStyle styleType = PAPTextInputStyle.outline,
    bool autoFocus = false,
    bool isEnable = true,
    bool isMultiline = false,
    bool isMultiStyle = false,
    TextInputAction textInputAction = TextInputAction.done,
    bool hideCounter = false,
    String? placeHolder,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    double? height,
    EdgeInsets? contentPadding,
    IconData? icon,
    PAPTextInputIconPosition iconPosition = PAPTextInputIconPosition.right,
    bool hasClearIcon = false,
    bool obscureText = false,
    bool showSuffixIcon = true,
    VoidCallback? onIconTap,
  }) {
    return PAPTextInput(
      controller: controller,
      label: label,
      submitKeyType: submitKeyType,
      autoFocus: autoFocus,
      isEnable: isEnable,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: 0,
      isMultiline: isMultiline,
      textInputAction: textInputAction,
      isMultiStyle: isMultiStyle,
      placeHolder: placeHolder,
      hideCounter: hideCounter,
      height: height,
      contentPadding: contentPadding,
      icon: icon,
      hasClearIcon: hasClearIcon,
      styleType: styleType,
      iconPosition: iconPosition,
      obscureText: obscureText,
      showSuffixIcon: showSuffixIcon,
      onIconTap: onIconTap,
    );
  }

  factory PAPTextInput.withLimitation({
    required TextEditingController controller,
    required String label,
    required int maxCharacterLimit,
    required SubmitKeyType submitKeyType,
    PAPTextInputStyle styleType = PAPTextInputStyle.outline,
    bool autoFocus = false,
    bool isEnable = true,
    bool isMultiline = false,
    bool hideCounter = false,
    bool hasClearIcon = false,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    bool showSuffixIcon = true,
  }) {
    return PAPTextInput(
      controller: controller,
      label: label,
      autoFocus: autoFocus,
      isEnable: isEnable,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: maxCharacterLimit,
      submitKeyType: submitKeyType,
      isMultiline: isMultiline,
      hideCounter: hideCounter,
      hasClearIcon: hasClearIcon,
      styleType: styleType,
      showSuffixIcon: showSuffixIcon,
    );
  }

  factory PAPTextInput.withValidation({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    required SubmitKeyType submitKeyType,
    PAPTextInputStyle styleType = PAPTextInputStyle.outline,
    bool autoFocus = false,
    bool isEnable = true,
    bool isMultiline = false,
    int maxCharacterLimit = 0,
    bool hideCounter = false,
    ValueChanged<bool>? onValidateChanged,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    ValidateMode validateMode = ValidateMode.always,
    bool hasClearIcon = false,
    bool obscureText = false,
    VoidCallback? onIconTap,
    IconData? icon,
    bool showSuffixIcon = true,
    bool showErrorText = true,
  }) {
    return PAPTextInput(
      controller: controller,
      label: label,
      autoFocus: autoFocus,
      isEnable: isEnable,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxCharacterLimit: maxCharacterLimit,
      isMultiline: isMultiline,
      validator: validator,
      submitKeyType: submitKeyType,
      hideCounter: hideCounter,
      onValidateChanged: onValidateChanged,
      validateMode: validateMode,
      hasClearIcon: hasClearIcon,
      styleType: styleType,
      obscureText: obscureText,
      onIconTap: onIconTap,
      icon: icon,
      showSuffixIcon: showSuffixIcon,
      showErrorText: showErrorText,
    );
  }

  final TextEditingController _controller;
  final String _label;
  final bool _autoFocus;
  final bool _isEnable;
  final bool _isMultiline;
  final bool _isMultiStyle;
  final TextInputAction _textInputAction;
  final SubmitKeyType _submitKeyType;
  final Function(String)? _onChanged;
  final Function(String)? _onSubmitted;
  final String? Function(String?)? _validator;
  final int _maxCharacterLimit;
  final ValueChanged<bool>? _onValidateChanged;
  final ValidateMode _validateMode;
  final bool _hideCounter;
  final String? _placeHolder;
  final EdgeInsets? _contentPadding;
  final double? _height;
  final IconData? _icon;
  final PAPTextInputIconPosition _iconPosition;
  final bool _hasClearIcon;
  final PAPTextInputStyle _styleType;
  final bool _obscureText;
  final bool _showSuffixIcon;
  final bool _showErrorText;
  final VoidCallback? _onIconTap;

  @override
  State<PAPTextInput> createState() => _PAPTextInputState();
}

class _PAPTextInputState extends State<PAPTextInput> {
  static const _fixedIconMultiLinePadding = EdgeInsets.only(
    top: 16.0,
    right: 16.0,
  );
  static const _fixedIconSingleLinePadding = EdgeInsets.only(right: 15);
  static const _errorMessageHeight = 1.2;
  static const _minLines = 1;
  static const _textInputSingleLineMaxHeight = 70.0;
  static const _singleLineNoValidationMaxHeight = 48.0;
  static const _singleLineSuffixConstraints = BoxConstraints(
    maxWidth: 40.0,
    minWidth: 40.0,
    maxHeight: 40.0,
    minHeight: 40.0,
  );

  static const _multiLineSuffixConstraints = BoxConstraints(
    maxWidth: 40.0,
    minWidth: 40.0,
    minHeight: 20.0,
  );
  static const _cursorHeight = 15.0;
  static const _fillIconSize = 12.0;
  static const _outlineIconSize = 20.0;
  static const _outlineHeight = 40.0;
  static const _fillHeight = 32.0;
  static const _deviceTextHeight = 1.0;
  static const _outlinePrefixIconSize = 12.0;

  late final focusNode = FocusNode(
    onKeyEvent: _handleKeyPress,
  );
  late String currentValue;
  String? errorMessage;
  late bool isTouched;
  late bool _isHovered;

  @override
  void initState() {
    isTouched = false;
    _isHovered = false;
    if (widget._controller.text.isNotEmpty) _validate();
    currentValue = widget._controller.text;
    widget._controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    /// for every change in focus, the widget needs to be rebuilt
    /// to reflect color changes for character limitation and label
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isTouched = true;
        if (widget._validateMode == ValidateMode.always) {
          _validate();
        }
      } else if (focusNode.hasFocus == false && isTouched == true) {
        if (widget._validateMode == ValidateMode.onUnFocused ||
            widget._validateMode == ValidateMode.always) {
          _validate();
        }
        if (widget._onSubmitted != null &&
            currentValue != widget._controller.text) {
          widget._onSubmitted!(currentValue);
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final hasFocus = focusNode.hasFocus;
    final maxCharacterLimit = widget._maxCharacterLimit;
    final labelColor = _getLabelColor(appTheme: appTheme);
    final textInput = SizedBox(
      height: widget._height ??
          (widget._styleType == PAPTextInputStyle.fill
              ? _fillHeight
              : _outlineHeight),
      child: MouseRegion(
        onEnter: (event) => setState(() {
          _isHovered = true;
        }),
        onExit: (event) => setState(() {
          _isHovered = false;
        }),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return TextFormField(
              obscureText: widget._obscureText,
              enabled: widget._isEnable,
              autovalidateMode: widget._validator != null
                  ? widget._validateMode == ValidateMode.always
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              validator: widget._validator,
              textInputAction: widget._submitKeyType == SubmitKeyType.ctrlEnter
                  ? TextInputAction.newline
                  : widget._textInputAction,
              focusNode: focusNode,
              onFieldSubmitted: (value) {
                if (value != currentValue) {
                  setState(() {
                    isTouched = true;
                    _validate();
                    widget._onValidateChanged?.call(errorMessage == null);
                    currentValue = value;
                  });
                  if (errorMessage == null) {
                    widget._onSubmitted?.call(value);
                  }
                }
              },
              onChanged: (value) {
                if (widget._validator != null) {
                  _validate();
                }
                widget._onChanged?.call(value);
              },
              keyboardType: widget._isMultiline
                  ? TextInputType.multiline
                  : TextInputType.text,
              maxLines: widget._isMultiline ? null : _minLines,
              expands: widget._isMultiline,
              textAlignVertical: widget._isMultiline
                  ? TextAlignVertical.top
                  : TextAlignVertical.center,
              maxLength: maxCharacterLimit > 0 ? maxCharacterLimit : null,
              autofocus: widget._autoFocus,
              controller: widget._controller,
              showCursor: widget._isEnable,
              cursorHeight: _cursorHeight,
              cursorColor: appTheme.colors.focusedBorder,
              decoration: _getDecoration(
                appTheme: appTheme,
                hasFocus: hasFocus,
                labelColor: labelColor,
                currentLength: widget._controller.text.length,
                maxLength: widget._maxCharacterLimit,
              ),
              style: !widget._isEnable
                  ? appTheme.typographies
                      .byFontFamily()
                      .textInputContentOutline
                      .copyWith(
                        color: appTheme.colors.textInputContentDisabled,
                      )
                  : widget._isMultiStyle
                      ? _buildStyle(
                          appTheme: appTheme,
                          data: widget._controller.text,
                          context: context,
                          textInputConstraints: constraints,
                        )
                      : (widget._styleType == PAPTextInputStyle.fill
                              ? appTheme.typographies
                                  .byFontFamily()
                                  .textInputContentFill
                              : appTheme.typographies
                                  .byFontFamily()
                                  .textInputContentOutline)
                          .copyWith(
                          color: appTheme.colors.textInputContent,
                          height: !kIsWeb ? _deviceTextHeight : null,
                        ),
            );
          },
        ),
      ),
    );
    if (widget._validator == null &&
        !widget._isMultiline &&
        !widget._isMultiStyle &&
        widget._label.isEmpty) {
      return _forceTextFieldHeight(
        child: textInput,
        appTheme: appTheme,
      );
    } else {
      return SizedBox(
        height: widget._isMultiline ? null : _textInputSingleLineMaxHeight,
        child: textInput,
      );
    }
  }

  Widget _forceTextFieldHeight({
    required Widget child,
    required IAppThemeData appTheme,
  }) {
    return SizedBox(
      height: _singleLineNoValidationMaxHeight,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: child,
        ),
      ),
    );
  }

  KeyEventResult _handleKeyPress(FocusNode focusNode, KeyEvent event) {
    if (widget._submitKeyType == SubmitKeyType.ctrlEnter &&
        (HardwareKeyboard.instance.isControlPressed &&
            HardwareKeyboard.instance
                .isLogicalKeyPressed(LogicalKeyboardKey.enter))) {
      focusNode.unfocus();
      return KeyEventResult.handled;
    } else if (widget._submitKeyType == SubmitKeyType.enter &&
        HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
      focusNode.unfocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _validate() {
    errorMessage = widget._validator?.call(widget._controller.text);
  }

  Color _getLabelColor({
    required IAppThemeData appTheme,
  }) {
    if (errorMessage != null) {
      return appTheme.colors.textInputHelperError;
    }
    if (!widget._isEnable) return appTheme.colors.textInputHelperDefault;
    if (focusNode.hasFocus) {
      if (widget._validator != null) {
        return errorMessage != null
            ? appTheme.colors.textInputHelperError
            : appTheme.colors.textInputHelperFocused;
      } else {
        return appTheme.colors.textInputHelperFocused;
      }
    }
    if (widget._controller.text.isNotEmpty) {
      return appTheme.colors.textInputHelperDefault;
    } else {
      return appTheme.colors.textInputHelperDefault;
    }
  }

  InputDecoration _getDecoration({
    required IAppThemeData appTheme,
    required Color labelColor,
    required bool hasFocus,
    required int currentLength,
    int? maxLength,
  }) {
    return InputDecoration(
      hintText: widget._placeHolder,
      hintStyle: appTheme
          .getTextStyle(
            typographyFamily: widget._styleType == PAPTextInputStyle.fill
                ? TypographyFamily.caption
                : TypographyFamily.body2,
            color: appTheme.colors.textInputHintText,
          )
          .copyWith(fontWeight: FontWeight.w500),
      prefixIcon: widget._icon != null &&
              widget._iconPosition == PAPTextInputIconPosition.left
          ? Icon(
              widget._icon,
              color: appTheme.colors.textInputIconDefault,
              size: widget._styleType == PAPTextInputStyle.fill
                  ? _fillIconSize
                  : _outlinePrefixIconSize,
            )
          : null,
      suffixIcon: widget._showSuffixIcon &&
              (widget._icon == null ||
                  widget._iconPosition == PAPTextInputIconPosition.left)
          ? widget._validator != null &&
                  (isTouched || widget._controller.text.isNotEmpty)
              ? errorMessage != null
                  ? Icon(
                      appTheme.icons.alertDanger,
                      color: appTheme.colors.textInputIconError,
                      size: _outlineIconSize,
                    )
                  : Icon(
                      appTheme.icons.arrowCheck,
                      color: hasFocus
                          ? appTheme.colors.textInputIconFocused
                          : appTheme.colors.textInputIconSuccess,
                      size: _outlineIconSize,
                    )
              : widget._hasClearIcon
                  ? focusNode.hasFocus && widget._controller.text.isNotEmpty
                      ? Align(
                          alignment: widget._isMultiline
                              ? Alignment.topCenter
                              : Alignment.centerLeft,
                          child: IconButton(
                            iconSize:
                                widget._styleType == PAPTextInputStyle.fill
                                    ? _fillIconSize
                                    : _outlineIconSize,
                            color: widget._styleType == PAPTextInputStyle.fill
                                ? appTheme.colors.secondaryCaption
                                : appTheme.colors.textInputIconFocused,
                            icon: Icon(appTheme.icons.close),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              widget._controller.text = '';
                              widget._onChanged?.call(widget._controller.text);
                              widget._onSubmitted
                                  ?.call(widget._controller.text);
                              setState(() {
                                currentValue = widget._controller.text;
                              });
                            },
                          ),
                        )
                      : null
                  : null
          : widget._iconPosition == PAPTextInputIconPosition.right
              ? Align(
                  alignment: widget._isMultiline
                      ? Alignment.topRight
                      : Alignment.centerRight,
                  child: Padding(
                    padding: widget._isMultiline
                        ? _fixedIconMultiLinePadding
                        : _fixedIconSingleLinePadding,
                    child: GestureDetector(
                      onTap: widget._onIconTap,
                      child: Icon(
                        widget._icon,
                        color: hasFocus
                            ? errorMessage != null
                                ? appTheme.colors.textInputIconError
                                : appTheme.colors.textInputIconFocused
                            : errorMessage != null
                                ? appTheme.colors.textInputIconError
                                : appTheme.colors.textInputIconDefault,
                        size: widget._styleType == PAPTextInputStyle.fill
                            ? _fillIconSize
                            : _outlineIconSize,
                      ),
                    ),
                  ),
                )
              : null,
      suffixIconConstraints: widget._isMultiline
          ? _multiLineSuffixConstraints
          : _singleLineSuffixConstraints,
      isDense: false,
      errorText: errorMessage,
      errorStyle: appTheme.typographies.byFontFamily().textInputHelper.copyWith(
            color: appTheme.colors.textInputHelperError,
            height: _errorMessageHeight,
            fontSize: widget._showErrorText ? null : 0,
          ),
      errorBorder: appTheme.textInputErrorBorderStyle,
      contentPadding: widget._contentPadding ??
          (widget._isMultiline
              ? widget._styleType == PAPTextInputStyle.fill
                  ? appTheme.textInputFillMultiLineContentPadding
                  : appTheme.textInputOutlineMultiLineContentPadding
              : widget._styleType == PAPTextInputStyle.fill
                  ? appTheme.textInputFillSingleLineContentPadding
                  : appTheme.textInputOutlineSingleLineContentPadding),
      focusedErrorBorder: appTheme.textInputErrorBorderStyle,
      focusedBorder: widget._styleType == PAPTextInputStyle.fill
          ? appTheme.textInputFillFocusBorderStyle
          : appTheme.textInputOutlineFocusBorderStyle,
      border: appTheme.textInputBorderStyle,
      enabledBorder: _isHovered
          ? appTheme.textInputHoverBorderStyle
          : appTheme.textInputBorderStyle,
      disabledBorder: appTheme.textInputDisabledBorderStyle,
      labelText: widget._label.isEmpty ? null : widget._label,
      labelStyle:
          appTheme.typographies.byFontFamily().textInputContentOutline.copyWith(
                color: labelColor,
              ),
      filled: true,
      fillColor: widget._isEnable
          ? widget._styleType == PAPTextInputStyle.fill
              ? focusNode.hasFocus
                  ? appTheme.colors.textInputFillBackgroundFocused
                  : appTheme.colors.textInputFillBackgroundDefault
              : appTheme.colors.textInputOutlineBackgroundDefault
          : widget._styleType == PAPTextInputStyle.fill
              ? appTheme.colors.textInputFillBackgroundDefault
              : widget._controller.text.isEmpty
                  ? appTheme.colors.textInputOutlineBackgroundDisabled
                  : appTheme.colors.textInputOutlineBackgroundDefault,
      hoverColor: appTheme.colors.transparent,
      focusColor: appTheme.colors.transparent,
      alignLabelWithHint: true,
      counterText: !widget._hideCounter ? '$currentLength / $maxLength' : null,
      counterStyle:
          appTheme.typographies.byFontFamily().textInputHelper.copyWith(
                height: _errorMessageHeight,
                color: errorMessage != null
                    ? appTheme.colors.textInputHelperError
                    : hasFocus
                        ? appTheme.colors.textInputHelperFocused
                        : appTheme.colors.textInputHelperDefault,
              ),
    );
  }

  TextStyle _buildStyle({
    required IAppThemeData appTheme,
    required BuildContext context,
    required String data,
    required BoxConstraints textInputConstraints,
  }) {
    final inputStyle = widget._styleType == PAPTextInputStyle.fill
        ? appTheme.typographies.byFontFamily().textInputContentFill
        : appTheme.typographies.byFontFamily().textInputContentOutline;
    var style = inputStyle.copyWith(
      color: appTheme.colors.textInputContent,
      height: !kIsWeb ? _deviceTextHeight : null,
    );
    var span = TextSpan(
      text: data,
      style: style,
    );

    if (_checkTextFits(
      span,
      appTheme,
      textInputConstraints,
    )) {
      return style;
    }

    style = inputStyle.copyWith(
      color: appTheme.colors.textInputContent,
      height: !kIsWeb ? _deviceTextHeight : null,
      fontSize: inputStyle.fontSize! - 2,
    );

    span = TextSpan(
      text: data,
      style: style,
    );

    if (_checkTextFits(
      span,
      appTheme,
      textInputConstraints,
    )) {
      return style;
    }

    style = appTheme.typographies.byFontFamily().textInputContentFill.copyWith(
          color: appTheme.colors.textInputContent,
          height: !kIsWeb ? _deviceTextHeight : null,
          fontSize: inputStyle.fontSize! - 4,
        );

    return style;
  }

  bool _checkTextFits(
    TextSpan text,
    IAppThemeData appTheme,
    BoxConstraints textInputConstraints,
  ) {
    var inputWidth = textInputConstraints.maxWidth -
        ((widget._styleType == PAPTextInputStyle.fill
                    ? appTheme.textInputFillMultiLineContentPadding
                    : appTheme.textInputOutlineMultiLineContentPadding)
                .horizontal +
            (widget._icon != null ||
                    (widget._hasClearIcon && focusNode.hasFocus) ||
                    (widget._validator != null &&
                        (isTouched || widget._controller.text.isNotEmpty))
                ? widget._styleType == PAPTextInputStyle.fill
                    ? _fillIconSize
                    : _outlineIconSize
                : 0));
    var inputHeight = textInputConstraints.maxHeight -
        (widget._contentPadding != null
            ? widget._contentPadding!.vertical
            : (widget._styleType == PAPTextInputStyle.fill
                    ? appTheme.textInputFillMultiLineContentPadding
                    : appTheme.textInputOutlineMultiLineContentPadding)
                .vertical);

    var plainText = text.toPlainText();

    if (plainText.isNotEmpty) {
      // replace all \n with 'space with \n' to prevent dropping last character to new line
      var textContents = text.text ?? '';
      plainText = textContents.replaceAll('\n', ' \n');
      // \n is 10, <space> is 32
      if (textContents.codeUnitAt(textContents.length - 1) != 10 &&
          textContents.codeUnitAt(textContents.length - 1) != 32) {
        plainText += ' ';
      }
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: plainText,
        style: text.style,
      ),
      textScaler: MediaQuery.of(context).textScaler,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: inputWidth);
    final textSize = textPainter.size;
    final metrics = textPainter.computeLineMetrics();
    if (metrics.isEmpty) {
      return true;
    }
    final linesCount = metrics.length;
    final singleLineHeight = metrics.first.height;

    if (textSize.height > inputHeight ||
        linesCount > inputHeight ~/ singleLineHeight) {
      return false;
    } else {
      return true;
    }
  }
}
