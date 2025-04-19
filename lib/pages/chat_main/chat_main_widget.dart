import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_top_bar/app_top_bar_widget.dart';
import '/components/chat/chat_widget.dart';
import '/components/user_card_min/user_card_min_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({super.key});

  @override
  State<ChatMainWidget> createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatMain'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.appTopBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const AppTopBarWidget(),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(0.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: StreamBuilder<List<UserLikesRecord>>(
                              stream: queryUserLikesRecord(
                                parent: currentUserReference,
                                queryBuilder: (userLikesRecord) =>
                                    userLikesRecord.where(
                                  'active',
                                  isEqualTo: true,
                                ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserLikesRecord>
                                    listViewUserLikesRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewUserLikesRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUserLikesRecord =
                                        listViewUserLikesRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child:
                                          StreamBuilder<List<UserLikesRecord>>(
                                        stream: queryUserLikesRecord(
                                          parent:
                                              listViewUserLikesRecord.userRef,
                                          queryBuilder: (userLikesRecord) =>
                                              userLikesRecord
                                                  .where(
                                                    'userRef',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'active',
                                                    isEqualTo: true,
                                                  )
                                                  .orderBy('createdAt'),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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
                                          List<UserLikesRecord>
                                              containerUserLikesRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerUserLikesRecord =
                                              containerUserLikesRecordList
                                                      .isNotEmpty
                                                  ? containerUserLikesRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  listViewUserLikesRecord
                                                      .userRef!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final userCardMinUsersRecord =
                                                    snapshot.data!;

                                                return wrapWithModel(
                                                  model: _model
                                                      .userCardMinModels
                                                      .getModel(
                                                    userCardMinUsersRecord
                                                        .reference.id,
                                                    listViewIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: UserCardMinWidget(
                                                    key: Key(
                                                      'Key0bb_${userCardMinUsersRecord.reference.id}',
                                                    ),
                                                    userDoc:
                                                        userCardMinUsersRecord,
                                                  ),
                                                );
                                              },
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
                          Expanded(
                            flex: 3,
                            child: wrapWithModel(
                              model: _model.chatModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: const ChatWidget(),
                            ),
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
