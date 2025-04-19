import '/flutter_flow/flutter_flow_util.dart';
import 'user_menu_widget.dart' show UserMenuWidget;
import 'package:flutter/material.dart';

class UserMenuModel extends FlutterFlowModel<UserMenuWidget> {
  ///  Local state fields for this component.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  DateTime? eventStart;

  DateTime? eventEnd;

  DocumentReference? eventPlaceRef;

  int eventImageCount = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
