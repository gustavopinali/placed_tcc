import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/place_menu_page/place_menu_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'place_menu_model.dart';
export 'place_menu_model.dart';

class PlaceMenuWidget extends StatefulWidget {
  const PlaceMenuWidget({
    super.key,
    this.placeRef,
  });

  final DocumentReference? placeRef;

  @override
  State<PlaceMenuWidget> createState() => _PlaceMenuWidgetState();
}

class _PlaceMenuWidgetState extends State<PlaceMenuWidget> {
  late PlaceMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceMenuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlaceMenu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.activeVisit = await queryVisitsRecordOnce(
        queryBuilder: (visitsRecord) => visitsRecord
            .where(
              'placeRef',
              isEqualTo: widget.placeRef,
            )
            .where(
              'userRef',
              isEqualTo: currentUserReference,
            )
            .where(
              'checkIn',
              isEqualTo: true,
            )
            .where(
              'checkOut',
              isEqualTo: false,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.activeVisit != null) {
        await _model.activeVisit!.reference.update({
          ...mapToFirestore(
            {
              'checkList': FieldValue.arrayUnion([getCurrentTimestamp]),
            },
          ),
        });
      }
    });

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

        final placeMenuPlacesRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: wrapWithModel(
            model: _model.placeMenuPageModel,
            updateCallback: () => safeSetState(() {}),
            child: PlaceMenuPageWidget(
              placeDoc: placeMenuPlacesRecord,
              actionBack: () async {},
            ),
          ),
        );
      },
    );
  }
}
