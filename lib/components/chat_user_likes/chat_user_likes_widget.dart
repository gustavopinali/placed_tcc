import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_card100/user_card100_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_user_likes_model.dart';
export 'chat_user_likes_model.dart';

class ChatUserLikesWidget extends StatefulWidget {
  const ChatUserLikesWidget({super.key});

  @override
  State<ChatUserLikesWidget> createState() => _ChatUserLikesWidgetState();
}

class _ChatUserLikesWidgetState extends State<ChatUserLikesWidget> {
  late ChatUserLikesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatUserLikesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userLikesQuery = await queryUserLikesRecordOnce(
        parent: currentUserReference,
        queryBuilder: (userLikesRecord) => userLikesRecord.where(
          'active',
          isEqualTo: true,
        ),
      );
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
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '8pui5yxd' /* Gostou de você */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    Icons.circle_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 15.0,
                  ),
                ),
              ],
            ),
          Container(
            width: double.infinity,
            height: 100.0,
            decoration: const BoxDecoration(),
            child: StreamBuilder<List<UserLikesRecord>>(
              stream: queryUserLikesRecord(
                parent: currentUserReference,
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
                List<UserLikesRecord> listViewUserLikesRecordList =
                    snapshot.data!;

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: listViewUserLikesRecordList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewUserLikesRecord =
                        listViewUserLikesRecordList[listViewIndex];
                    return Visibility(
                      visible: _model.userLikesQuery
                              ?.where((e) =>
                                  e.userRef == listViewUserLikesRecord.userRef)
                              .toList()
                              .sortedList(
                                  keyOf: (e) => e.createdAt!, desc: false)
                              .first
                              .reference ==
                          listViewUserLikesRecord.reference,
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            listViewUserLikesRecord.userRef!),
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

                          final userCard100UsersRecord = snapshot.data!;

                          return wrapWithModel(
                            model: _model.userCard100Models.getModel(
                              userCard100UsersRecord.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: UserCard100Widget(
                              key: Key(
                                'Key3g6_${userCard100UsersRecord.reference.id}',
                              ),
                              userDoc: userCard100UsersRecord,
                            ),
                          );
                        },
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
  }
}
