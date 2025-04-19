import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'visit_model.dart';
export 'visit_model.dart';

class VisitWidget extends StatefulWidget {
  const VisitWidget({super.key});

  @override
  State<VisitWidget> createState() => _VisitWidgetState();
}

class _VisitWidgetState extends State<VisitWidget> {
  late VisitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Visit'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.activeVisit = await queryVisitsRecordOnce(
        queryBuilder: (visitsRecord) => visitsRecord
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
