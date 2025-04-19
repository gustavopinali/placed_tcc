import '/components/dash_home_page_widget.dart';
import '/components/dash_seach_page_widget.dart';
import '/components/dash_visits_widget.dart';
import '/components/placed_top_bar_widget.dart';
import '/components/user_page02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dash_homepage_widget.dart' show DashHomepageWidget;
import 'package:flutter/material.dart';

class DashHomepageModel extends FlutterFlowModel<DashHomepageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlacedTopBar component.
  late PlacedTopBarModel placedTopBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for DashMainPage.
  late DashHomePageModel dashMainPageModel;
  // Model for DashSeachPage component.
  late DashSeachPageModel dashSeachPageModel;
  // Model for DashVisitsPage.
  late DashVisitsModel dashVisitsPageModel;
  // Model for DashUserPage.
  late UserPage02Model dashUserPageModel;

  @override
  void initState(BuildContext context) {
    placedTopBarModel = createModel(context, () => PlacedTopBarModel());
    dashMainPageModel = createModel(context, () => DashHomePageModel());
    dashSeachPageModel = createModel(context, () => DashSeachPageModel());
    dashVisitsPageModel = createModel(context, () => DashVisitsModel());
    dashUserPageModel = createModel(context, () => UserPage02Model());
  }

  @override
  void dispose() {
    placedTopBarModel.dispose();
    tabBarController?.dispose();
    dashMainPageModel.dispose();
    dashSeachPageModel.dispose();
    dashVisitsPageModel.dispose();
    dashUserPageModel.dispose();
  }
}
