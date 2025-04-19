import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dash_user_next_widget.dart' show DashUserNextWidget;
import 'package:flutter/material.dart';

class DashUserNextModel extends FlutterFlowModel<DashUserNextWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> userList = [];
  void addToUserList(UsersRecord item) => userList.add(item);
  void removeFromUserList(UsersRecord item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, UsersRecord item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(UsersRecord) updateFn) =>
      userList[index] = updateFn(userList[index]);

  ///  State fields for stateful widgets in this component.

  // Algolia Search Results from action on DashUserNext
  List<UsersRecord>? algoliaSearchResults = [];
  bool algoliaRequestCompleted = false;
  String? algoliaRequestLastUniqueKey;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
