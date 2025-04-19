import '/components/event_banner/event_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_h_event_widget.dart' show ListHEventWidget;
import 'package:flutter/material.dart';

class ListHEventModel extends FlutterFlowModel<ListHEventWidget> {
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
