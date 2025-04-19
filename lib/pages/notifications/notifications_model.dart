import '/components/notification_in_list/notification_in_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for NotificationInList dynamic component.
  late FlutterFlowDynamicModels<NotificationInListModel>
      notificationInListModels1;
  // Models for NotificationInList dynamic component.
  late FlutterFlowDynamicModels<NotificationInListModel>
      notificationInListModels2;

  @override
  void initState(BuildContext context) {
    notificationInListModels1 =
        FlutterFlowDynamicModels(() => NotificationInListModel());
    notificationInListModels2 =
        FlutterFlowDynamicModels(() => NotificationInListModel());
  }

  @override
  void dispose() {
    notificationInListModels1.dispose();
    notificationInListModels2.dispose();
  }
}
