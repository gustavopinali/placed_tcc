import '/components/place_menu_page/place_menu_page_widget.dart';
import '/components/place_page01_widget.dart';
import '/components/place_page02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_page_widget.dart' show PlacePageWidget;
import 'package:flutter/material.dart';

class PlacePageModel extends FlutterFlowModel<PlacePageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for PlacePage01 component.
  late PlacePage01Model placePage01Model;
  // Model for PlacePage02 component.
  late PlacePage02Model placePage02Model;
  // Model for PlaceMenuPage component.
  late PlaceMenuPageModel placeMenuPageModel;

  @override
  void initState(BuildContext context) {
    placePage01Model = createModel(context, () => PlacePage01Model());
    placePage02Model = createModel(context, () => PlacePage02Model());
    placeMenuPageModel = createModel(context, () => PlaceMenuPageModel());
  }

  @override
  void dispose() {
    placePage01Model.dispose();
    placePage02Model.dispose();
    placeMenuPageModel.dispose();
  }
}
