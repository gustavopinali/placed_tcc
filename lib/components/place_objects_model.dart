import '/backend/backend.dart';
import '/components/post_card_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_objects_widget.dart' show PlaceObjectsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PlaceObjectsModel extends FlutterFlowModel<PlaceObjectsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, PostsRecord>? gridViewPagingController1;
  Query? gridViewPagingQuery1;
  List<StreamSubscription?> gridViewStreamSubscriptions1 = [];

  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels1;
  // State field(s) for StaggeredView widget.

  PagingController<DocumentSnapshot?, PostsRecord>?
      staggeredViewPagingController;
  Query? staggeredViewPagingQuery;
  List<StreamSubscription?> staggeredViewStreamSubscriptions = [];

  // Models for PostCard dynamic component.
  late FlutterFlowDynamicModels<PostCardModel> postCardModels2;
  // Models for UserCard dynamic component.
  late FlutterFlowDynamicModels<UserCardModel> userCardModels;

  @override
  void initState(BuildContext context) {
    postCardModels1 = FlutterFlowDynamicModels(() => PostCardModel());
    postCardModels2 = FlutterFlowDynamicModels(() => PostCardModel());
    userCardModels = FlutterFlowDynamicModels(() => UserCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    for (var s in gridViewStreamSubscriptions1) {
      s?.cancel();
    }
    gridViewPagingController1?.dispose();

    postCardModels1.dispose();
    for (var s in staggeredViewStreamSubscriptions) {
      s?.cancel();
    }
    staggeredViewPagingController?.dispose();

    postCardModels2.dispose();
    userCardModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostsRecord> setGridViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController1 ??= _createGridViewController1(query, parent);
    if (gridViewPagingQuery1 != query) {
      gridViewPagingQuery1 = query;
      gridViewPagingController1?.refresh();
    }
    return gridViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, PostsRecord> _createGridViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions1,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, PostsRecord> setStaggeredViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    staggeredViewPagingController ??=
        _createStaggeredViewController(query, parent);
    if (staggeredViewPagingQuery != query) {
      staggeredViewPagingQuery = query;
      staggeredViewPagingController?.refresh();
    }
    return staggeredViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PostsRecord>
      _createStaggeredViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: staggeredViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
