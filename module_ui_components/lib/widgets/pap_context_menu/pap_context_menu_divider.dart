part of 'pap_context_menu.dart';

enum PAPContextMenuDividerType {
  line,
  space,
}

class PAPContextMenuDivider extends PopupMenuDivider {
  const PAPContextMenuDivider({
    double? height,
    this.dividerType = PAPContextMenuDividerType.line,
    super.key,
  }) : _height = height;

  final PAPContextMenuDividerType dividerType;
  final double? _height;

  @override
  PAPContextMenuDividerState createState() => PAPContextMenuDividerState();
}

class PAPContextMenuDividerState extends State<PAPContextMenuDivider> {
  static const _menuLineDividerPadding = 15.0;
  static const _menuLineDividerHeight = 0.0;
  static const _menuSpaceDividerHeight = 4.0;

  @override
  Widget build(BuildContext context) {
    return widget.dividerType == PAPContextMenuDividerType.line
        ? _buildLineDivider()
        : _buildSpaceDivider();
  }

  Widget _buildLineDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _menuLineDividerPadding,
      ),
      child: PAPDivider.horizontal(
        height: widget._height ?? _menuLineDividerHeight,
      ),
    );
  }

  Widget _buildSpaceDivider() {
    return const SizedBox(
      height: _menuSpaceDividerHeight,
    );
  }
}
