import '/components/gradient/gradient_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_banner_widget.dart' show PlaceBannerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlaceBannerModel extends FlutterFlowModel<PlaceBannerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

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
