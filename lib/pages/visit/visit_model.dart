import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visit_widget.dart' show VisitWidget;
import 'package:flutter/material.dart';

class VisitModel extends FlutterFlowModel<VisitWidget> {
  ///  Local state fields for this page.

  bool visitsInGrid = true;

  bool menuInGrid = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Visit widget.
  VisitsRecord? activeVisit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
