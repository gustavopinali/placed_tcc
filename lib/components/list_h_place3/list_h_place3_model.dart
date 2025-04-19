import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_h_place3_widget.dart' show ListHPlace3Widget;
import 'package:flutter/material.dart';

class ListHPlace3Model extends FlutterFlowModel<ListHPlace3Widget> {
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
