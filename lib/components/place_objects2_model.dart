import '/components/post_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_objects2_widget.dart' show PlaceObjects2Widget;
import 'package:flutter/material.dart';

class PlaceObjects2Model extends FlutterFlowModel<PlaceObjects2Widget> {
  ///  Local state fields for this component.

  int index = 0;

  ///  State fields for stateful widgets in this component.

  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels;

  @override
  void initState(BuildContext context) {
    postCardModels = FlutterFlowDynamicModels(() => PostCardModel());
  }

  @override
  void dispose() {
    postCardModels.dispose();
  }
}
