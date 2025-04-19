import '/backend/backend.dart';
import '/components/user_banner/user_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_card2_widget.dart' show UserProfileCard2Widget;
import 'package:flutter/material.dart';

class UserProfileCard2Model extends FlutterFlowModel<UserProfileCard2Widget> {
  ///  Local state fields for this component.

  bool userLiked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in UserProfileCard2 widget.
  UserLikesRecord? userLikedQuery;
  // Model for UserBanner component.
  late UserBannerModel userBannerModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
