import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_filter_widget.dart' show SearchFilterWidget;
import 'package:flutter/material.dart';

class SearchFilterModel extends FlutterFlowModel<SearchFilterWidget> {
  ///  Local state fields for this component.

  GoogleSeachLocationStruct? dataSearch;
  void updateDataSearchStruct(Function(GoogleSeachLocationStruct) updateFn) {
    updateFn(dataSearch ??= GoogleSeachLocationStruct());
  }

  LatLng? selectedLocation;

  String selectedAddress = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
