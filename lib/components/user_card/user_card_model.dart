import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'user_card_widget.dart' show UserCardWidget;
import 'package:flutter/material.dart';

class UserCardModel extends FlutterFlowModel<UserCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Query cache managers for this widget.

  final _userCardImagesManager = StreamRequestManager<List<UserImagesRecord>>();
  Stream<List<UserImagesRecord>> userCardImages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserImagesRecord>> Function() requestFn,
  }) =>
      _userCardImagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCardImagesCache() => _userCardImagesManager.clear();
  void clearUserCardImagesCacheKey(String? uniqueKey) =>
      _userCardImagesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearUserCardImagesCache();
  }
}
