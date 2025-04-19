import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_banner_home_model.dart';
export 'place_banner_home_model.dart';

class PlaceBannerHomeWidget extends StatefulWidget {
  const PlaceBannerHomeWidget({
    super.key,
    required this.place,
  });

  final PlacesRecord? place;

  @override
  State<PlaceBannerHomeWidget> createState() => _PlaceBannerHomeWidgetState();
}

class _PlaceBannerHomeWidgetState extends State<PlaceBannerHomeWidget> {
  late PlaceBannerHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceBannerHomeModel());

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
