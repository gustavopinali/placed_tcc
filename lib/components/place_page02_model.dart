import '/components/place_objects_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_page02_widget.dart' show PlacePage02Widget;
import 'package:flutter/material.dart';

class PlacePage02Model extends FlutterFlowModel<PlacePage02Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlaceObjects component.
  late PlaceObjectsModel placeObjectsModel;

  @override
  void initState(BuildContext context) {
    placeObjectsModel = createModel(context, () => PlaceObjectsModel());
  }

  @override
  void dispose() {
    placeObjectsModel.dispose();
  }
}
