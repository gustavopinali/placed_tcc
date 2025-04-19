import '/components/dash_new_post_widget.dart';
import '/components/place_dashboard_widget.dart';
import '/components/place_menu_page/place_menu_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_widget.dart' show PlaceWidget;
import 'package:flutter/material.dart';

class PlaceModel extends FlutterFlowModel<PlaceWidget> {
  ///  Local state fields for this page.

  bool visitsInGrid = true;

  bool menuInGrid = false;

  int dashIndex = 0;

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
  // Model for PlaceDashboard component.
  late PlaceDashboardModel placeDashboardModel;
  // Model for PlaceMenuPage component.
  late PlaceMenuPageModel placeMenuPageModel;

  @override
  void initState(BuildContext context) {
    dashNewPostModel = createModel(context, () => DashNewPostModel());
    placeDashboardModel = createModel(context, () => PlaceDashboardModel());
    placeMenuPageModel = createModel(context, () => PlaceMenuPageModel());
  }

  @override
  void dispose() {
    dashNewPostModel.dispose();
    placeDashboardModel.dispose();
    placeMenuPageModel.dispose();
  }
}
