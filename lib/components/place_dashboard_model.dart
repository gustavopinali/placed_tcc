import '/components/list_h_place2/list_h_place2_widget.dart';
import '/components/post_card_widget.dart';
import '/components/user_card100/user_card100_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_dashboard_widget.dart' show PlaceDashboardWidget;
import 'package:flutter/material.dart';

class PlaceDashboardModel extends FlutterFlowModel<PlaceDashboardWidget> {
  ///  Local state fields for this component.

  int tabIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Model for List_H_Place2 component.
  late ListHPlace2Model listHPlace2Model;
  // Models for userCard100 dynamic component.
  late FlutterFlowDynamicModels<UserCard100Model> userCard100Models;
  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels;

  @override
  void initState(BuildContext context) {
    listHPlace2Model = createModel(context, () => ListHPlace2Model());
    userCard100Models = FlutterFlowDynamicModels(() => UserCard100Model());
    postCardModels = FlutterFlowDynamicModels(() => PostCardModel());
  }

  @override
  void dispose() {
    listHPlace2Model.dispose();
    userCard100Models.dispose();
    postCardModels.dispose();
  }
}
