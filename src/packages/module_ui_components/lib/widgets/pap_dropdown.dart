import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

enum DropDownStyleType {
  fill,
  plain,
}

class PAPDropDown extends StatefulWidget {
  const PAPDropDown({
    required List<PAPDropDownItem> items,
    Function(int)? onChanged,
    Offset? menuOffset = const Offset(0, -4),
    double? dropDownButtonWidth,
    double? dropDownMenuWidth,
    double textInputMinWidth = 48.0,
    bool hasInput = false,
    bool Function(String)? validator,
    void Function(String)? onSubmit,
    TextEditingController? dropDownTextController,
    DropDownStyleType styleType = DropDownStyleType.fill,
    ContextMenuItemType contextMenuItemType =
        ContextMenuItemType.doubleLineContext,
    String? disabledHintText,
    String? placeHolder,
    bool showEmptyAsError = false,
    super.key,
  })  : _items = items,
        _onChanged = onChanged,
        _onSubmitted = onSubmit,
        _styleType = styleType,
        _menuOffset = menuOffset,
        _hasInput = hasInput,
        _validator = validator,
        _dropDownTextController = dropDownTextController,
        _dropDownButtonWidth = dropDownButtonWidth,
        _dropDownMenuWidth = dropDownMenuWidth,
        _textInputMinWidth = textInputMinWidth,
        _contextMenuItemType = contextMenuItemType,
        _disabledHintText = disabledHintText,
        _placeHolder = placeHolder,
        _showEmptyAsError = showEmptyAsError,
        assert(
          !hasInput ||
              (hasInput && dropDownTextController != null && validator != null),
          'controller and validator must be defined when hasInput is true.',
        );

  final Function(int)? _onChanged;
  final Function(String)? _onSubmitted;
  final DropDownStyleType _styleType;
  final bool Function(String)? _validator;
  final TextEditingController? _dropDownTextController;
  final List<PAPDropDownItem> _items;
  final Offset? _menuOffset;
  final bool _hasInput;
  final double? _dropDownButtonWidth;
  final double? _dropDownMenuWidth;
  final double _textInputMinWidth;
  final ContextMenuItemType _contextMenuItemType;
  final String? _disabledHintText;
  final String? _placeHolder;
  final bool _showEmptyAsError;

  @override
  State<PAPDropDown> createState() => _PAPDropDownState();
}

class _PAPDropDownState extends State<PAPDropDown> {
  static const _textInputPadding = EdgeInsets.symmetric(
    vertical: 4,
  );
  static const _dropDownRadius = 4.0;
  static const _dropDownIconSize = 16.0;
  static const _dropDownHeight = 32.0;
  static const _dropDownMenuPadding = EdgeInsets.symmetric(
    vertical: 4.0,
    horizontal: 1.0,
  );
  static const _noItemSelected = 'please select an item';
  static const _inputMaxLength = 3;
  static const _scrollbarThickness = 3.0;
  static const _scrollbarRadius = Radius.circular(8);
  static const _plainButtonPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
  );
  static const _plainButtonTextMargin = 8.0;
  static const _plainButtonIconSize = 20.0;
  static const _defaultOffset = Offset(0, -4);

  bool _isHovered = false;
  bool _isMenuOpen = false;
  final _focusNode = FocusNode();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    if (widget._hasInput) {
      _isValid = widget._validator!.call(widget._dropDownTextController!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    if (kIsWeb) {
      return MouseRegion(
        onEnter: (_) {
          if (widget._items.isNotEmpty) setState(() => _isHovered = true);
        },
        onExit: (_) {
          if (widget._items.isNotEmpty) setState(() => _isHovered = false);
        },
        child: _buildDropDown(appTheme),
      );
    } else {
      return _buildDropDown(appTheme);
    }
  }

  Widget _buildDropDown(IAppThemeData appTheme) {
    final appTheme = AppTheme.of(context).theme;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        dropdownStyleData: DropdownStyleData(
          padding: _dropDownMenuPadding,
          scrollbarTheme: ScrollbarThemeData(
            radius: _scrollbarRadius,
            thickness: WidgetStateProperty.all(
              _scrollbarThickness,
            ),
          ),
          width: widget._dropDownMenuWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_dropDownRadius),
            border: Border.all(
              color: appTheme.colors.boxBorder,
            ),
            color: appTheme.colors.defaultBackground,
          ),
          elevation: appTheme.contextMenuElevation.toInt(),
          offset: widget._menuOffset ?? _defaultOffset,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: widget._contextMenuItemType ==
                  ContextMenuItemType.doubleLineContext
              ? appTheme.doubleLineContextItemHeight
              : appTheme.singleLineContextItemHeight,
          padding: EdgeInsets.zero,
        ),
        onMenuStateChange: (isOpen) {
          setState(() => _isMenuOpen = isOpen);
        },
        isExpanded: true,
        items: widget._items.isNotEmpty
            ? widget._items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Container(
                        color: appTheme.colors.defaultBackground,
                        child: PAPContextMenuItem(
                          menuItemType: widget._contextMenuItemType,
                          title: item.title,
                          subtitle: item.subtitle,
                          icon: item.icon,
                          isSelected: item.isSelected,
                          indentationLevel: item.indentationLevel,
                          titleStyle: item.style,
                        ),
                      ),
                    ))
                .toList()
            : null,
        disabledHint: PAPText(
          text: widget._disabledHintText ?? '',
          style: appTheme.typographies
              .byFontFamily()
              .button
              .copyWith(color: appTheme.colors.dropDownDisabledText),
          softWrap: false,
          textOverflow: TextOverflow.ellipsis,
        ),
        value: _selectedItem,
        onChanged: (PAPDropDownItem? value) {
          if (value != null) {
            if (value.onTap != null) {
              value.onTap!.call();
            } else {
              widget._onChanged?.call(
                widget._items.indexOf(value),
              );
            }
          }
        },
        selectedItemBuilder: (context) {
          return widget._items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: PAPText(
                      text: item.title ?? '',
                      style:
                          appTheme.typographies.byFontFamily().button.copyWith(
                                overflow: TextOverflow.ellipsis,
                                color: _isHovered || _isMenuOpen
                                    ? appTheme.colors.dropDownActiveText
                                    : appTheme.colors.dropDownDefaultText,
                              ),
                    ),
                  ))
              .toList();
        },
        customButton: widget._styleType == DropDownStyleType.fill
            ? Container(
                width: widget._dropDownButtonWidth,
                height: _dropDownHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_dropDownRadius),
                  border: Border.all(
                    color:
                        (_isHovered || _isMenuOpen) && widget._items.isNotEmpty
                            ? appTheme.colors.dropDownActiveBorder
                            : appTheme.colors.dropDownDefaultBorder,
                  ),
                  color: _isValid
                      ? _isMenuOpen || _focusNode.hasFocus
                          ? appTheme.colors.dropDownActiveBackground
                          : appTheme.colors.dropDownDefaultBackground
                      : appTheme.colors.dropDownErrorBackground,
                ),
                child: Padding(
                  padding: appTheme.dropDownTextInputPadding,
                  child: Row(
                    children: [
                      widget._hasInput
                          ? Expanded(
                              child: Align(
                                alignment: appTheme.dropDownTextAlign,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: widget._textInputMinWidth,
                                  ),
                                  child: IntrinsicWidth(
                                    child: Padding(
                                      padding: _textInputPadding,
                                      child: Focus(
                                        onFocusChange: (hasFocus) {
                                          if (!hasFocus) {
                                            setState(() {});
                                          }
                                        },
                                        child: TextField(
                                          controller:
                                              widget._dropDownTextController,
                                          focusNode: _focusNode,
                                          onChanged: _validate,
                                          onSubmitted: _submit,
                                          textAlign: appTheme
                                              .dropDownTextInputAlignment,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          maxLength: _inputMaxLength,
                                          buildCounter: (
                                            context, {
                                            required int currentLength,
                                            required bool isFocused,
                                            required int? maxLength,
                                          }) {
                                            return null;
                                          },
                                          cursorColor: appTheme.colors
                                              .dropDownTextInputCursorColor,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: kIsWeb
                                                  ? appTheme
                                                      .dropDownInputVerticalPaddingWeb
                                                  : appTheme
                                                      .dropDownInputVerticalPaddingMobile,
                                              horizontal: kIsWeb
                                                  ? appTheme
                                                      .dropDownInputHorizontalPaddingWeb
                                                  : appTheme
                                                      .dropDownInputHorizontalPaddingMobile,
                                            ),
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                          ),
                                          style: appTheme.typographies
                                              .byFontFamily()
                                              .caption
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis,
                                                color: _isValid
                                                    ? appTheme.colors
                                                        .dropDownDefaultText
                                                    : appTheme.colors
                                                        .dropDownErrorText,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Align(
                                alignment: appTheme.dropDownTextAlign,
                                child: PAPText(
                                  text: _selectedItem?.title ??
                                      widget._placeHolder ??
                                      _noItemSelected,
                                  style: appTheme.typographies
                                      .byFontFamily()
                                      .dropDownCaption
                                      .copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        color: widget._items.isEmpty
                                            ? widget._showEmptyAsError
                                                ? appTheme
                                                    .colors.dropDownErrorText
                                                : appTheme
                                                    .colors.dropDownDisabledText
                                            : _isValid
                                                ? _isHovered ||
                                                        _isMenuOpen ||
                                                        _focusNode.hasFocus
                                                    ? appTheme.colors
                                                        .dropDownActiveText
                                                    : appTheme.colors
                                                        .dropDownDefaultText
                                                : appTheme
                                                    .colors.dropDownErrorText,
                                      ),
                                ),
                              ),
                            ),
                      Icon(
                        _isMenuOpen
                            ? appTheme.icons.arrowChevronUp
                            : appTheme.icons.arrowChevronDown,
                        size: _dropDownIconSize,
                        color: !_isValid
                            ? appTheme.colors.dropDownDefaultIcon
                            : _isHovered || _isMenuOpen || _focusNode.hasFocus
                                ? appTheme.colors.dropDownActiveIcon
                                : appTheme.colors.dropDownDefaultIcon,
                      )
                    ],
                  ),
                ),
              )
            : Container(
                width: widget._dropDownButtonWidth,
                height: _dropDownHeight,
                padding: _plainButtonPadding,
                decoration: BoxDecoration(
                  color: _isMenuOpen
                      ? appTheme.colors.plainBackgroundPressed
                      : _isHovered
                          ? appTheme.colors.plainBackgroundHovered
                          : appTheme.colors.plainBackgroundDefault,
                  borderRadius: BorderRadius.circular(_dropDownRadius),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: appTheme.dropDownTextAlign,
                        child: PAPText(
                          text: widget._items.isEmpty &&
                                  widget._disabledHintText != null
                              ? widget._disabledHintText!
                              : _selectedItem?.title ??
                                  widget._placeHolder ??
                                  _noItemSelected,
                          style: appTheme.typographies
                              .byFontFamily()
                              .button
                              .copyWith(
                                overflow: TextOverflow.ellipsis,
                                color: widget._items.isEmpty
                                    ? appTheme.colors.plainTextDisabled
                                    : _isMenuOpen
                                        ? appTheme.colors.plainTextPressed
                                        : _isHovered
                                            ? appTheme.colors.plainTextHovered
                                            : appTheme.colors.plainText,
                              ),
                          softWrap: false,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: _plainButtonTextMargin),
                    Center(
                      child: Icon(
                        _isMenuOpen
                            ? appTheme.icons.arrowChevronUp
                            : appTheme.icons.arrowChevronDown,
                        size: _plainButtonIconSize,
                        color: widget._items.isEmpty
                            ? appTheme.colors.plainTextDisabled
                            : _isMenuOpen
                                ? appTheme.colors.plainTextPressed
                                : _isHovered
                                    ? appTheme.colors.plainTextHovered
                                    : appTheme.colors.plainText,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void _validate(String str) {
    setState(() {
      _isValid = widget._validator?.call(str) ?? true;
    });
  }

  PAPDropDownItem? get _selectedItem {
    final index = widget._items.indexWhere(
      (element) => element.isSelected,
    );
    return index > -1 ? widget._items[index] : null;
  }

  void _submit(String value) {
    widget._onSubmitted?.call(value);
    _validate(widget._dropDownTextController?.text ?? '');
  }
}

class PAPDropDownItem extends ContextMenuAction {
  PAPDropDownItem({
    this.style,
    this.indentationLevel,
    super.title,
    super.subtitle,
    super.icon,
    super.onTap,
    super.isSelected = false,
  });

  final int? indentationLevel;
  final TextStyle? style;
}
