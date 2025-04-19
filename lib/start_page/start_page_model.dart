import '/components/have_acount_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_page_widget.dart' show StartPageWidget;
import 'package:flutter/material.dart';

class StartPageModel extends FlutterFlowModel<StartPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HaveAcountText component.
  late HaveAcountTextModel haveAcountTextModel;

  @override
  void initState(BuildContext context) {
    haveAcountTextModel = createModel(context, () => HaveAcountTextModel());
  }

  @override
  void dispose() {
    haveAcountTextModel.dispose();
  }
}
