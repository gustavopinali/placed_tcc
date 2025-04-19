import '/backend/backend.dart';
import '/components/product_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_menu_page_widget.dart' show PlaceMenuPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlaceMenuPageModel extends FlutterFlowModel<PlaceMenuPageWidget> {
  ///  Local state fields for this component.

  int viewState = 0;

  StripeProductsRecord? selectedProduct;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Models for productCard dynamic component.
  late FlutterFlowDynamicModels<ProductCardModel> productCardModels;

  @override
  void initState(BuildContext context) {
    productCardModels = FlutterFlowDynamicModels(() => ProductCardModel());
  }

  @override
  void dispose() {
    productCardModels.dispose();
  }
}
