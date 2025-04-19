import '/components/app_top_bar/app_top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_widget.dart' show DeleteAccountWidget;
import 'package:flutter/material.dart';

class DeleteAccountModel extends FlutterFlowModel<DeleteAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appTopBar component.
  late AppTopBarModel appTopBarModel;
  // State field(s) for TextField_Motivo widget.
  FocusNode? textFieldMotivoFocusNode;
  TextEditingController? textFieldMotivoTextController;
  String? Function(BuildContext, String?)?
      textFieldMotivoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    appTopBarModel = createModel(context, () => AppTopBarModel());
  }

  @override
  void dispose() {
    appTopBarModel.dispose();
    textFieldMotivoFocusNode?.dispose();
    textFieldMotivoTextController?.dispose();
  }
}
