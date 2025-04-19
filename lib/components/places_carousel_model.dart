import '/components/place_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'places_carousel_widget.dart' show PlacesCarouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlacesCarouselModel extends FlutterFlowModel<PlacesCarouselWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for PlaceCardBanner dynamic component.
  late FlutterFlowDynamicModels<PlaceCardBannerModel> placeCardBannerModels;

  @override
  void initState(BuildContext context) {
    placeCardBannerModels =
        FlutterFlowDynamicModels(() => PlaceCardBannerModel());
  }

  @override
  void dispose() {
    placeCardBannerModels.dispose();
  }
}
