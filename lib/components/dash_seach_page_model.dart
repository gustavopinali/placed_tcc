import '/components/search_events/search_events_widget.dart';
import '/components/search_places/search_places_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dash_seach_page_widget.dart' show DashSeachPageWidget;
import 'package:flutter/material.dart';

class DashSeachPageModel extends FlutterFlowModel<DashSeachPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for SearchPlaces component.
  late SearchPlacesModel searchPlacesModel;
  // Model for SearchEvents component.
  late SearchEventsModel searchEventsModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    searchPlacesModel = createModel(context, () => SearchPlacesModel());
    searchEventsModel = createModel(context, () => SearchEventsModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    searchPlacesModel.dispose();
    searchEventsModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
