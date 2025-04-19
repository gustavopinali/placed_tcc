import '/backend/backend.dart';
import '/components/user_card100/user_card100_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_user_friends_widget.dart' show ChatUserFriendsWidget;
import 'package:flutter/material.dart';

class ChatUserFriendsModel extends FlutterFlowModel<ChatUserFriendsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ChatUserFriends widget.
  List<FriendshipsRecord>? friendshipList;
  // Models for userCard100 dynamic component.
  late FlutterFlowDynamicModels<UserCard100Model> userCard100Models;

  @override
  void initState(BuildContext context) {
    userCard100Models = FlutterFlowDynamicModels(() => UserCard100Model());
  }

  @override
  void dispose() {
    userCard100Models.dispose();
  }
}
