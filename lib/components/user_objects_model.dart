import '/backend/backend.dart';
import '/components/post_card_widget.dart';
import '/components/user_visit_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_objects_widget.dart' show UserObjectsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserObjectsModel extends FlutterFlowModel<UserObjectsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, VisitReviewsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Models for UserVisitCard dynamic component.
  late FlutterFlowDynamicModels<UserVisitCardModel> userVisitCardModels;

  @override
  void initState(BuildContext context) {
    postCardModels = FlutterFlowDynamicModels(() => PostCardModel());
    userVisitCardModels = FlutterFlowDynamicModels(() => UserVisitCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    postCardModels.dispose();
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();

    userVisitCardModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, VisitReviewsRecord>
      setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, VisitReviewsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, VisitReviewsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryVisitReviewsRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
