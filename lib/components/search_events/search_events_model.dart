import '/backend/backend.dart';
import '/components/list_event/list_event_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'search_events_widget.dart' show SearchEventsWidget;
import 'package:flutter/material.dart';

class SearchEventsModel extends FlutterFlowModel<SearchEventsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<EventsRecord>>? algoliaRequestCompleter;
  // Models for List_Event dynamic component.
  late FlutterFlowDynamicModels<ListEventModel> listEventModels;

  @override
  void initState(BuildContext context) {
    listEventModels = FlutterFlowDynamicModels(() => ListEventModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listEventModels.dispose();
  }

  /// Additional helper methods.
  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
