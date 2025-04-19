import '/backend/backend.dart';
import '/components/list_h_event/list_h_event_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_confirmed_events_model.dart';
export 'user_confirmed_events_model.dart';

class UserConfirmedEventsWidget extends StatefulWidget {
  const UserConfirmedEventsWidget({
    super.key,
    this.eventsDocs,
  });

  final List<EventConfirmedUsersRecord>? eventsDocs;

  @override
  State<UserConfirmedEventsWidget> createState() =>
      _UserConfirmedEventsWidgetState();
}

class _UserConfirmedEventsWidgetState extends State<UserConfirmedEventsWidget> {
  late UserConfirmedEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserConfirmedEventsModel());

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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'hail8e07' /* Eventos Confirmados */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ),
        Builder(
          builder: (context) {
            final confirmedEvent = widget.eventsDocs?.toList() ?? [];

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(confirmedEvent.length, (confirmedEventIndex) {
                  final confirmedEventItem =
                      confirmedEvent[confirmedEventIndex];
                  return Flexible(
                    child: StreamBuilder<EventsRecord>(
                      stream: EventsRecord.getDocument(
                          confirmedEventItem.parentReference),
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
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: 200.0,
                            height: 250.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: wrapWithModel(
                              model: _model.listHEventModels.getModel(
                                containerEventsRecord.reference.id,
                                confirmedEventIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ListHEventWidget(
                                key: Key(
                                  'Keyvqt_${containerEventsRecord.reference.id}',
                                ),
                                eventDoc: containerEventsRecord,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).divide(const SizedBox(width: 10.0)),
              ),
            );
          },
        ),
      ],
    );
  }
}
