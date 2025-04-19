import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_user_change_username_widget.dart'
    show AuthUserChangeUsernameWidget;
import 'package:flutter/material.dart';

class AuthUserChangeUsernameModel
    extends FlutterFlowModel<AuthUserChangeUsernameWidget> {
  ///  Local state fields for this component.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  DocumentReference? placeRef;

  DocumentReference? eventRef;

  DocumentReference? visitRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jo7m0b8t' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'ghmy6okc' /* Minimo de 5 caracteres */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        '2qv7nrtd' /* Maximo de 20 caracteres */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3b4t8i1p' /* Username já existe ou invalido */,
      );
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? checkUsername;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
