import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_tab_settings_model.dart';
export 'profile_tab_settings_model.dart';

class ProfileTabSettingsWidget extends StatefulWidget {
  const ProfileTabSettingsWidget({super.key});

  @override
  State<ProfileTabSettingsWidget> createState() =>
      _ProfileTabSettingsWidgetState();
}

class _ProfileTabSettingsWidgetState extends State<ProfileTabSettingsWidget> {
  late ProfileTabSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTabSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }
}
