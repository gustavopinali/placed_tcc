import '/components/post_in_grid/post_in_grid_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_tab_posts_widget.dart' show UserTabPostsWidget;
import 'package:flutter/material.dart';

class UserTabPostsModel extends FlutterFlowModel<UserTabPostsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for PostInGrid dynamic component.
  late FlutterFlowDynamicModels<PostInGridModel> postInGridModels;

  @override
  void initState(BuildContext context) {
    postInGridModels = FlutterFlowDynamicModels(() => PostInGridModel());
  }

  @override
  void dispose() {
    postInGridModels.dispose();
  }
}
