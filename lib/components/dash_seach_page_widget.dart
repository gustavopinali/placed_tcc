import '/components/search_events/search_events_widget.dart';
import '/components/search_places/search_places_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dash_seach_page_model.dart';
export 'dash_seach_page_model.dart';

class DashSeachPageWidget extends StatefulWidget {
  const DashSeachPageWidget({
    super.key,
    int? parameter1,
  }) : parameter1 = parameter1 ?? 0;

  final int parameter1;

  @override
  State<DashSeachPageWidget> createState() => _DashSeachPageWidgetState();
}

class _DashSeachPageWidgetState extends State<DashSeachPageWidget>
    with TickerProviderStateMixin {
  late DashSeachPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashSeachPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            widget.parameter1,
            0,
          ),
          2),
    )..addListener(() => safeSetState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                    model: _model.searchPlacesModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: const SearchPlacesWidget(),
                  ),
                ),
                KeepAliveWidgetWrapper(
                  builder: (context) => wrapWithModel(
                    model: _model.searchEventsModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: const SearchEventsWidget(),
                  ),
                ),
                KeepAliveWidgetWrapper(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'z9x42nru' /* Produtos */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 25.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Poppins'),
                                              ),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 10.0,
                                        ),
                                      ].divide(const SizedBox(width: 5.0)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          textInputAction:
                                              TextInputAction.search,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'defdlpu3' /* Buscar Produtos... */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            suffixIcon: const Icon(
                                              Icons.search,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 15.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: MasonryGridView.builder(
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: valueOrDefault<int>(
                                MediaQuery.sizeOf(context).width >
                                        kBreakpointLarge
                                    ? 2
                                    : 1,
                                1,
                              ),
                            ),
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                            itemCount: 0,
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              100.0,
                            ),
                            itemBuilder: (context, index) {
                              return [][index]();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0),
            child: FlutterFlowButtonTabBar(
              useToggleButtonStyle: true,
              labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleMediumFamily),
                  ),
              unselectedLabelStyle: FlutterFlowTheme.of(context)
                  .titleMedium
                  .override(
                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleMediumFamily),
                  ),
              labelColor: FlutterFlowTheme.of(context).primary,
              unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              unselectedBackgroundColor:
                  FlutterFlowTheme.of(context).primaryBackground,
              borderWidth: 0.0,
              borderRadius: 0.0,
              elevation: 0.0,
              tabs: [
                Tab(
                  text: FFLocalizations.of(context).getText(
                    'vny0o0tx' /* Locais */,
                  ),
                  icon: const Icon(
                    Icons.place_outlined,
                  ),
                  iconMargin:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                ),
                Tab(
                  text: FFLocalizations.of(context).getText(
                    'frlc210s' /* Eventos */,
                  ),
                  icon: const Icon(
                    Icons.calendar_month,
                  ),
                  iconMargin:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                ),
                Tab(
                  text: FFLocalizations.of(context).getText(
                    'w1ojotpv' /* Produtos */,
                  ),
                  icon: const Icon(
                    Icons.fastfood_outlined,
                  ),
                  iconMargin:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                ),
              ],
              controller: _model.tabBarController,
              onTap: (i) async {
                [() async {}, () async {}, () async {}][i]();
              },
            ),
          ),
        ],
      ),
    );
  }
}
