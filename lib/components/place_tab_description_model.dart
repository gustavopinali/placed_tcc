import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_tab_description_widget.dart' show PlaceTabDescriptionWidget;
import 'package:flutter/material.dart';

class PlaceTabDescriptionModel
    extends FlutterFlowModel<PlaceTabDescriptionWidget> {
  ///  Local state fields for this component.

  int tabIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
