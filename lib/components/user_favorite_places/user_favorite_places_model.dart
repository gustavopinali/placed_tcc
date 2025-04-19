import '/components/list_h_place/list_h_place_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_favorite_places_widget.dart' show UserFavoritePlacesWidget;
import 'package:flutter/material.dart';

class UserFavoritePlacesModel
    extends FlutterFlowModel<UserFavoritePlacesWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for List_H_Place dynamic component.
  late FlutterFlowDynamicModels<ListHPlaceModel> listHPlaceModels;

  @override
  void initState(BuildContext context) {
    listHPlaceModels = FlutterFlowDynamicModels(() => ListHPlaceModel());
  }

  @override
  void dispose() {
    listHPlaceModels.dispose();
  }
}
