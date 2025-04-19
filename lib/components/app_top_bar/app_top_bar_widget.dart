import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_top_bar_model.dart';
export 'app_top_bar_model.dart';

class AppTopBarWidget extends StatefulWidget {
  const AppTopBarWidget({super.key});

  @override
  State<AppTopBarWidget> createState() => _AppTopBarWidgetState();
}

class _AppTopBarWidgetState extends State<AppTopBarWidget> {
  late AppTopBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTopBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 6.0, 12.0, 6.0),
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Dashboard');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      FFIcons.klogotipo1,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[].divide(const SizedBox(width: 20.0)),
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      if (loggedIn) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (!isWeb)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var shouldSetState = false;
                                    _model.qrcodeData =
                                        await FlutterBarcodeScanner.scanBarcode(
                                      '#C62828', // scanning line color
                                      FFLocalizations.of(context).getText(
                                        'sp0x6xji' /* Cancel */,
                                      ), // cancel button text
                                      true, // whether to show the flash icon
                                      ScanMode.QR,
                                    );

                                    shouldSetState = true;
                                    if (functions.qrcodeToPlaceRef(
                                            _model.qrcodeData) !=
                                        null) {
                                      context.pushNamed(
                                        'Place',
                                        pathParameters: {
                                          'placeRef': serializeParam(
                                            functions.qrcodeToPlaceRef(
                                                _model.qrcodeData),
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (functions.qrcodeToEventRef(
                                              _model.qrcodeData) !=
                                          null) {
                                        context.pushNamed(
                                          'Event',
                                          pathParameters: {
                                            'eventRef': serializeParam(
                                              functions.qrcodeToEventRef(
                                                  _model.qrcodeData),
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      } else {
                                        await launchURL(_model.qrcodeData);
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }
                                    }

                                    if (shouldSetState) safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.qr_code,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Notifications');
                              },
                              child: Stack(
                                alignment: const AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child:
                                        FutureBuilder<List<FriendshipsRecord>>(
                                      future: queryFriendshipsRecordOnce(
                                        queryBuilder: (friendshipsRecord) =>
                                            friendshipsRecord
                                                .where(
                                                  'userRequested',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'active',
                                                  isEqualTo: true,
                                                )
                                                .where(
                                                  'accepted',
                                                  isEqualTo: false,
                                                ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 10.0,
                                              height: 10.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .transparent0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<FriendshipsRecord>
                                            conditionalBuilderFriendshipsRecordList =
                                            snapshot.data!;
                                        final conditionalBuilderFriendshipsRecord =
                                            conditionalBuilderFriendshipsRecordList
                                                    .isNotEmpty
                                                ? conditionalBuilderFriendshipsRecordList
                                                    .first
                                                : null;

                                        return Builder(
                                          builder: (context) {
                                            if (conditionalBuilderFriendshipsRecord !=
                                                null) {
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 10.0,
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: FutureBuilder<
                                                    List<
                                                        UserNotificationsRecord>>(
                                                  future:
                                                      queryUserNotificationsRecordOnce(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (userNotificationsRecord) =>
                                                            userNotificationsRecord
                                                                .where(
                                                      'viewed',
                                                      isEqualTo: false,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .transparent5,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UserNotificationsRecord>
                                                        conditionalBuilderUserNotificationsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final conditionalBuilderUserNotificationsRecord =
                                                        conditionalBuilderUserNotificationsRecordList
                                                                .isNotEmpty
                                                            ? conditionalBuilderUserNotificationsRecordList
                                                                .first
                                                            : null;

                                                    return Builder(
                                                      builder: (context) {
                                                        if (conditionalBuilderUserNotificationsRecord !=
                                                            null) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 10.0,
                                                            ),
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child:
                                                                FutureBuilder<
                                                                    int>(
                                                              future:
                                                                  queryEventInvitedUsersRecordCount(
                                                                queryBuilder:
                                                                    (eventInvitedUsersRecord) =>
                                                                        eventInvitedUsersRecord
                                                                            .where(
                                                                              'userRef',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'answered',
                                                                              isNotEqualTo: true,
                                                                            ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .transparent5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                int conditionalBuilderCount =
                                                                    snapshot
                                                                        .data!;

                                                                return Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (conditionalBuilderCount >
                                                                        0) {
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              10.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Opacity(
                                                                        opacity:
                                                                            0.0,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                10.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Profile');
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .placedBlack,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  getCORSProxyUrl(
                                                    currentUserPhoto,
                                                  ),
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration:
                                                      const Duration(milliseconds: 0),
                                                  fadeOutDuration:
                                                      const Duration(milliseconds: 0),
                                                  imageUrl: getCORSProxyUrl(
                                                    currentUserPhoto,
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ].divide(const SizedBox(width: 5.0)),
                        );
                      } else {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('LogIn');
                              },
                              text: FFLocalizations.of(context).getText(
                                'jidklu5b' /* Login */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
