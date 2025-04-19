import '/components/dash_chat_page_widget.dart';
import '/components/dash_homepage_widget.dart';
import '/components/dash_new_post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for DashNewPost component.
  late DashNewPostModel dashNewPostModel;
  // Model for DashHomepage component.
  late DashHomepageModel dashHomepageModel;
  // Model for DashChatPage component.
  late DashChatPageModel dashChatPageModel;

  @override
  void initState(BuildContext context) {
    dashNewPostModel = createModel(context, () => DashNewPostModel());
    dashHomepageModel = createModel(context, () => DashHomepageModel());
    dashChatPageModel = createModel(context, () => DashChatPageModel());
  }

  @override
  void dispose() {
    dashNewPostModel.dispose();
    dashHomepageModel.dispose();
    dashChatPageModel.dispose();
  }
}
