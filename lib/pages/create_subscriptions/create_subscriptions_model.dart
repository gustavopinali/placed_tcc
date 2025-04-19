import '/backend/backend.dart';
import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_subscriptions_widget.dart' show CreateSubscriptionsWidget;
import 'package:flutter/material.dart';

class CreateSubscriptionsModel
    extends FlutterFlowModel<CreateSubscriptionsWidget> {
  ///  Local state fields for this page.

  PlacesRecord? selectedPlaceDoc;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for PlaceBanner dynamic component.
  late FlutterFlowDynamicModels<PlaceBannerModel> placeBannerModels;

  @override
  void initState(BuildContext context) {
    placeBannerModels = FlutterFlowDynamicModels(() => PlaceBannerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    placeBannerModels.dispose();
  }
}
