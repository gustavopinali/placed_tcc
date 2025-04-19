import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:flutter/material.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
  ///  Local state fields for this page.

  AddressStruct? eventAddress;
  void updateEventAddressStruct(Function(AddressStruct) updateFn) {
    updateFn(eventAddress ??= AddressStruct());
  }

  List<String> eventImages = [];
  void addToEventImages(String item) => eventImages.add(item);
  void removeFromEventImages(String item) => eventImages.remove(item);
  void removeAtIndexFromEventImages(int index) => eventImages.removeAt(index);
  void insertAtIndexInEventImages(int index, String item) =>
      eventImages.insert(index, item);
  void updateEventImagesAtIndex(int index, Function(String) updateFn) =>
      eventImages[index] = updateFn(eventImages[index]);

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '36cbvr5p' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b1nblp59' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField_EventStart widget.
  FocusNode? textFieldEventStartFocusNode;
  TextEditingController? textFieldEventStartTextController;
  String? Function(BuildContext, String?)?
      textFieldEventStartTextControllerValidator;
  String? _textFieldEventStartTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vszfgmdi' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for TextField_EventEnd widget.
  FocusNode? textFieldEventEndFocusNode;
  TextEditingController? textFieldEventEndTextController;
  String? Function(BuildContext, String?)?
      textFieldEventEndTextControllerValidator;
  String? _textFieldEventEndTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd1n3lbbp' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Stores action output result for [Backend Call - API (Get By LatLong)] action in IconButton widget.
  ApiCallResponse? aPIGeocoding;
  // State field(s) for TextField_PlaceName widget.
  FocusNode? textFieldPlaceNameFocusNode;
  TextEditingController? textFieldPlaceNameTextController;
  String? Function(BuildContext, String?)?
      textFieldPlaceNameTextControllerValidator;
  // State field(s) for TextField_PostalCode widget.
  FocusNode? textFieldPostalCodeFocusNode;
  TextEditingController? textFieldPostalCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldPostalCodeTextControllerValidator;
  // State field(s) for TextField_Address widget.
  FocusNode? textFieldAddressFocusNode;
  TextEditingController? textFieldAddressTextController;
  String? Function(BuildContext, String?)?
      textFieldAddressTextControllerValidator;
  // State field(s) for TextField_Complement widget.
  FocusNode? textFieldComplementFocusNode;
  TextEditingController? textFieldComplementTextController;
  String? Function(BuildContext, String?)?
      textFieldComplementTextControllerValidator;
  // State field(s) for TextField_District widget.
  FocusNode? textFieldDistrictFocusNode;
  TextEditingController? textFieldDistrictTextController;
  String? Function(BuildContext, String?)?
      textFieldDistrictTextControllerValidator;
  // State field(s) for TextField_City widget.
  FocusNode? textFieldCityFocusNode;
  TextEditingController? textFieldCityTextController;
  String? Function(BuildContext, String?)? textFieldCityTextControllerValidator;
  // State field(s) for TextField_State widget.
  FocusNode? textFieldStateFocusNode;
  TextEditingController? textFieldStateTextController;
  String? Function(BuildContext, String?)?
      textFieldStateTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textFieldEventStartTextControllerValidator =
        _textFieldEventStartTextControllerValidator;
    textFieldEventEndTextControllerValidator =
        _textFieldEventEndTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldEventStartFocusNode?.dispose();
    textFieldEventStartTextController?.dispose();

    textFieldEventEndFocusNode?.dispose();
    textFieldEventEndTextController?.dispose();

    textFieldPlaceNameFocusNode?.dispose();
    textFieldPlaceNameTextController?.dispose();

    textFieldPostalCodeFocusNode?.dispose();
    textFieldPostalCodeTextController?.dispose();

    textFieldAddressFocusNode?.dispose();
    textFieldAddressTextController?.dispose();

    textFieldComplementFocusNode?.dispose();
    textFieldComplementTextController?.dispose();

    textFieldDistrictFocusNode?.dispose();
    textFieldDistrictTextController?.dispose();

    textFieldCityFocusNode?.dispose();
    textFieldCityTextController?.dispose();

    textFieldStateFocusNode?.dispose();
    textFieldStateTextController?.dispose();
  }
}
