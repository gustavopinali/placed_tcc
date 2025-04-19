import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'placed_access_bar_model.dart';
export 'placed_access_bar_model.dart';

class PlacedAccessBarWidget extends StatefulWidget {
  const PlacedAccessBarWidget({
    super.key,
    required this.currentVisit,
  });

  final VisitsRecord? currentVisit;

  @override
  State<PlacedAccessBarWidget> createState() => _PlacedAccessBarWidgetState();
}

class _PlacedAccessBarWidgetState extends State<PlacedAccessBarWidget> {
  late PlacedAccessBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacedAccessBarModel());

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
