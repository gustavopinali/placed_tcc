import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'visit_place_button_model.dart';
export 'visit_place_button_model.dart';

class VisitPlaceButtonWidget extends StatefulWidget {
  const VisitPlaceButtonWidget({
    super.key,
    required this.placeRef,
    required this.placeDoc,
  });

  final DocumentReference? placeRef;
  final PlacesRecord? placeDoc;

  @override
  State<VisitPlaceButtonWidget> createState() => _VisitPlaceButtonWidgetState();
}

class _VisitPlaceButtonWidgetState extends State<VisitPlaceButtonWidget> {
  late VisitPlaceButtonModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitPlaceButtonModel());

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

    return StreamBuilder<List<VisitsRecord>>(
      stream: queryVisitsRecord(
        queryBuilder: (visitsRecord) => visitsRecord
            .where(
              'userRef',
              isEqualTo: currentUserReference,
            )
            .where(
              'placeRef',
              isEqualTo: widget.placeRef,
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
        List<VisitsRecord> conditionalBuilderVisitsRecordList = snapshot.data!;
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
                    await conditionalBuilderVisitsRecord.reference.update({
                      ...createVisitsRecordData(
                        checkOut: true,
                      ),
                      ...mapToFirestore(
                        {
                          'checkOutTime': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    'vyw3dmts' /* Finalizar Visita */,
                  ),
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).placedWhite,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 1.0,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              );
            } else {
              return Builder(
                builder: (context) {
                  if (functions.getDistanceValue(widget.placeDoc!.location!,
                          currentUserLocationValue!) <=
                      1.0) {
                    return StreamBuilder<List<VisitsRecord>>(
                      stream: queryVisitsRecord(
                        queryBuilder: (visitsRecord) => visitsRecord
                            .where(
                              'userRef',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'placeRef',
                              isEqualTo: widget.placeRef,
                            )
                            .where(
                              'checkOutTime',
                              isGreaterThanOrEqualTo: functions
                                  .visitRecentTime(getCurrentTimestamp),
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
                                        checkOut: false,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'checkList': FieldValue.arrayUnion(
                                              [getCurrentTimestamp]),
                                        },
                                      ),
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'hw4kzk6p' /* Iniciar Visita */,
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .placedWhite,
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
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await VisitsRecord.collection.doc().set({
                                      ...createVisitsRecordData(
                                        userRef: currentUserReference,
                                        placeRef: widget.placeRef,
                                        checkIn: true,
                                        checkOut: false,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'checkInTime':
                                              FieldValue.serverTimestamp(),
                                          'checkList': [getCurrentTimestamp],
                                        },
                                      ),
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    's8lf4rum' /* Iniciar Visita */,
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .placedWhite,
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
                            }
                          },
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: '${formatNumber(
                          functions.getDistanceValue(
                              widget.placeDoc!.location!,
                              currentUserLocationValue!),
                          formatType: FormatType.custom,
                          format: '#######.#',
                          locale: '',
                        )}km',
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
                                color: FlutterFlowTheme.of(context).placedWhite,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 1.0,
                          borderRadius: BorderRadius.circular(30.0),
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
  }
}
