import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_tabs_widget.dart' show UserProfileTabsWidget;
import 'package:flutter/material.dart';

class UserProfileTabsModel extends FlutterFlowModel<UserProfileTabsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for Post dynamic component.
  late FlutterFlowDynamicModels<PostModel> postModels;

  @override
  void initState(BuildContext context) {
    postModels = FlutterFlowDynamicModels(() => PostModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    postModels.dispose();
  }
}
