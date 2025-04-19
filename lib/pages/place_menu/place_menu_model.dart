import '/backend/backend.dart';
import '/components/place_menu_page/place_menu_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_menu_widget.dart' show PlaceMenuWidget;
import 'package:flutter/material.dart';

class PlaceMenuModel extends FlutterFlowModel<PlaceMenuWidget> {
  ///  Local state fields for this page.

  bool visitsInGrid = true;

  bool menuInGrid = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PlaceMenu widget.
  VisitsRecord? activeVisit;
  // Model for PlaceMenuPage component.
  late PlaceMenuPageModel placeMenuPageModel;

  @override
  void initState(BuildContext context) {
    placeMenuPageModel = createModel(context, () => PlaceMenuPageModel());
  }

  @override
  void dispose() {
    placeMenuPageModel.dispose();
  }
}
