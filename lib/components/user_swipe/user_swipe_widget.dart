import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_swipe_model.dart';
export 'user_swipe_model.dart';

class UserSwipeWidget extends StatefulWidget {
  const UserSwipeWidget({
    super.key,
    required this.visit,
  });

  final VisitsRecord? visit;

  @override
  State<UserSwipeWidget> createState() => _UserSwipeWidgetState();
}

class _UserSwipeWidgetState extends State<UserSwipeWidget> {
  late UserSwipeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSwipeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
