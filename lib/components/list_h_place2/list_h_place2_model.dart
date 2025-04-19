import '/components/place_banner/place_banner_widget.dart';
import '/components/place_icon_like_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_h_place2_widget.dart' show ListHPlace2Widget;
import 'package:flutter/material.dart';

class ListHPlace2Model extends FlutterFlowModel<ListHPlace2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlaceBanner component.
  late PlaceBannerModel placeBannerModel;
  // Model for PlaceIconLike component.
  late PlaceIconLikeModel placeIconLikeModel;

  @override
  void initState(BuildContext context) {
    placeBannerModel = createModel(context, () => PlaceBannerModel());
    placeIconLikeModel = createModel(context, () => PlaceIconLikeModel());
  }

  @override
  void dispose() {
    placeBannerModel.dispose();
    placeIconLikeModel.dispose();
  }
}
