import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_comment_model.dart';
export 'post_comment_model.dart';

class PostCommentWidget extends StatefulWidget {
  const PostCommentWidget({
    super.key,
    required this.postCommentDoc,
  });

  final PostCommentsRecord? postCommentDoc;

  @override
  State<PostCommentWidget> createState() => _PostCommentWidgetState();
}

class _PostCommentWidgetState extends State<PostCommentWidget> {
  late PostCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostCommentModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Align(
          alignment: const AlignmentDirectional(-1.0, -1.0),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.postCommentDoc!.createdBy!),
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

              final rowUsersRecord = snapshot.data!;

              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'User',
                        pathParameters: {
                          'userRef': serializeParam(
                            rowUsersRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        getCORSProxyUrl(
                          rowUsersRecord.photoUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    rowUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "relative",
                                      widget.postCommentDoc!.createdAt!,
                                      locale: FFLocalizations.of(context)
                                              .languageShortCode ??
                                          FFLocalizations.of(context)
                                              .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                              AutoSizeText(
                                widget.postCommentDoc!.comment,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Poppins'),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<int>(
                    future: queryPostCommentLikesRecordCount(
                      parent: widget.postCommentDoc?.parentReference,
                      queryBuilder: (postCommentLikesRecord) =>
                          postCommentLikesRecord
                              .where(
                                'commentRef',
                                isEqualTo: widget.postCommentDoc?.reference,
                              )
                              .where(
                                'active',
                                isEqualTo: true,
                              ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const Center(
                          child: SizedBox(
                            width: 5.0,
                            height: 5.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.transparent,
                              ),
                            ),
                          ),
                        );
                      }
                      int columnCount = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<List<PostCommentLikesRecord>>(
                            stream: queryPostCommentLikesRecord(
                              parent: widget.postCommentDoc?.parentReference,
                              queryBuilder: (postCommentLikesRecord) =>
                                  postCommentLikesRecord
                                      .where(
                                        'userRef',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'active',
                                        isEqualTo: true,
                                      )
                                      .where(
                                        'commentRef',
                                        isEqualTo:
                                            widget.postCommentDoc?.reference,
                                      ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: SizedBox(
                                    width: 5.0,
                                    height: 5.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PostCommentLikesRecord>
                                  conditionalBuilderPostCommentLikesRecordList =
                                  snapshot.data!;
                              final conditionalBuilderPostCommentLikesRecord =
                                  conditionalBuilderPostCommentLikesRecordList
                                          .isNotEmpty
                                      ? conditionalBuilderPostCommentLikesRecordList
                                          .first
                                      : null;

                              return Builder(
                                builder: (context) {
                                  if (conditionalBuilderPostCommentLikesRecord !=
                                      null) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await conditionalBuilderPostCommentLikesRecord
                                                .reference
                                                .update(
                                                    createPostCommentLikesRecordData(
                                              active: false,
                                            ));
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 15.0,
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            columnCount,
                                            formatType: FormatType.compact,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 8.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await PostCommentLikesRecord
                                                .createDoc(
                                              widget.postCommentDoc!
                                                  .parentReference,
                                              id: '${widget.postCommentDoc?.reference.id}_${currentUserReference?.id}',
                                            ).set({
                                              ...createPostCommentLikesRecordData(
                                                userRef: currentUserReference,
                                                commentRef: widget
                                                    .postCommentDoc?.reference,
                                                active: true,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'createdAt': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 15.0,
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            columnCount,
                                            formatType: FormatType.compact,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 8.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ].divide(const SizedBox(width: 5.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
