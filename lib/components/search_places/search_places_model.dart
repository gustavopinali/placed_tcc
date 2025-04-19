import '/components/list_v_place/list_v_place_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_places_widget.dart' show SearchPlacesWidget;
import 'package:flutter/material.dart';

class SearchPlacesModel extends FlutterFlowModel<SearchPlacesWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> categoriesFilter = [];
  void addToCategoriesFilter(DocumentReference item) =>
      categoriesFilter.add(item);
  void removeFromCategoriesFilter(DocumentReference item) =>
      categoriesFilter.remove(item);
  void removeAtIndexFromCategoriesFilter(int index) =>
      categoriesFilter.removeAt(index);
  void insertAtIndexInCategoriesFilter(int index, DocumentReference item) =>
      categoriesFilter.insert(index, item);
  void updateCategoriesFilterAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      categoriesFilter[index] = updateFn(categoriesFilter[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for List_V_Place dynamic component.
  late FlutterFlowDynamicModels<ListVPlaceModel> listVPlaceModels;

  @override
  void initState(BuildContext context) {
    listVPlaceModels = FlutterFlowDynamicModels(() => ListVPlaceModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listVPlaceModels.dispose();
  }
}
