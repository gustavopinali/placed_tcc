import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_new_event_widget.dart' show FormNewEventWidget;
import 'package:flutter/material.dart';

class FormNewEventModel extends FlutterFlowModel<FormNewEventWidget> {
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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField_Name widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rqzhbnq1' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for TextField_Description widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionTextControllerValidator;
  String? _textFieldDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zk4g5ge4' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for TextField_Start widget.
  FocusNode? textFieldStartFocusNode;
  TextEditingController? textFieldStartTextController;
  String? Function(BuildContext, String?)?
      textFieldStartTextControllerValidator;
  String? _textFieldStartTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wzp5ogdr' /* Campo obrigatório */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for TextField_End widget.
  FocusNode? textFieldEndFocusNode;
  TextEditingController? textFieldEndTextController;
  String? Function(BuildContext, String?)? textFieldEndTextControllerValidator;
  String? _textFieldEndTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '054hhsm1' /* Campo obrigatório */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsRecord? newEvent;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldDescriptionTextControllerValidator =
        _textFieldDescriptionTextControllerValidator;
    textFieldStartTextControllerValidator =
        _textFieldStartTextControllerValidator;
    textFieldEndTextControllerValidator = _textFieldEndTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionTextController?.dispose();

    textFieldStartFocusNode?.dispose();
    textFieldStartTextController?.dispose();

    textFieldEndFocusNode?.dispose();
    textFieldEndTextController?.dispose();
  }
}
