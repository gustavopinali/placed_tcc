import '/backend/backend.dart';
import '/components/user_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_pages_model.dart';
export 'user_pages_model.dart';

class UserPagesWidget extends StatefulWidget {
  const UserPagesWidget({
    super.key,
    required this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<UserPagesWidget> createState() => _UserPagesWidgetState();
}

class _UserPagesWidgetState extends State<UserPagesWidget> {
  late UserPagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: PageView(
        controller: _model.pageViewController ??=
            PageController(initialPage: 1),
        scrollDirection: Axis.vertical,
        children: [
          wrapWithModel(
            model: _model.userCardBannerModel,
            updateCallback: () => safeSetState(() {}),
            child: UserCardBannerWidget(
              userDoc: widget.userDoc!,
            ),
          ),
          Container(),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
        ],
      ),
    );
  }
}
