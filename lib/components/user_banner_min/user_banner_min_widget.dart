import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'user_banner_min_model.dart';
export 'user_banner_min_model.dart';

class UserBannerMinWidget extends StatefulWidget {
  const UserBannerMinWidget({
    super.key,
    required this.userDoc,
    this.visitRef,
    bool? hideUsername,
  }) : hideUsername = hideUsername ?? false;

  final UsersRecord? userDoc;
  final DocumentReference? visitRef;
  final bool hideUsername;

  @override
  State<UserBannerMinWidget> createState() => _UserBannerMinWidgetState();
}

class _UserBannerMinWidgetState extends State<UserBannerMinWidget> {
  late UserBannerMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserBannerMinModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).placedBlack,
          ),
        ),
        Stack(
          children: [
            StreamBuilder<List<UserImagesRecord>>(
              stream: FFAppState().userImages(
                uniqueQueryKey:
                    '${widget.userDoc?.reference.id}_${dateTimeFormat(
                  "dMyH",
                  getCurrentTimestamp,
                  locale: FFLocalizations.of(context).languageCode,
                )}',
                requestFn: () => queryUserImagesRecord(
                  parent: widget.userDoc?.reference,
                  queryBuilder: (userImagesRecord) => userImagesRecord
                      .where(
                        'status.active',
                        isEqualTo: true,
                      )
                      .orderBy('order'),
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UserImagesRecord> pageViewUserImagesRecordList =
                    snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(0,
                            min(0, pageViewUserImagesRecordList.length - 1))),
                    scrollDirection: Axis.horizontal,
                    itemCount: pageViewUserImagesRecordList.length,
                    itemBuilder: (context, pageViewIndex) {
                      final pageViewUserImagesRecord =
                          pageViewUserImagesRecordList[pageViewIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: OctoImage(
                          placeholderBuilder: (_) => SizedBox.expand(
                            child: Image(
                              image:
                                  BlurHashImage(pageViewUserImagesRecord.blur),
                              fit: BoxFit.cover,
                            ),
                          ),
                          image: CachedNetworkImageProvider(
                            getCORSProxyUrl(
                              pageViewUserImagesRecord.url,
                            ),
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!widget.hideUsername)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Color(0xE6000000)],
                          stops: [0.5, 0.8],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!widget.hideUsername)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AutoSizeText(
                                            widget.userDoc!.displayName
                                                .maybeHandleOverflow(
                                              maxChars: 20,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .placedWhite,
                                                  fontSize: 15.0,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
