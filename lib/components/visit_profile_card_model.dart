import '/components/event_banner/event_banner_widget.dart';
import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visit_profile_card_widget.dart' show VisitProfileCardWidget;
import 'package:flutter/material.dart';

class VisitProfileCardModel extends FlutterFlowModel<VisitProfileCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlaceBanner component.
  late PlaceBannerModel placeBannerModel;
  // Model for EventBanner component.
  late EventBannerModel eventBannerModel;

  @override
  void initState(BuildContext context) {
    placeBannerModel = createModel(context, () => PlaceBannerModel());
    eventBannerModel = createModel(context, () => EventBannerModel());
  }

  @override
  void dispose() {
    placeBannerModel.dispose();
    eventBannerModel.dispose();
  }
}
