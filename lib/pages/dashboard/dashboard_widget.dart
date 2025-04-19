import '/components/dash_chat_page_widget.dart';
import '/components/dash_homepage_widget.dart';
import '/components/dash_new_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: PageView(
            controller: _model.pageViewController ??=
                PageController(initialPage: 1),
            scrollDirection: Axis.horizontal,
            children: [
              wrapWithModel(
                model: _model.dashNewPostModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: DashNewPostWidget(
                  actionPageRight: () async {
                    await _model.pageViewController?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              wrapWithModel(
                model: _model.dashHomepageModel,
                updateCallback: () => safeSetState(() {}),
                child: DashHomepageWidget(
                  actionPageLeft: () async {
                    await _model.pageViewController?.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  actionPageRight: () async {
                    await _model.pageViewController?.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              wrapWithModel(
                model: _model.dashChatPageModel,
                updateCallback: () => safeSetState(() {}),
                child: const DashChatPageWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
