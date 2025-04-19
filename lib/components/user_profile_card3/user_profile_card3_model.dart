import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_card3_widget.dart' show UserProfileCard3Widget;
import 'package:flutter/material.dart';

class UserProfileCard3Model extends FlutterFlowModel<UserProfileCard3Widget> {
  ///  Local state fields for this component.

  bool userLiked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in UserProfileCard3 widget.
  UserLikesRecord? userLikedQuery;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FriendshipsRecord? newFriendship;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
