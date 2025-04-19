import '/backend/backend.dart';
import '/components/event_banner/event_banner_widget.dart';
import '/components/place_banner/place_banner_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'visit_profile_card_model.dart';
export 'visit_profile_card_model.dart';

class VisitProfileCardWidget extends StatefulWidget {
  const VisitProfileCardWidget({
    super.key,
    required this.visistDoc,
  });

  final VisitsRecord? visistDoc;

  @override
  State<VisitProfileCardWidget> createState() => _VisitProfileCardWidgetState();
}

class _VisitProfileCardWidgetState extends State<VisitProfileCardWidget> {
  late VisitProfileCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitProfileCardModel());

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
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                if (widget.visistDoc?.placeRef != null) {
                  return StreamBuilder<PlacesRecord>(
                    stream:
                        PlacesRecord.getDocument(widget.visistDoc!.placeRef!),
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

                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .placedBlack,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: wrapWithModel(
                                        model: _model.placeBannerModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PlaceBannerWidget(
                                          pageView: false,
                                          gradientTop: false,
                                          gradientBotton: false,
                                          link: false,
                                          placeDoc: containerPlacesRecord,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Icon(
                                  Icons.place_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (widget.visistDoc?.eventRef != null) {
                  return StreamBuilder<EventsRecord>(
                    stream:
                        EventsRecord.getDocument(widget.visistDoc!.eventRef!),
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

                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .placedBlack,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: wrapWithModel(
                                        model: _model.eventBannerModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EventBannerWidget(
                                          gradient: false,
                                          pageView: false,
                                          eventDoc: containerEventsRecord,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Icon(
                                  Icons.event,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  );
                }
              },
            ),
          ),
          Builder(
            builder: (context) {
              if (widget.visistDoc?.checkOut ?? false) {
                return Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "d/M H:mm",
                      widget.visistDoc?.checkOutTime,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                );
              } else if (widget.visistDoc?.checkIn ?? false) {
                return Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "d/M H:mm",
                      widget.visistDoc?.checkInTime,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).success,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                );
              } else if (widget.visistDoc?.scheduling ?? false) {
                return Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "d/M H:mm",
                      widget.visistDoc?.schedulingTime,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).warning,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                );
              } else {
                return Text(
                  FFLocalizations.of(context).getText(
                    '9u31sh5j' /* null */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
