import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_complaint_widget.dart' show NewComplaintWidget;
import 'package:flutter/material.dart';

class NewComplaintModel extends FlutterFlowModel<NewComplaintWidget> {
  ///  Local state fields for this component.

  DocumentReference? postRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_newComment widget.
  FocusNode? textFieldNewCommentFocusNode;
  TextEditingController? textFieldNewCommentTextController;
  String? Function(BuildContext, String?)?
      textFieldNewCommentTextControllerValidator;
  String? _textFieldNewCommentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xdc7ms6u' /* Campo obrigatório */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ComplaintsRecord? newComplain;

  @override
  void initState(BuildContext context) {
    textFieldNewCommentTextControllerValidator =
        _textFieldNewCommentTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNewCommentFocusNode?.dispose();
    textFieldNewCommentTextController?.dispose();
  }
}
