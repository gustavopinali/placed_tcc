import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/list_h_event/list_h_event_widget.dart';
import '/components/list_h_place2/list_h_place2_widget.dart';
import '/components/placed_ad_banner/placed_ad_banner_widget.dart';
import '/components/user_card_min/user_card_min_widget.dart';
import '/components/users_carousel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dash_home_page_model.dart';
export 'dash_home_page_model.dart';

class DashHomePageWidget extends StatefulWidget {
  const DashHomePageWidget({super.key});

  @override
  State<DashHomePageWidget> createState() => _DashHomePageWidgetState();
}

class _DashHomePageWidgetState extends State<DashHomePageWidget> {
  late DashHomePageModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashHomePageModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
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
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: RefreshIndicator(
          color: FlutterFlowTheme.of(context).primary,
          onRefresh: () async {
            safeSetState(() => _model.algoliaRequestCompleter3 = null);
            await _model.waitForAlgoliaRequestCompleted3();
            safeSetState(() => _model.algoliaRequestCompleter3 = null);
            safeSetState(() {
              FFAppState().clearPlacedEventsCache();
              _model.algoliaRequestCompleted4 = false;
            });
            safeSetState(() {
              FFAppState().clearPlacedEventsCache();
              _model.algoliaRequestCompleted1 = false;
            });
            await _model.waitForAlgoliaRequestCompleted1();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'zt23ke3p' /* Descubra seu
 */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Poppins'),
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'bzbmlzj4' /* Proximo destino */,
                              ),
                              style: const TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 20.0,
                                      color: Color(0x0E000000),
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      safeSetState(() {
                                        FFAppState().clearPlacedPlacesCache();
                                        _model.algoliaRequestCompleted2 = false;
                                      });
                                      await _model
                                          .waitForAlgoliaRequestCompleted2();
                                      FFAppState().clearPlacedPlacesCache();
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'g7ta2prt' /* Busque por restaurantes, event... */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.search_rounded,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Poppins'),
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 12.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.filter_list_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                              await Future.wait([
                                Future(() async {
                                  FFAppState().clearPlacedPlacesCache();
                                  safeSetState(() {
                                    FFAppState().clearPlacedPlacesCache();
                                    _model.algoliaRequestCompleted2 = false;
                                  });
                                }),
                                Future(() async {
                                  FFAppState().clearPlacedEventsCache();
                                  safeSetState(() {
                                    FFAppState().clearPlacedEventsCache();
                                    _model.algoliaRequestCompleted4 = false;
                                  });
                                }),
                              ]);
                            },
                          ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                    ].divide(const SizedBox(height: 20.0)),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                28.0, 6.0, 16.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6o3rsup8' /* Usuários proxímos */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Poppins'),
                                          ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                    ))
                                      Icon(
                                        Icons.circle_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 10.0,
                                      ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                                if (loggedIn)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Relationships');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '74ob8op3' /* Todos */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Poppins'),
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().clearPlacedUsersCache();
                                          safeSetState(() => _model
                                              .algoliaRequestCompleter3 = null);
                                          await _model
                                              .waitForAlgoliaRequestCompleted3();
                                        },
                                        child: Icon(
                                          Icons.refresh_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                              ],
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            if (loggedIn) {
                              return FutureBuilder<List<UsersRecord>>(
                                future: (_model.algoliaRequestCompleter3 ??=
                                        Completer<List<UsersRecord>>()
                                          ..complete(UsersRecord.search(
                                            location:
                                                FFAppState().customLocation
                                                    ? FFAppState()
                                                        .customLocationLatLng
                                                    : currentUserLocationValue,
                                            maxResults: 50,
                                            searchRadiusMeters: 50000000.0,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord>
                                      containerUsersUsersRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80.0),
                                                    ),
                                                    child: Container(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .placedBlack,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            getCORSProxyUrl(
                                                              currentUserPhoto,
                                                            ),
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Container(
                                                              width: 24.0,
                                                              height: 24.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final user =
                                                  containerUsersUsersRecordList
                                                      .where((e) =>
                                                          e.reference !=
                                                          currentUserReference)
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: user.length,
                                                itemBuilder:
                                                    (context, userIndex) {
                                                  final userItem =
                                                      user[userIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UsersCarouselWidget(
                                                                    userRef:
                                                                        userItem
                                                                            .reference,
                                                                    index:
                                                                        userIndex,
                                                                    usersDocList: containerUsersUsersRecordList
                                                                        .where((e) =>
                                                                            e.reference !=
                                                                            currentUserReference)
                                                                        .toList(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          onDoubleTap:
                                                              () async {
                                                            context.pushNamed(
                                                              'User',
                                                              pathParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  userItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .userCardMinModels
                                                                .getModel(
                                                              userItem
                                                                  .reference.id,
                                                              userIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                UserCardMinWidget(
                                                              key: Key(
                                                                'Key0vy_${userItem.reference.id}',
                                                              ),
                                                              userDoc: userItem,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ].addToStart(const SizedBox(width: 24.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('LogIn');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'uyy1uwwj' /* Realize o login para visualiza... */,
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
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '4xvs31io' /* Locais proxímos */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Poppins'),
                                      ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.circle_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().clearPlacedPlacesCache();
                                    safeSetState(() {
                                      FFAppState().clearPlacedPlacesCache();
                                      _model.algoliaRequestCompleted2 = false;
                                    });
                                    await _model
                                        .waitForAlgoliaRequestCompleted2();
                                  },
                                  child: Icon(
                                    Icons.refresh_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().clearPlacedPlacesCache();
                                    safeSetState(() {
                                      FFAppState().clearPlacedPlacesCache();
                                      _model.algoliaRequestCompleted2 = false;
                                    });
                                    await _model
                                        .waitForAlgoliaRequestCompleted2();
                                  },
                                  child: Icon(
                                    Icons.keyboard_control_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                      ),
                      FutureBuilder<List<PlacesRecord>>(
                        future: FFAppState()
                            .placedPlaces(
                          overrideCache: true,
                          requestFn: () => PlacesRecord.search(
                            term: _model.textController.text,
                            location: FFAppState().customLocation
                                ? FFAppState().customLocationLatLng
                                : currentUserLocationValue,
                            maxResults: 200,
                            searchRadiusMeters: functions
                                .getSearchRadius(FFAppState().searchDistance)
                                .toDouble(),
                          ),
                        )
                            .then((result) {
                          _model.algoliaRequestCompleted2 = true;
                          return result;
                        }),
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
                          List<PlacesRecord> containerPlacesPlacesRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Builder(
                                    builder: (context) {
                                      final placeDoc =
                                          containerPlacesPlacesRecordList
                                              .where((e) =>
                                                  e.placeImages.isNotEmpty)
                                              .toList();

                                      return SizedBox(
                                        width: double.infinity,
                                        height: 400.0,
                                        child: CarouselSlider.builder(
                                          itemCount: placeDoc.length,
                                          itemBuilder:
                                              (context, placeDocIndex, _) {
                                            final placeDocItem =
                                                placeDoc[placeDocIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 6.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 20.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          2.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Place',
                                                        pathParameters: {
                                                          'placeRef':
                                                              serializeParam(
                                                            placeDocItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listHPlace2Models1
                                                          .getModel(
                                                        placeDocItem
                                                            .reference.id,
                                                        placeDocIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ListHPlace2Widget(
                                                        key: Key(
                                                          'Keyvw1_${placeDocItem.reference.id}',
                                                        ),
                                                        placeDoc: placeDocItem,
                                                        pageView: false,
                                                        link: false,
                                                        showVisits: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0, min(1, placeDoc.length - 1)),
                                            viewportFraction: 0.85,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: false,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex1 = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Container(
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final placeDocWeb =
                                            containerPlacesPlacesRecordList
                                                .toList();

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            24.0,
                                            0,
                                            24.0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: placeDocWeb.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(width: 12.0),
                                          itemBuilder:
                                              (context, placeDocWebIndex) {
                                            final placeDocWebItem =
                                                placeDocWeb[placeDocWebIndex];
                                            return wrapWithModel(
                                              model: _model.listHPlace2Models2
                                                  .getModel(
                                                placeDocWebItem.reference.id,
                                                placeDocWebIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ListHPlace2Widget(
                                                key: Key(
                                                  'Keys7a_${placeDocWebItem.reference.id}',
                                                ),
                                                placeDoc: placeDocWebItem,
                                                pageView: false,
                                                link: true,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ]
                        .divide(const SizedBox(height: 12.0))
                        .around(const SizedBox(height: 12.0)),
                  ),
                ),
                wrapWithModel(
                  model: _model.placedAdBannerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PlacedAdBannerWidget(),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'umr0b8py' /* Eventos proxímos */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Poppins'),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().clearPlacedEventsCache();
                                      safeSetState(() {
                                        FFAppState().clearPlacedEventsCache();
                                        _model.algoliaRequestCompleted4 = false;
                                      });
                                      await _model
                                          .waitForAlgoliaRequestCompleted4();
                                    },
                                    child: Icon(
                                      Icons.refresh_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Container(
                            width: double.infinity,
                            height: 270.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 6.0),
                              child: FutureBuilder<List<EventsRecord>>(
                                future: FFAppState()
                                    .placedEvents(
                                  requestFn: () => EventsRecord.search(
                                    location: FFAppState().customLocation
                                        ? FFAppState().customLocationLatLng
                                        : currentUserLocationValue,
                                    searchRadiusMeters: functions
                                        .getSearchRadius(
                                            FFAppState().searchDistance)
                                        .toDouble(),
                                  ),
                                )
                                    .then((result) {
                                  _model.algoliaRequestCompleted4 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<EventsRecord>
                                      listViewEventsEventsRecordList =
                                      snapshot.data!;
                                  // Customize what your widget looks like with no search results.
                                  if (snapshot.data!.isEmpty) {
                                    return const SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: Text('No results.'),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      20.0,
                                      0,
                                      50.0,
                                      0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewEventsEventsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 0.0),
                                    itemBuilder:
                                        (context, listViewEventsIndex) {
                                      final listViewEventsEventsRecord =
                                          listViewEventsEventsRecordList[
                                              listViewEventsIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: wrapWithModel(
                                          model:
                                              _model.listHEventModels1.getModel(
                                            listViewEventsEventsRecord
                                                .reference.id,
                                            listViewEventsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ListHEventWidget(
                                            key: Key(
                                              'Key1ip_${listViewEventsEventsRecord.reference.id}',
                                            ),
                                            eventDoc:
                                                listViewEventsEventsRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        FutureBuilder<List<EventsRecord>>(
                          future: FFAppState()
                              .placedEvents(
                            requestFn: () => EventsRecord.search(
                              location: FFAppState().customLocation
                                  ? FFAppState().customLocationLatLng
                                  : currentUserLocationValue,
                              searchRadiusMeters: functions
                                  .getSearchRadius(FFAppState().searchDistance)
                                  .toDouble(),
                            ),
                          )
                              .then((result) {
                            _model.algoliaRequestCompleted1 = true;
                            return result;
                          }),
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
                            List<EventsRecord> carouselEventsRecordList =
                                snapshot.data!;
                            // Customize what your widget looks like with no search results.
                            if (snapshot.data!.isEmpty) {
                              return const SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text('No results.'),
                                ),
                              );
                            }
                            return SizedBox(
                              width: double.infinity,
                              height: 350.0,
                              child: CarouselSlider.builder(
                                itemCount: carouselEventsRecordList.length,
                                itemBuilder: (context, carouselIndex, _) {
                                  final carouselEventsRecord =
                                      carouselEventsRecordList[carouselIndex];
                                  return wrapWithModel(
                                    model: _model.listHEventModels2.getModel(
                                      carouselEventsRecord.reference.id,
                                      carouselIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListHEventWidget(
                                      key: Key(
                                        'Key3jl_${carouselEventsRecord.reference.id}',
                                      ),
                                      eventDoc: carouselEventsRecord,
                                    ),
                                  );
                                },
                                carouselController:
                                    _model.carouselController2 ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage: max(
                                      0,
                                      min(1,
                                          carouselEventsRecordList.length - 1)),
                                  viewportFraction: 0.85,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex2 = index,
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .around(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 12.0))
                  .addToStart(const SizedBox(height: 12.0))
                  .addToEnd(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
