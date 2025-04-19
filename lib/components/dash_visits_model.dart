import '/components/list_h_place2/list_h_place2_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dash_visits_widget.dart' show DashVisitsWidget;
import 'package:flutter/material.dart';

class DashVisitsModel extends FlutterFlowModel<DashVisitsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for List_H_Place2 dynamic component.
  late FlutterFlowDynamicModels<ListHPlace2Model> listHPlace2Models;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    listHPlace2Models = FlutterFlowDynamicModels(() => ListHPlace2Model());
  }

  @override
  void dispose() {
    listHPlace2Models.dispose();
  }
}
