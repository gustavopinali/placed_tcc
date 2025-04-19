import '/flutter_flow/flutter_flow_util.dart';
import 'post_comment_list_widget.dart' show PostCommentListWidget;
import 'package:flutter/material.dart';

class PostCommentListModel extends FlutterFlowModel<PostCommentListWidget> {
  ///  Local state fields for this component.

  DocumentReference? postRef;

  bool showComments = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
