import '/components/app_top_bar/app_top_bar_widget.dart';
import '/components/chat/chat_widget.dart';
import '/components/user_card_min/user_card_min_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_main_widget.dart' show ChatMainWidget;
import 'package:flutter/material.dart';

class ChatMainModel extends FlutterFlowModel<ChatMainWidget> {
  ///  Local state fields for this page.

  String? searchLikes;

  String? searchFriends;

  ///  State fields for stateful widgets in this page.

  // Model for appTopBar component.
  late AppTopBarModel appTopBarModel;
  // Models for UserCardMin dynamic component.
  late FlutterFlowDynamicModels<UserCardMinModel> userCardMinModels;
  // Model for Chat component.
  late ChatModel chatModel;

  @override
  void initState(BuildContext context) {
    appTopBarModel = createModel(context, () => AppTopBarModel());
    userCardMinModels = FlutterFlowDynamicModels(() => UserCardMinModel());
    chatModel = createModel(context, () => ChatModel());
  }

  @override
  void dispose() {
    appTopBarModel.dispose();
    userCardMinModels.dispose();
    chatModel.dispose();
  }
}
