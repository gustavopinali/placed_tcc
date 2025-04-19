import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relationship_comp_widget.dart' show RelationshipCompWidget;
import 'package:flutter/material.dart';

class RelationshipCompModel extends FlutterFlowModel<RelationshipCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for UserCard dynamic component.
  late FlutterFlowDynamicModels<UserCardModel> userCardModels1;
  // Models for UserCard dynamic component.
  late FlutterFlowDynamicModels<UserCardModel> userCardModels2;
  // Models for UserCard dynamic component.
  late FlutterFlowDynamicModels<UserCardModel> userCardModels3;

  @override
  void initState(BuildContext context) {
    userCardModels1 = FlutterFlowDynamicModels(() => UserCardModel());
    userCardModels2 = FlutterFlowDynamicModels(() => UserCardModel());
    userCardModels3 = FlutterFlowDynamicModels(() => UserCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userCardModels1.dispose();
    userCardModels2.dispose();
    userCardModels3.dispose();
  }
}
