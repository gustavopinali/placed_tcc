import '/components/post_card_widget.dart';
import '/components/visit_profile_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_page02_widget.dart' show UserPage02Widget;
import 'package:flutter/material.dart';

class UserPage02Model extends FlutterFlowModel<UserPage02Widget> {
  ///  Local state fields for this component.

  int tabIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Models for VisitProfileCard dynamic component.
  late FlutterFlowDynamicModels<VisitProfileCardModel> visitProfileCardModels;
  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels;

  @override
  void initState(BuildContext context) {
    visitProfileCardModels =
        FlutterFlowDynamicModels(() => VisitProfileCardModel());
    postCardModels = FlutterFlowDynamicModels(() => PostCardModel());
  }

  @override
  void dispose() {
    visitProfileCardModels.dispose();
    postCardModels.dispose();
  }
}
