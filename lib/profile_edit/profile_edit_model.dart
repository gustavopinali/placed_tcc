import '/components/edit_user_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Models for EditUserImage dynamic component.
  late FlutterFlowDynamicModels<EditUserImageModel> editUserImageModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  final textFieldMask4 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked;
  // State field(s) for TextField_Bio widget.
  FocusNode? textFieldBioFocusNode;
  TextEditingController? textFieldBioTextController;
  String? Function(BuildContext, String?)? textFieldBioTextControllerValidator;
  // State field(s) for TextField_Whatsapp widget.
  FocusNode? textFieldWhatsappFocusNode;
  TextEditingController? textFieldWhatsappTextController;
  String? Function(BuildContext, String?)?
      textFieldWhatsappTextControllerValidator;
  // State field(s) for TextField_Instagram widget.
  FocusNode? textFieldInstagramFocusNode;
  TextEditingController? textFieldInstagramTextController;
  String? Function(BuildContext, String?)?
      textFieldInstagramTextControllerValidator;
  // State field(s) for TextField_Facebook widget.
  FocusNode? textFieldFacebookFocusNode;
  TextEditingController? textFieldFacebookTextController;
  String? Function(BuildContext, String?)?
      textFieldFacebookTextControllerValidator;
  // State field(s) for TextField_Twiter widget.
  FocusNode? textFieldTwiterFocusNode;
  TextEditingController? textFieldTwiterTextController;
  String? Function(BuildContext, String?)?
      textFieldTwiterTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    editUserImageModels = FlutterFlowDynamicModels(() => EditUserImageModel());
  }

  @override
  void dispose() {
    editUserImageModels.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldBioFocusNode?.dispose();
    textFieldBioTextController?.dispose();

    textFieldWhatsappFocusNode?.dispose();
    textFieldWhatsappTextController?.dispose();

    textFieldInstagramFocusNode?.dispose();
    textFieldInstagramTextController?.dispose();

    textFieldFacebookFocusNode?.dispose();
    textFieldFacebookTextController?.dispose();

    textFieldTwiterFocusNode?.dispose();
    textFieldTwiterTextController?.dispose();
  }
}
