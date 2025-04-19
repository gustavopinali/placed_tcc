import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_in_list_model.dart';
export 'notification_in_list_model.dart';

class NotificationInListWidget extends StatefulWidget {
  const NotificationInListWidget({
    super.key,
    required this.userNotificationDoc,
  });

  final UserNotificationsRecord? userNotificationDoc;

  @override
  State<NotificationInListWidget> createState() =>
      _NotificationInListWidgetState();
}

class _NotificationInListWidgetState extends State<NotificationInListWidget> {
  late NotificationInListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationInListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.userNotificationDoc!.reference.update({
        ...createUserNotificationsRecordData(
          viewed: true,
        ),
        ...mapToFirestore(
          {
            'viewedAt': FieldValue.serverTimestamp(),
          },
        ),
      });
    });

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
      width: 500.0,
      height: 100.0,
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget.userNotificationDoc?.hasUserRef() ?? false) {
            return StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(
                  widget.userNotificationDoc!.userRef!),
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

                final containerUsersRecord = snapshot.data!;

                return Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'User',
                                pathParameters: {
                                  'userRef': serializeParam(
                                    containerUsersRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    getCORSProxyUrl(
                                      containerUsersRecord.photoUrl,
                                    ),
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    containerUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 5.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "relative",
                                      widget.userNotificationDoc!.createdAt!,
                                      locale: FFLocalizations.of(context)
                                              .languageShortCode ??
                                          FFLocalizations.of(context)
                                              .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getVariableText(
                                  ptText: widget
                                      .userNotificationDoc?.text.portuguese,
                                  enText: widget
                                      .userNotificationDoc?.text.english,
                                  esText: widget
                                      .userNotificationDoc?.text.spanish,
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 20.0))
                          .addToStart(const SizedBox(width: 20.0))
                          .addToEnd(const SizedBox(width: 20.0)),
                    ),
                  ),
                );
              },
            );
          } else if (widget.userNotificationDoc?.hasPlaceRef() ?? false) {
            return StreamBuilder<PlacesRecord>(
              stream: PlacesRecord.getDocument(
                  widget.userNotificationDoc!.placeRef!),
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

                final containerPlacesRecord = snapshot.data!;

                return Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'Place',
                                pathParameters: {
                                  'placeRef': serializeParam(
                                    widget.userNotificationDoc?.placeRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StreamBuilder<List<PlaceImagesRecord>>(
                                  stream: queryPlaceImagesRecord(
                                    parent: containerPlacesRecord.reference,
                                    queryBuilder: (placeImagesRecord) =>
                                        placeImagesRecord
                                            .where(
                                              'status.active',
                                              isEqualTo: true,
                                            )
                                            .orderBy('order'),
                                    singleRecord: true,
                                  ),
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
                                    List<PlaceImagesRecord>
                                        imagePlaceImagesRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final imagePlaceImagesRecord =
                                        imagePlaceImagesRecordList.isNotEmpty
                                            ? imagePlaceImagesRecordList.first
                                            : null;

                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        getCORSProxyUrl(
                                          imagePlaceImagesRecord!.url,
                                        ),
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    containerPlacesRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 5.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "relative",
                                      widget.userNotificationDoc!.createdAt!,
                                      locale: FFLocalizations.of(context)
                                              .languageShortCode ??
                                          FFLocalizations.of(context)
                                              .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getVariableText(
                                  ptText: widget
                                      .userNotificationDoc?.text.portuguese,
                                  enText: widget
                                      .userNotificationDoc?.text.english,
                                  esText: widget
                                      .userNotificationDoc?.text.spanish,
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 20.0))
                          .addToStart(const SizedBox(width: 20.0))
                          .addToEnd(const SizedBox(width: 20.0)),
                    ),
                  ),
                );
              },
            );
          } else if (widget.userNotificationDoc?.hasEventRef() ?? false) {
            return StreamBuilder<EventsRecord>(
              stream: EventsRecord.getDocument(
                  widget.userNotificationDoc!.eventRef!),
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

                final containerEventsRecord = snapshot.data!;

                return Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'Event',
                                pathParameters: {
                                  'eventRef': serializeParam(
                                    widget.userNotificationDoc?.eventRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StreamBuilder<List<EventImagesRecord>>(
                                  stream: queryEventImagesRecord(
                                    parent: containerEventsRecord.reference,
                                    queryBuilder: (eventImagesRecord) =>
                                        eventImagesRecord
                                            .where(
                                              'status.active',
                                              isEqualTo: true,
                                            )
                                            .orderBy('order'),
                                    singleRecord: true,
                                  ),
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
                                    List<EventImagesRecord>
                                        imageEventImagesRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final imageEventImagesRecord =
                                        imageEventImagesRecordList.isNotEmpty
                                            ? imageEventImagesRecordList.first
                                            : null;

                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        getCORSProxyUrl(
                                          imageEventImagesRecord!.url,
                                        ),
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    containerEventsRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 5.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "relative",
                                      widget.userNotificationDoc!.createdAt!,
                                      locale: FFLocalizations.of(context)
                                              .languageShortCode ??
                                          FFLocalizations.of(context)
                                              .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getVariableText(
                                  ptText: widget
                                      .userNotificationDoc?.text.portuguese,
                                  enText: widget
                                      .userNotificationDoc?.text.english,
                                  esText: widget
                                      .userNotificationDoc?.text.spanish,
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 20.0))
                          .addToStart(const SizedBox(width: 20.0))
                          .addToEnd(const SizedBox(width: 20.0)),
                    ),
                  ),
                );
              },
            );
          } else {
            return Material(
              color: Colors.transparent,
              elevation: 1.0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).placedBlack,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'g3jpooc3' /* Notificação */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.circle,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 5.0,
                                ),
                              ),
                              Text(
                                dateTimeFormat(
                                  "relative",
                                  widget.userNotificationDoc!.createdAt!,
                                  locale: FFLocalizations.of(context)
                                          .languageShortCode ??
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          AutoSizeText(
                            FFLocalizations.of(context).getVariableText(
                              ptText:
                                  widget.userNotificationDoc?.text.portuguese,
                              enText:
                                  widget.userNotificationDoc?.text.english,
                              esText:
                                  widget.userNotificationDoc?.text.spanish,
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(const SizedBox(width: 20.0))
                      .addToStart(const SizedBox(width: 20.0))
                      .addToEnd(const SizedBox(width: 20.0)),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
