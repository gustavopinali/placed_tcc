import '/backend/backend.dart';
import '/components/usar_btn_like_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_card4_widget.dart' show UserProfileCard4Widget;
import 'package:flutter/material.dart';

class UserProfileCard4Model extends FlutterFlowModel<UserProfileCard4Widget> {
  ///  Local state fields for this component.

  bool userLiked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in UserProfileCard4 widget.
  UserLikesRecord? userLikedQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in UserProfileCard4 widget.
  UserLikesRecord? userLikedAuth;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for UsarBtnLike component.
  late UsarBtnLikeModel usarBtnLikeModel;

  @override
  void initState(BuildContext context) {
    usarBtnLikeModel = createModel(context, () => UsarBtnLikeModel());
  }

  @override
  void dispose() {
    usarBtnLikeModel.dispose();
  }
}
