import '/flutter_flow/flutter_flow_util.dart';
import 'profile_tabs_widget.dart' show ProfileTabsWidget;
import 'package:flutter/material.dart';

class ProfileTabsModel extends FlutterFlowModel<ProfileTabsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
