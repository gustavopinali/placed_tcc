import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dash_home_page_widget.dart';
import '/components/dash_seach_page_widget.dart';
import '/components/dash_visits_widget.dart';
import '/components/placed_top_bar_widget.dart';
import '/components/user_page02_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dash_homepage_model.dart';
export 'dash_homepage_model.dart';

class DashHomepageWidget extends StatefulWidget {
  const DashHomepageWidget({
    super.key,
    this.actionPageLeft,
    this.actionPageRight,
  });

  final Future Function()? actionPageLeft;
  final Future Function()? actionPageRight;

  @override
  State<DashHomepageWidget> createState() => _DashHomepageWidgetState();
}

class _DashHomepageWidgetState extends State<DashHomepageWidget>
    with TickerProviderStateMixin {
  late DashHomepageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashHomepageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
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
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.placedTopBarModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: PlacedTopBarWidget(
              actionUpdateLocation: () async {
                await Future.wait([
                  Future(() async {
                    FFAppState().clearPlacedPlacesCache();
                  }),
                  Future(() async {
                    FFAppState().clearPlacedEventsCache();
                  }),
                ]);
              },
              actionPageRight: () async {
                await widget.actionPageRight?.call();
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => wrapWithModel(
                            model: _model.dashMainPageModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const DashHomePageWidget(),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => wrapWithModel(
                            model: _model.dashSeachPageModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const DashSeachPageWidget(
                              parameter1: 0,
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => wrapWithModel(
                            model: _model.dashVisitsPageModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const DashVisitsWidget(),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => StreamBuilder<UsersRecord>(
                            stream:
                                UsersRecord.getDocument(currentUserReference!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final dashUserPageUsersRecord = snapshot.data!;

                              return wrapWithModel(
                                model: _model.dashUserPageModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: UserPage02Widget(
                                  userDoc: dashUserPageUsersRecord,
                                  showButtons: false,
                                  actionNavBack: () async {},
                                  actionEditUser: () async {},
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                      unselectedLabelStyle: const TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      unselectedBackgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      borderWidth: 1.0,
                      borderRadius: 0.0,
                      elevation: 0.0,
                      labelPadding: const EdgeInsets.all(6.0),
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      tabs: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FFIcons.kgridAlt,
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '1hyubyjb' /*  */,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FFIcons.ksearch,
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'igpofn7k' /*  */,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FFIcons.kmapMarker,
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'rgph31wx' /*  */,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'ybqz7lwc' /*  */,
                              ),
                            ),
                          ],
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                          () async {},
                          () async {},
                          () async {},
                          () async {}
                        ][i]();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
