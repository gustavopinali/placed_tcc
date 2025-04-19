import '/components/gradient/gradient_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_banner_widget.dart' show UserBannerWidget;
import 'package:flutter/material.dart';

class UserBannerModel extends FlutterFlowModel<UserBannerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Gradient component.
  late GradientModel gradientModel;

  @override
  void initState(BuildContext context) {
    gradientModel = createModel(context, () => GradientModel());
  }

  @override
  void dispose() {
    gradientModel.dispose();
  }
}
