import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_user_like_model.dart';
export 'chat_user_like_model.dart';

class ChatUserLikeWidget extends StatefulWidget {
  const ChatUserLikeWidget({
    super.key,
    required this.userDoc,
    required this.userLikeDoc,
  });

  final UsersRecord? userDoc;
  final UserLikesRecord? userLikeDoc;

  @override
  State<ChatUserLikeWidget> createState() => _ChatUserLikeWidgetState();
}

class _ChatUserLikeWidgetState extends State<ChatUserLikeWidget> {
  late ChatUserLikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatUserLikeModel());

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
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 300),
                    imageUrl: getCORSProxyUrl(
                      widget.userDoc!.photoUrl,
                    ),
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userDoc!.displayName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      dateTimeFormat(
                        "relative",
                        widget.userLikeDoc!.createdAt!,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
            StreamBuilder<List<UserLikesRecord>>(
              stream: queryUserLikesRecord(
                parent: widget.userDoc?.reference,
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

                return Builder(
                  builder: (context) {
                    if (conditionalBuilderUserLikesRecord != null) {
                      return FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    } else {
                      return FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).tertiary,
        ),
      ],
    );
  }
}
