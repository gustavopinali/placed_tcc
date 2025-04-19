import '/backend/backend.dart';
import '/components/event_banner/event_banner_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'visit_dash_event_model.dart';
export 'visit_dash_event_model.dart';

class VisitDashEventWidget extends StatefulWidget {
  const VisitDashEventWidget({
    super.key,
    required this.visitDcc,
  });

  final VisitsRecord? visitDcc;

  @override
  State<VisitDashEventWidget> createState() => _VisitDashEventWidgetState();
}

class _VisitDashEventWidgetState extends State<VisitDashEventWidget> {
  late VisitDashEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitDashEventModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.visitDcc!.checkList.last <
          functions.visitRecentTime(getCurrentTimestamp)) {
        await widget.visitDcc!.reference.update({
          ...createVisitsRecordData(
            checkOut: true,
          ),
          ...mapToFirestore(
            {
              'checkOutTime': FieldValue.serverTimestamp(),
            },
          ),
        });
      }
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: StreamBuilder<EventsRecord>(
        stream: FFAppState().eventDoc(
          uniqueQueryKey: '${widget.visitDcc?.eventRef?.id}_${dateTimeFormat(
            "d/M/y",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )}',
          requestFn: () =>
              EventsRecord.getDocument(widget.visitDcc!.eventRef!),
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

          final containerEventsRecord = snapshot.data!;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'Event',
                pathParameters: {
                  'eventRef': serializeParam(
                    widget.visitDcc?.eventRef,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.eventBannerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: EventBannerWidget(
                          eventDoc: containerEventsRecord,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateTimeFormat(
                                  "d/M h:mm a",
                                  widget.visitDcc!.checkInTime!,
                                  locale:
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
