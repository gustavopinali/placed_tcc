import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_in_grid_widget.dart' show PostInGridWidget;
import 'package:flutter/material.dart';

class PostInGridModel extends FlutterFlowModel<PostInGridWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PostLikesRecord? likeOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
