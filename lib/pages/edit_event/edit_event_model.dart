import '/flutter_flow/flutter_flow_util.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  Local state fields for this page.

  List<String> postImages = ['false'];
  void addToPostImages(String item) => postImages.add(item);
  void removeFromPostImages(String item) => postImages.remove(item);
  void removeAtIndexFromPostImages(int index) => postImages.removeAt(index);
  void insertAtIndexInPostImages(int index, String item) =>
      postImages.insert(index, item);
  void updatePostImagesAtIndex(int index, Function(String) updateFn) =>
      postImages[index] = updateFn(postImages[index]);

  DateTime? eventStart;

  DateTime? eventEnd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
