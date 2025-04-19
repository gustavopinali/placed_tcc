import '/components/user_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_carousel_widget.dart' show UsersCarouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UsersCarouselModel extends FlutterFlowModel<UsersCarouselWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for UserCardBanner.
  late FlutterFlowDynamicModels<UserCardBannerModel> userCardBannerModels;

  @override
  void initState(BuildContext context) {
    userCardBannerModels =
        FlutterFlowDynamicModels(() => UserCardBannerModel());
  }

  @override
  void dispose() {
    userCardBannerModels.dispose();
  }
}
