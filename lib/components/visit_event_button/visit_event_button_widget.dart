import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'visit_event_button_model.dart';
export 'visit_event_button_model.dart';

class VisitEventButtonWidget extends StatefulWidget {
  const VisitEventButtonWidget({
    super.key,
    required this.eventRef,
  });

  final DocumentReference? eventRef;

  @override
  State<VisitEventButtonWidget> createState() => _VisitEventButtonWidgetState();
}

class _VisitEventButtonWidgetState extends State<VisitEventButtonWidget> {
  late VisitEventButtonModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitEventButtonModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.eventRef!),
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

        final rowEventsRecord = snapshot.data!;

        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (rowEventsRecord.hasStart() && rowEventsRecord.hasEnd())
              Builder(
                builder: (context) {
                  if (getCurrentTimestamp < rowEventsRecord.start!) {
                    return StreamBuilder<List<EventConfirmedUsersRecord>>(
                      stream: queryEventConfirmedUsersRecord(
                        parent: rowEventsRecord.reference,
                        queryBuilder: (eventConfirmedUsersRecord) =>
                            eventConfirmedUsersRecord
                                .where(
                                  'userRef',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'active',
                                  isEqualTo: true,
                                ),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<EventConfirmedUsersRecord>
                            conditionalBuilderEventConfirmedUsersRecordList =
                            snapshot.data!;
                        final conditionalBuilderEventConfirmedUsersRecord =
                            conditionalBuilderEventConfirmedUsersRecordList
                                    .isNotEmpty
                                ? conditionalBuilderEventConfirmedUsersRecordList
                                    .first
                                : null;

                        return Builder(
                          builder: (context) {
                            if (conditionalBuilderEventConfirmedUsersRecord !=
                                null) {
                              return FFButtonWidget(
                                onPressed: () async {
                                  await conditionalBuilderEventConfirmedUsersRecord
                                      .reference
                                      .update(
                                          createEventConfirmedUsersRecordData(
                                    active: false,
                                  ));
                                },
                                text: FFLocalizations.of(context).getText(
                                  'cn9cxech' /* Confirmado */,
                                ),
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              );
                            } else {
                              return FFButtonWidget(
                                onPressed: () async {
                                  await EventConfirmedUsersRecord.createDoc(
                                    widget.eventRef!,
                                    id: currentUserReference!.id,
                                  ).set({
                                    ...createEventConfirmedUsersRecordData(
                                      userRef: currentUserReference,
                                      active: true,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'createdAt':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                },
                                text: FFLocalizations.of(context).getText(
                                  'da8ubd8f' /* Vou */,
                                ),
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  } else if ((getCurrentTimestamp > rowEventsRecord.start!) &&
                      (getCurrentTimestamp < rowEventsRecord.end!)) {
                    return StreamBuilder<List<VisitsRecord>>(
                      stream: queryVisitsRecord(
                        queryBuilder: (visitsRecord) => visitsRecord
                            .where(
                              'userRef',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'eventRef',
                              isEqualTo: widget.eventRef,
                            )
                            .where(
                              'checkIn',
                              isEqualTo: true,
                            )
                            .where(
                              'checkOut',
                              isEqualTo: false,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<VisitsRecord> conditionalBuilderVisitsRecordList =
                            snapshot.data!;
                        final conditionalBuilderVisitsRecord =
                            conditionalBuilderVisitsRecordList.isNotEmpty
                                ? conditionalBuilderVisitsRecordList.first
                                : null;

                        return Builder(
                          builder: (context) {
                            if (conditionalBuilderVisitsRecord != null) {
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await conditionalBuilderVisitsRecord
                                        .reference
                                        .update({
                                      ...createVisitsRecordData(
                                        checkOut: true,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'checkOutTime':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'n9whgehz' /* Finalizar Visita */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  if ((functions.getDistanceValue(
                                              rowEventsRecord.location!,
                                              currentUserLocationValue!) <
                                          1.0) ||
                                      rowEventsRecord.eventConfig
                                          .allowDistantUsersVisits) {
                                    return StreamBuilder<List<VisitsRecord>>(
                                      stream: queryVisitsRecord(
                                        queryBuilder: (visitsRecord) =>
                                            visitsRecord
                                                .where(
                                                  'userRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'eventRef',
                                                  isEqualTo: widget.eventRef,
                                                )
                                                .where(
                                                  'checkOutTime',
                                                  isGreaterThanOrEqualTo:
                                                      functions.visitRecentTime(
                                                          getCurrentTimestamp),
                                                ),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<VisitsRecord>
                                            conditionalBuilderVisitsRecordList =
                                            snapshot.data!;
                                        final conditionalBuilderVisitsRecord =
                                            conditionalBuilderVisitsRecordList
                                                    .isNotEmpty
                                                ? conditionalBuilderVisitsRecordList
                                                    .first
                                                : null;

                                        return Builder(
                                          builder: (context) {
                                            if (conditionalBuilderVisitsRecord !=
                                                null) {
                                              return Padding(
                                                padding: const EdgeInsets.all(1.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await conditionalBuilderVisitsRecord
                                                        .reference
                                                        .update({
                                                      ...createVisitsRecordData(
                                                        checkOut: false,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'checkList':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            getCurrentTimestamp
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'npbksj0e' /* Participar */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 50.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(48.0, 0.0,
                                                                48.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(1.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await VisitsRecord
                                                        .collection
                                                        .doc()
                                                        .set({
                                                      ...createVisitsRecordData(
                                                        userRef:
                                                            currentUserReference,
                                                        checkIn: true,
                                                        checkOut: false,
                                                        eventRef:
                                                            widget.eventRef,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'checkInTime': FieldValue
                                                              .serverTimestamp(),
                                                          'checkList': [
                                                            getCurrentTimestamp
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'rtvurwgd' /* Participar */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 50.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(48.0, 0.0,
                                                                48.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Distante do evento'),
                                                        content: const Text(
                                                            'Gostaria ser direcionado ao local?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: const Text('Não'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: const Text('Sim'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            await launchMap(
                                              location:
                                                  rowEventsRecord.location,
                                              title: '',
                                            );

                                            return;
                                          } else {
                                            return;
                                          }
                                        },
                                        text: '${formatNumber(
                                          functions.getDistanceValue(
                                              rowEventsRecord.location!,
                                              currentUserLocationValue!),
                                          formatType: FormatType.custom,
                                          format: '####.#',
                                          locale: '',
                                        )}km',
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  48.0, 0.0, 48.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 1.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                        );
                      },
                    );
                  } else {
                    return FFButtonWidget(
                      onPressed: true
                          ? null
                          : () {
                              print('Button pressed ...');
                            },
                      text: FFLocalizations.of(context).getText(
                        'fgesky10' /* Evento Finalizado */,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    );
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
