import '/components/gradient/gradient_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_banner_widget.dart' show EventBannerWidget;
import 'package:flutter/material.dart';

class EventBannerModel extends FlutterFlowModel<EventBannerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Gradient component.
  late GradientModel gradientModel1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for Gradient dynamic component.
  late FlutterFlowDynamicModels<GradientModel> gradientModels2;

  @override
  void initState(BuildContext context) {
    gradientModel1 = createModel(context, () => GradientModel());
    gradientModels2 = FlutterFlowDynamicModels(() => GradientModel());
  }

  @override
  void dispose() {
    gradientModel1.dispose();
    gradientModels2.dispose();
  }
}
