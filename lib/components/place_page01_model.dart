import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_page01_widget.dart' show PlacePage01Widget;
import 'package:flutter/material.dart';

class PlacePage01Model extends FlutterFlowModel<PlacePage01Widget> {
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
