import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_card100/user_card100_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_user_friends_model.dart';
export 'chat_user_friends_model.dart';

class ChatUserFriendsWidget extends StatefulWidget {
  const ChatUserFriendsWidget({super.key});

  @override
  State<ChatUserFriendsWidget> createState() => _ChatUserFriendsWidgetState();
}

class _ChatUserFriendsWidgetState extends State<ChatUserFriendsWidget> {
  late ChatUserFriendsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatUserFriendsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.friendshipList = await queryFriendshipsRecordOnce(
        queryBuilder: (friendshipsRecord) => friendshipsRecord
            .where(
              'users',
              arrayContains: currentUserReference,
            )
            .where(
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
                    'wk7amig3' /* Gostou de você */,
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
            child: Builder(
              builder: (context) {
                final friendship = _model.friendshipList
                        ?.where((e) => e.accepted)
                        .toList()
                        .map((e) => e.users
                            .where((e) => e != currentUserReference)
                            .toList()
                            .first)
                        .toList()
                        .toList() ??
                    [];

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: friendship.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10.0),
                  itemBuilder: (context, friendshipIndex) {
                    final friendshipItem = friendship[friendshipIndex];
                    return StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(friendshipItem),
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
                            friendshipIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: UserCard100Widget(
                            key: Key(
                              'Keycbl_${userCard100UsersRecord.reference.id}',
                            ),
                            userDoc: userCard100UsersRecord,
                          ),
                        );
                      },
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
