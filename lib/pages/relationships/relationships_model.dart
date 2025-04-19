import '/components/relationship_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relationships_widget.dart' show RelationshipsWidget;
import 'package:flutter/material.dart';

class RelationshipsModel extends FlutterFlowModel<RelationshipsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RelationshipComp component.
  late RelationshipCompModel relationshipCompModel;

  @override
  void initState(BuildContext context) {
    relationshipCompModel = createModel(context, () => RelationshipCompModel());
  }

  @override
  void dispose() {
    relationshipCompModel.dispose();
  }
}
