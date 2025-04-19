import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_h_place_widget.dart' show ListHPlaceWidget;
import 'package:flutter/material.dart';

class ListHPlaceModel extends FlutterFlowModel<ListHPlaceWidget> {
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
