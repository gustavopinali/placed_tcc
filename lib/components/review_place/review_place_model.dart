import '/flutter_flow/flutter_flow_util.dart';
import 'review_place_widget.dart' show ReviewPlaceWidget;
import 'package:flutter/material.dart';

class ReviewPlaceModel extends FlutterFlowModel<ReviewPlaceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
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
