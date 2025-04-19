import '/backend/backend.dart';
import '/components/user_banner/user_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_card_widget.dart' show UserProfileCardWidget;
import 'package:flutter/material.dart';

class UserProfileCardModel extends FlutterFlowModel<UserProfileCardWidget> {
  ///  Local state fields for this component.

  bool userLiked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in UserProfileCard widget.
  UserLikesRecord? userLikedQuery;
  // Model for UserBanner component.
  late UserBannerModel userBannerModel;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FriendshipsRecord? newFriendship;

  @override
  void initState(BuildContext context) {
    userBannerModel = createModel(context, () => UserBannerModel());
  }

  @override
  void dispose() {
    userBannerModel.dispose();
  }
}
