import '/backend/backend.dart';
import '/components/user_card_banner_widget.dart';
import '/components/user_page02_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_tabs_page_model.dart';
export 'user_tabs_page_model.dart';

class UserTabsPageWidget extends StatefulWidget {
  const UserTabsPageWidget({
    super.key,
    required this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<UserTabsPageWidget> createState() => _UserTabsPageWidgetState();
}

class _UserTabsPageWidgetState extends State<UserTabsPageWidget>
    with TickerProviderStateMixin {
  late UserTabsPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserTabsPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _model.tabBarController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              wrapWithModel(
                model: _model.userCardBannerModel,
                updateCallback: () => safeSetState(() {}),
                child: UserCardBannerWidget(
                  userDoc: widget.userDoc!,
                ),
              ),
              wrapWithModel(
                model: _model.userPage02Model,
                updateCallback: () => safeSetState(() {}),
                child: UserPage02Widget(
                  userDoc: widget.userDoc!,
                  actionNavBack: () async {},
                  actionEditUser: () async {},
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '7v2guztr' /* Tab View 3 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 32.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(0.0, 0),
          child: TabBar(
            labelColor: FlutterFlowTheme.of(context).primary,
            unselectedLabelColor: FlutterFlowTheme.of(context).placedAlt,
            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
            unselectedLabelStyle: const TextStyle(),
            indicatorColor: FlutterFlowTheme.of(context).primary,
            padding: const EdgeInsets.all(4.0),
            tabs: [
              Tab(
                text: FFLocalizations.of(context).getText(
                  'ue00i5b5' /* Example 1 */,
                ),
              ),
              Tab(
                text: FFLocalizations.of(context).getText(
                  'a929xvc8' /* Example 2 */,
                ),
              ),
              Tab(
                text: FFLocalizations.of(context).getText(
                  'gdcbmq9z' /* Example 3 */,
                ),
              ),
            ],
            controller: _model.tabBarController,
            onTap: (i) async {
              [() async {}, () async {}, () async {}][i]();
            },
          ),
        ),
      ],
    );
  }
}
