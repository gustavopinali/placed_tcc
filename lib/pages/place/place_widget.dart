import '/backend/backend.dart';
import '/components/dash_new_post_widget.dart';
import '/components/place_dashboard_widget.dart';
import '/components/place_menu_page/place_menu_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_model.dart';
export 'place_model.dart';

class PlaceWidget extends StatefulWidget {
  const PlaceWidget({
    super.key,
    this.placeRef,
  });

  final DocumentReference? placeRef;

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  late PlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Place'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlacesRecord>(
      stream: PlacesRecord.getDocument(widget.placeRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final placePlacesRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 1),
                scrollDirection: Axis.horizontal,
                children: [
                  wrapWithModel(
                    model: _model.dashNewPostModel,
                    updateCallback: () => safeSetState(() {}),
                    child: DashNewPostWidget(
                      actionPageRight: () async {},
                    ),
                  ),
                  wrapWithModel(
                    model: _model.placeDashboardModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PlaceDashboardWidget(
                      placeDoc: placePlacesRecord,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.placeMenuPageModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PlaceMenuPageWidget(
                      placeDoc: placePlacesRecord,
                      actionBack: () async {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
