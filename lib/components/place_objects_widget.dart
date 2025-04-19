import '/backend/backend.dart';
import '/components/post_card_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'place_objects_model.dart';
export 'place_objects_model.dart';

class PlaceObjectsWidget extends StatefulWidget {
  const PlaceObjectsWidget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlaceObjectsWidget> createState() => _PlaceObjectsWidgetState();
}

class _PlaceObjectsWidgetState extends State<PlaceObjectsWidget>
    with TickerProviderStateMixin {
  late PlaceObjectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceObjectsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0.0, 0),
              child: TabBar(
                labelColor: FlutterFlowTheme.of(context).primaryText,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).titleMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleMediumFamily),
                    ),
                unselectedLabelStyle: const TextStyle(),
                indicatorColor: FlutterFlowTheme.of(context).primary,
                padding: const EdgeInsets.all(4.0),
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image_outlined,
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          '6dag5nt0' /*  */,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.videocam_outlined,
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'ih7whffx' /*  */,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_border_sharp,
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          '492gu6tp' /*  */,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FFIcons.kusers,
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'rb4p5ukm' /*  */,
                        ),
                      ),
                    ],
                  ),
                ],
                controller: _model.tabBarController,
                onTap: (i) async {
                  [() async {}, () async {}, () async {}, () async {}][i]();
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _model.tabBarController,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: PagedGridView<DocumentSnapshot<Object?>?,
                            PostsRecord>(
                          pagingController: _model.setGridViewController1(
                            PostsRecord.collection.where(
                              'placeRef',
                              isEqualTo: widget.placeDoc?.reference,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            6.0,
                            0,
                            6.0,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 6.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<PostsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, gridViewIndex) {
                              final gridViewPostsRecord = _model
                                  .gridViewPagingController1!
                                  .itemList![gridViewIndex];
                              return wrapWithModel(
                                model: _model.postCardModels1.getModel(
                                  gridViewPostsRecord.reference.id,
                                  gridViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: PostCardWidget(
                                  key: Key(
                                    'Key4e9_${gridViewPostsRecord.reference.id}',
                                  ),
                                  postDoc: gridViewPostsRecord,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 6.0),
                    child: PagedMasonryGridView<DocumentSnapshot<Object?>?,
                        PostsRecord>.count(
                      pagingController: _model.setStaggeredViewController(
                        PostsRecord.collection,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate<PostsRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, staggeredViewIndex) {
                          final staggeredViewPostsRecord = _model
                              .staggeredViewPagingController!
                              .itemList![staggeredViewIndex];
                          return wrapWithModel(
                            model: _model.postCardModels2.getModel(
                              staggeredViewPostsRecord.reference.id,
                              staggeredViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: PostCardWidget(
                              key: Key(
                                'Keyfcc_${staggeredViewPostsRecord.reference.id}',
                              ),
                              postDoc: staggeredViewPostsRecord,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'zrm7j4b6' /* Tab View 3 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 32.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: StreamBuilder<List<VisitsRecord>>(
                            stream: queryVisitsRecord(
                              queryBuilder: (visitsRecord) => visitsRecord
                                  .where(
                                    'placeRef',
                                    isEqualTo: widget.placeDoc?.reference,
                                  )
                                  .where(
                                    'checkIn',
                                    isEqualTo: true,
                                  )
                                  .orderBy('checkInTime', descending: true),
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
                              List<VisitsRecord> gridViewVisitsRecordList =
                                  snapshot.data!;

                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  6.0,
                                  0,
                                  6.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6.0,
                                  mainAxisSpacing: 6.0,
                                  childAspectRatio: 0.75,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: gridViewVisitsRecordList.length,
                                itemBuilder: (context, gridViewIndex) {
                                  final gridViewVisitsRecord =
                                      gridViewVisitsRecordList[gridViewIndex];
                                  return StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        gridViewVisitsRecord.userRef!),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final userCardUsersRecord =
                                          snapshot.data!;

                                      return wrapWithModel(
                                        model: _model.userCardModels.getModel(
                                          userCardUsersRecord.reference.id,
                                          gridViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UserCardWidget(
                                          key: Key(
                                            'Keygvl_${userCardUsersRecord.reference.id}',
                                          ),
                                          user: userCardUsersRecord,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
