import '/flutter_flow/flutter_flow_util.dart';
import 'user_banner_min_widget.dart' show UserBannerMinWidget;
import 'package:flutter/material.dart';

class UserBannerMinModel extends FlutterFlowModel<UserBannerMinWidget> {
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
