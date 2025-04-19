import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_icon_button_model.dart';
export 'category_icon_button_model.dart';

class CategoryIconButtonWidget extends StatefulWidget {
  const CategoryIconButtonWidget({
    super.key,
    required this.category,
    required this.active,
  });

  final CategoriesRecord? category;
  final bool? active;

  @override
  State<CategoryIconButtonWidget> createState() =>
      _CategoryIconButtonWidgetState();
}

class _CategoryIconButtonWidgetState extends State<CategoryIconButtonWidget> {
  late CategoryIconButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryIconButtonModel());

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
        if (widget.category?.code == 1) {
          return FlutterFlowIconButton(
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: FaIcon(
              FontAwesomeIcons.beer,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Bar_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 2) {
          return FlutterFlowIconButton(
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.restaurant,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Restaurant_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 3) {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Shopping_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 4) {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.stadium_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Stadium_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 5) {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.nightlife_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('NightClub_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 6) {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.coffee_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Cafe_IconButton pressed ...');
            },
          );
        } else if (widget.category?.code == 7) {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.forest,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Other_IconButton pressed ...');
            },
          );
        } else {
          return FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 10.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            fillColor: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).placedBlack,
            icon: Icon(
              Icons.place_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('Other_IconButton pressed ...');
            },
          );
        }
      },
    );
  }
}
