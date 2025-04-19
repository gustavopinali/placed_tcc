import '/components/list_event/list_event_widget.dart';
import '/components/list_v_place/list_v_place_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_tab_visits_widget.dart' show ProfileTabVisitsWidget;
import 'package:flutter/material.dart';

class ProfileTabVisitsModel extends FlutterFlowModel<ProfileTabVisitsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for List_V_Place dynamic component.
  late FlutterFlowDynamicModels<ListVPlaceModel> listVPlaceModels;
  // Models for List_Event dynamic component.
  late FlutterFlowDynamicModels<ListEventModel> listEventModels;

  @override
  void initState(BuildContext context) {
    listVPlaceModels = FlutterFlowDynamicModels(() => ListVPlaceModel());
    listEventModels = FlutterFlowDynamicModels(() => ListEventModel());
  }

  @override
  void dispose() {
    listVPlaceModels.dispose();
    listEventModels.dispose();
  }
}
