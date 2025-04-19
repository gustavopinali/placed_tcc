import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_invite_model.dart';
export 'notification_invite_model.dart';

class NotificationInviteWidget extends StatefulWidget {
  const NotificationInviteWidget({
    super.key,
    required this.eventDoc,
    required this.eventInviteDoc,
  });

  final EventsRecord? eventDoc;
  final EventInvitedUsersRecord? eventInviteDoc;

  @override
  State<NotificationInviteWidget> createState() =>
      _NotificationInviteWidgetState();
}

class _NotificationInviteWidgetState extends State<NotificationInviteWidget> {
  late NotificationInviteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationInviteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<EventImagesRecord>>(
              stream: queryEventImagesRecord(
                parent: widget.eventDoc?.reference,
                queryBuilder: (eventImagesRecord) => eventImagesRecord
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<EventImagesRecord> containerEventImagesRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerEventImagesRecord =
                    containerEventImagesRecordList.isNotEmpty
                        ? containerEventImagesRecordList.first
                        : null;

                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).placedBlack,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 100),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        imageUrl: getCORSProxyUrl(
                          containerEventImagesRecord!.url,
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            widget.eventDoc!.name,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'lm5fhm7d' /* Você foi convidado */,
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            dateTimeFormat(
                              "relative",
                              widget.eventInviteDoc!.createdAt!,
                              locale: FFLocalizations.of(context)
                                      .languageShortCode ??
                                  FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: StreamBuilder<EventInvitedUsersRecord>(
                stream: EventInvitedUsersRecord.getDocument(
                    widget.eventInviteDoc!.reference),
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

                  final conditionalBuilderEventInvitedUsersRecord =
                      snapshot.data!;

                  return Builder(
                    builder: (context) {
                      if (conditionalBuilderEventInvitedUsersRecord.answered) {
                        return const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [],
                        );
                      } else {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.check,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await widget.eventInviteDoc!.reference.update({
                                  ...createEventInvitedUsersRecordData(
                                    accepted: true,
                                    refused: false,
                                    answered: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'answeredAt':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });

                                await EventConfirmedUsersRecord.createDoc(
                                  widget.eventDoc!.reference,
                                  id: currentUserReference!.id,
                                ).set({
                                  ...createEventConfirmedUsersRecordData(
                                    userRef: currentUserReference,
                                    active: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'createdAt': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              },
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.eventInviteDoc!.reference.update({
                                  ...createEventInvitedUsersRecordData(
                                    accepted: false,
                                    refused: true,
                                    answered: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'answeredAt':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 15.0,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
