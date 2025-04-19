import '/components/user_card_banner_widget.dart';
import '/components/user_page02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_tabs_page_widget.dart' show UserTabsPageWidget;
import 'package:flutter/material.dart';

class UserTabsPageModel extends FlutterFlowModel<UserTabsPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for UserCardBanner component.
  late UserCardBannerModel userCardBannerModel;
  // Model for UserPage02 component.
  late UserPage02Model userPage02Model;

  @override
  void initState(BuildContext context) {
    userCardBannerModel = createModel(context, () => UserCardBannerModel());
    userPage02Model = createModel(context, () => UserPage02Model());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userCardBannerModel.dispose();
    userPage02Model.dispose();
  }
}
