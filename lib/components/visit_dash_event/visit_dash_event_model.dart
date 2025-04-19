import '/components/event_banner/event_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visit_dash_event_widget.dart' show VisitDashEventWidget;
import 'package:flutter/material.dart';

class VisitDashEventModel extends FlutterFlowModel<VisitDashEventWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EventBanner component.
  late EventBannerModel eventBannerModel;

  @override
  void initState(BuildContext context) {
    eventBannerModel = createModel(context, () => EventBannerModel());
  }

  @override
  void dispose() {
    eventBannerModel.dispose();
  }
}
