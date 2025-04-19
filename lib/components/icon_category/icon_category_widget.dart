import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'icon_category_model.dart';
export 'icon_category_model.dart';

class IconCategoryWidget extends StatefulWidget {
  const IconCategoryWidget({
    super.key,
    required this.categoryDoc,
    required this.iconColor,
    required this.iconSize,
    required this.iconColorActive,
    required this.active,
  });

  final CategoriesRecord? categoryDoc;
  final Color? iconColor;
  final int? iconSize;
  final Color? iconColorActive;
  final bool? active;

  @override
  State<IconCategoryWidget> createState() => _IconCategoryWidgetState();
}

class _IconCategoryWidgetState extends State<IconCategoryWidget> {
  late IconCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconCategoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.categoryDoc?.code == 1) {
          return Icon(
            FFIcons.kjuice,
            color: valueOrDefault<Color>(
              widget.active! ? widget.iconColorActive : widget.iconColor,
              FlutterFlowTheme.of(context).primaryText,
            ),
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 2) {
          return Icon(
            FFIcons.kdinner,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 3) {
          return Icon(
            FFIcons.kshoppingBasket,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 4) {
          return Icon(
            Icons.stadium_outlined,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 5) {
          return Icon(
            FFIcons.kmusic,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 6) {
          return Icon(
            FFIcons.kcoffeeCup,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else if (widget.categoryDoc?.code == 7) {
          return Icon(
            FFIcons.kgrow,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: widget.iconSize?.toDouble(),
          );
        } else {
          return Icon(
            Icons.circle,
            color:
                widget.active! ? widget.iconColorActive : widget.iconColor,
            size: valueOrDefault<double>(
              widget.iconSize?.toDouble(),
              25.0,
            ),
          );
        }
      },
    );
  }
}
