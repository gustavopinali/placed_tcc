import '/components/user_page02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_widget.dart' show UserWidget;
import 'package:flutter/material.dart';

class UserModel extends FlutterFlowModel<UserWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserPage02 component.
  late UserPage02Model userPage02Model;

  @override
  void initState(BuildContext context) {
    userPage02Model = createModel(context, () => UserPage02Model());
  }

  @override
  void dispose() {
    userPage02Model.dispose();
  }
}
