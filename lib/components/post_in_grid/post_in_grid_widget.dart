import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/post_comment_list/post_comment_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_in_grid_model.dart';
export 'post_in_grid_model.dart';

class PostInGridWidget extends StatefulWidget {
  const PostInGridWidget({
    super.key,
    required this.postDoc,
  });

  final PostsRecord? postDoc;

  @override
  State<PostInGridWidget> createState() => _PostInGridWidgetState();
}

class _PostInGridWidgetState extends State<PostInGridWidget> {
  late PostInGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostInGridModel());

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
      width: 300.0,
      height: 300.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Material(
                color: Colors.transparent,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            if (!(widget.postDoc!.images.isNotEmpty)) {
                              return Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vhrw8z13' /* Sem Image */,
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
                              );
                            } else if (widget.postDoc!.images.length > 1) {
                              return Builder(
                                builder: (context) {
                                  final images =
                                      widget.postDoc?.images.toList() ?? [];

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 500.0,
                                    child: PageView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(0,
                                                  min(0, images.length - 1))),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            getCORSProxyUrl(
                                              imagesItem,
                                            ),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  getCORSProxyUrl(
                                    widget.postDoc!.images.first,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: PostCommentListWidget(
                                    postRef: widget.postDoc!.reference,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          onDoubleTap: () async {
                            _model.likeOut = await queryPostLikesRecordOnce(
                              parent: widget.postDoc?.reference,
                              queryBuilder: (postLikesRecord) => postLikesRecord
                                  .where(
                                    'userRef',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'active',
                                    isEqualTo: true,
                                  ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (!(_model.likeOut != null)) {
                              await PostLikesRecord.createDoc(
                                widget.postDoc!.reference,
                                id: currentUserReference!.id,
                              ).set({
                                ...createPostLikesRecordData(
                                  userRef: currentUserReference,
                                  active: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'createdAt': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              await _model.likeOut!.reference
                                  .update(createPostLikesRecordData(
                                active: false,
                              ));
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 3.0),
            child: FutureBuilder<int>(
              future: queryPostLikesRecordCount(
                parent: widget.postDoc?.reference,
                queryBuilder: (postLikesRecord) => postLikesRecord.where(
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                int rowCount = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                    AutoSizeText(
                      formatNumber(
                        rowCount,
                        formatType: FormatType.compact,
                      ),
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].divide(const SizedBox(width: 6.0)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
