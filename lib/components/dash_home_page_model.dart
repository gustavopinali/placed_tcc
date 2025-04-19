import '/backend/backend.dart';
import '/components/list_h_event/list_h_event_widget.dart';
import '/components/list_h_place2/list_h_place2_widget.dart';
import '/components/placed_ad_banner/placed_ad_banner_widget.dart';
import '/components/user_card_min/user_card_min_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dash_home_page_widget.dart' show DashHomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashHomePageModel extends FlutterFlowModel<DashHomePageWidget> {
  ///  State fields for stateful widgets in this component.

  Completer<List<UsersRecord>>? algoliaRequestCompleter3;
  bool algoliaRequestCompleted4 = false;
  String? algoliaRequestLastUniqueKey4;
  bool algoliaRequestCompleted1 = false;
  String? algoliaRequestLastUniqueKey1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool algoliaRequestCompleted2 = false;
  String? algoliaRequestLastUniqueKey2;
  // Models for UserCardMin dynamic component.
  late FlutterFlowDynamicModels<UserCardMinModel> userCardMinModels;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // Models for List_H_Place2 dynamic component.
  late FlutterFlowDynamicModels<ListHPlace2Model> listHPlace2Models1;
  // Models for List_H_Place2 dynamic component.
  late FlutterFlowDynamicModels<ListHPlace2Model> listHPlace2Models2;
  // Model for placedAdBanner component.
  late PlacedAdBannerModel placedAdBannerModel;
  // Models for List_H_Event dynamic component.
  late FlutterFlowDynamicModels<ListHEventModel> listHEventModels1;
  // State field(s) for Carousel widget.
  CarouselController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Models for List_H_Event dynamic component.
  late FlutterFlowDynamicModels<ListHEventModel> listHEventModels2;

  @override
  void initState(BuildContext context) {
    userCardMinModels = FlutterFlowDynamicModels(() => UserCardMinModel());
    listHPlace2Models1 = FlutterFlowDynamicModels(() => ListHPlace2Model());
    listHPlace2Models2 = FlutterFlowDynamicModels(() => ListHPlace2Model());
    placedAdBannerModel = createModel(context, () => PlacedAdBannerModel());
    listHEventModels1 = FlutterFlowDynamicModels(() => ListHEventModel());
    listHEventModels2 = FlutterFlowDynamicModels(() => ListHEventModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userCardMinModels.dispose();
    listHPlace2Models1.dispose();
    listHPlace2Models2.dispose();
    placedAdBannerModel.dispose();
    listHEventModels1.dispose();
    listHEventModels2.dispose();
  }

  /// Additional helper methods.
  Future waitForAlgoliaRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForAlgoliaRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleted4;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForAlgoliaRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForAlgoliaRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
