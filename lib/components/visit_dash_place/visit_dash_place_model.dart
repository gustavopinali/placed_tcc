import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visit_dash_place_widget.dart' show VisitDashPlaceWidget;
import 'package:flutter/material.dart';

class VisitDashPlaceModel extends FlutterFlowModel<VisitDashPlaceWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlaceBanner component.
  late PlaceBannerModel placeBannerModel;

  @override
  void initState(BuildContext context) {
    placeBannerModel = createModel(context, () => PlaceBannerModel());
  }

  @override
  void dispose() {
    placeBannerModel.dispose();
  }
}
