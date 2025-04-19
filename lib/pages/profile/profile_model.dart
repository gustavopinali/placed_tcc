import '/components/dash_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserAuthProfile.
  late DashProfileModel userAuthProfileModel;

  @override
  void initState(BuildContext context) {
    userAuthProfileModel = createModel(context, () => DashProfileModel());
  }

  @override
  void dispose() {
    userAuthProfileModel.dispose();
  }
}
