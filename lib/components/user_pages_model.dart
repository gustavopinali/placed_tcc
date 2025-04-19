import '/components/user_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_pages_widget.dart' show UserPagesWidget;
import 'package:flutter/material.dart';

class UserPagesModel extends FlutterFlowModel<UserPagesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for UserCardBanner component.
  late UserCardBannerModel userCardBannerModel;

  @override
  void initState(BuildContext context) {
    userCardBannerModel = createModel(context, () => UserCardBannerModel());
  }

  @override
  void dispose() {
    userCardBannerModel.dispose();
  }
}
