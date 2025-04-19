import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'usar_btn_like_model.dart';
export 'usar_btn_like_model.dart';

class UsarBtnLikeWidget extends StatefulWidget {
  const UsarBtnLikeWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UsarBtnLikeWidget> createState() => _UsarBtnLikeWidgetState();
}

class _UsarBtnLikeWidgetState extends State<UsarBtnLikeWidget> {
  late UsarBtnLikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsarBtnLikeModel());

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
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 100.0,
        height: 35.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(1.0, 0.0),
            end: const AlignmentDirectional(-1.0, 0),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StreamBuilder<List<UserLikesRecord>>(
          stream: queryUserLikesRecord(
            parent: widget.userRef,
            queryBuilder: (userLikesRecord) => userLikesRecord
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
            List<UserLikesRecord> conditionalBuilderUserLikesRecordList =
                snapshot.data!;
            final conditionalBuilderUserLikesRecord =
                conditionalBuilderUserLikesRecordList.isNotEmpty
                    ? conditionalBuilderUserLikesRecordList.first
                    : null;

            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (conditionalBuilderUserLikesRecord != null) {
                  await conditionalBuilderUserLikesRecord.reference
                      .update(createUserLikesRecordData(
                    active: false,
                  ));
                } else {
                  await UserLikesRecord.createDoc(
                    widget.userRef!,
                    id: currentUserReference!.id,
                  ).set({
                    ...createUserLikesRecordData(
                      userRef: currentUserReference,
                      active: true,
                    ),
                    ...mapToFirestore(
                      {
                        'createdAt': FieldValue.serverTimestamp(),
                      },
                    ),
                  });
                }
              },
              child: Builder(
                builder: (context) {
                  if (!(conditionalBuilderUserLikesRecord != null)) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: FlutterFlowTheme.of(context).placedWhite,
                          size: 15.0,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '4buwfx24' /* Like */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).placedWhite,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).placedWhite,
                          size: 15.0,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0mdexzzp' /* Liked */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).placedWhite,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
