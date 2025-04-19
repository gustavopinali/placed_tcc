import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'placed_top_bar_place_model.dart';
export 'placed_top_bar_place_model.dart';

class PlacedTopBarPlaceWidget extends StatefulWidget {
  const PlacedTopBarPlaceWidget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlacedTopBarPlaceWidget> createState() =>
      _PlacedTopBarPlaceWidgetState();
}

class _PlacedTopBarPlaceWidgetState extends State<PlacedTopBarPlaceWidget> {
  late PlacedTopBarPlaceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacedTopBarPlaceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 36.0, 24.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.klogotipo1,
                        color: FlutterFlowTheme.of(context).accent2,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: FlutterFlowTheme.of(context).placedWhite,
                      size: 24.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 0.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).placedWhite,
                      icon: Icon(
                        Icons.favorite_border,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(const SizedBox(width: 12.0)),
                ),
              ].divide(const SizedBox(width: 24.0)),
            ),
          ],
        ),
      ),
    );
  }
}
