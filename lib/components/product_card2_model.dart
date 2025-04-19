import '/flutter_flow/flutter_flow_util.dart';
import 'product_card2_widget.dart' show ProductCard2Widget;
import 'package:flutter/material.dart';

class ProductCard2Model extends FlutterFlowModel<ProductCard2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
