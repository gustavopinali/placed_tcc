import '/backend/backend.dart';
import '/components/place_objects_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_page02_model.dart';
export 'place_page02_model.dart';

class PlacePage02Widget extends StatefulWidget {
  const PlacePage02Widget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlacePage02Widget> createState() => _PlacePage02WidgetState();
}

class _PlacePage02WidgetState extends State<PlacePage02Widget> {
  late PlacePage02Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacePage02Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Expanded(
            child: wrapWithModel(
              model: _model.placeObjectsModel,
              updateCallback: () => safeSetState(() {}),
              child: PlaceObjectsWidget(
                placeDoc: widget.placeDoc!,
              ),
            ),
          ),
        ].divide(const SizedBox(height: 6.0)).around(const SizedBox(height: 6.0)),
      ),
    );
  }
}
