import '/components/list_h_event/list_h_event_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_confirmed_events_widget.dart' show UserConfirmedEventsWidget;
import 'package:flutter/material.dart';

class UserConfirmedEventsModel
    extends FlutterFlowModel<UserConfirmedEventsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for List_H_Event dynamic component.
  late FlutterFlowDynamicModels<ListHEventModel> listHEventModels;

  @override
  void initState(BuildContext context) {
    listHEventModels = FlutterFlowDynamicModels(() => ListHEventModel());
  }

  @override
  void dispose() {
    listHEventModels.dispose();
  }
}
