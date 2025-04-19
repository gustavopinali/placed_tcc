import '/components/post_in_grid/post_in_grid_widget.dart';
import '/components/usar_btn_like_widget.dart';
import '/components/user_profile_card/user_profile_card_widget.dart';
import '/components/user_profile_card2/user_profile_card2_widget.dart';
import '/components/user_profile_card3/user_profile_card3_widget.dart';
import '/components/user_profile_card4/user_profile_card4_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  Local state fields for this component.

  int contentTab = 0;

  bool userLiked = false;

  ///  State fields for stateful widgets in this component.

  // Model for UserProfileCard component.
  late UserProfileCardModel userProfileCardModel;
  // Model for UserProfileCard2 component.
  late UserProfileCard2Model userProfileCard2Model;
  // Model for UserProfileCard3 component.
  late UserProfileCard3Model userProfileCard3Model;
  // Model for UserProfileCard4 component.
  late UserProfileCard4Model userProfileCard4Model;
  // Model for UsarBtnLike component.
  late UsarBtnLikeModel usarBtnLikeModel;
  // Models for PostInGrid dynamic component.
  late FlutterFlowDynamicModels<PostInGridModel> postInGridModels;

  @override
  void initState(BuildContext context) {
    userProfileCardModel = createModel(context, () => UserProfileCardModel());
    userProfileCard2Model = createModel(context, () => UserProfileCard2Model());
    userProfileCard3Model = createModel(context, () => UserProfileCard3Model());
    userProfileCard4Model = createModel(context, () => UserProfileCard4Model());
    usarBtnLikeModel = createModel(context, () => UsarBtnLikeModel());
    postInGridModels = FlutterFlowDynamicModels(() => PostInGridModel());
  }

  @override
  void dispose() {
    userProfileCardModel.dispose();
    userProfileCard2Model.dispose();
    userProfileCard3Model.dispose();
    userProfileCard4Model.dispose();
    usarBtnLikeModel.dispose();
    postInGridModels.dispose();
  }
}
