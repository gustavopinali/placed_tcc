import '/flutter_flow/flutter_flow_util.dart';
import 'user_swipe_images_widget.dart' show UserSwipeImagesWidget;
import 'package:flutter/material.dart';

class UserSwipeImagesModel extends FlutterFlowModel<UserSwipeImagesWidget> {
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
