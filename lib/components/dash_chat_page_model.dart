import '/components/chat/chat_widget.dart';
import '/components/user_card_min/user_card_min_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dash_chat_page_widget.dart' show DashChatPageWidget;
import 'package:flutter/material.dart';

class DashChatPageModel extends FlutterFlowModel<DashChatPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for UserCardMin dynamic component.
  late FlutterFlowDynamicModels<UserCardMinModel> userCardMinModels;
  // Model for Chat component.
  late ChatModel chatModel;

  @override
  void initState(BuildContext context) {
    userCardMinModels = FlutterFlowDynamicModels(() => UserCardMinModel());
    chatModel = createModel(context, () => ChatModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userCardMinModels.dispose();
    chatModel.dispose();
  }
}
