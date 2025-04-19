import '/backend/backend.dart';
import '/components/post_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'place_objects2_model.dart';
export 'place_objects2_model.dart';

class PlaceObjects2Widget extends StatefulWidget {
  const PlaceObjects2Widget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlaceObjects2Widget> createState() => _PlaceObjects2WidgetState();
}

class _PlaceObjects2WidgetState extends State<PlaceObjects2Widget> {
  late PlaceObjects2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceObjects2Model());

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
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        disabledColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.image_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: (_model.index == 0)
                            ? null
                            : () async {
                                _model.index = 0;
                                safeSetState(() {});
                              },
                      ),
                    ),
                    Expanded(
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        disabledColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.star_border_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: (_model.index == 1)
                            ? null
                            : () async {
                                _model.index = 1;
                                safeSetState(() {});
                              },
                      ),
                    ),
                    Expanded(
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        disabledColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: (_model.index == 2)
                            ? null
                            : () async {
                                _model.index = 2;
                                safeSetState(() {});
                              },
                      ),
                    ),
                  ].divide(const SizedBox(width: 6.0)).around(const SizedBox(width: 6.0)),
                ),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (_model.index == 0) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                  child: StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord
                          .orderBy('status.createdAt', descending: true),
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
                      List<PostsRecord> staggeredViewPostsRecordList =
                          snapshot.data!;

                      return MasonryGridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0,
                        itemCount: staggeredViewPostsRecordList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, staggeredViewIndex) {
                          final staggeredViewPostsRecord =
                              staggeredViewPostsRecordList[staggeredViewIndex];
                          return wrapWithModel(
                            model: _model.postCardModels.getModel(
                              staggeredViewPostsRecord.reference.id,
                              staggeredViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: PostCardWidget(
                              key: Key(
                                'Key2b0_${staggeredViewPostsRecord.reference.id}',
                              ),
                              postDoc: staggeredViewPostsRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else if (_model.index == 1) {
                return StreamBuilder<List<PlaceReviewsRecord>>(
                  stream: queryPlaceReviewsRecord(
                    parent: widget.placeDoc?.reference,
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
                    List<PlaceReviewsRecord>
                        staggeredViewPlaceReviewsRecordList = snapshot.data!;

                    return MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      itemCount: staggeredViewPlaceReviewsRecordList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, staggeredViewIndex) {
                        final staggeredViewPlaceReviewsRecord =
                            staggeredViewPlaceReviewsRecordList[
                                staggeredViewIndex];
                        return Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  itemCount: 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return [][index]();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
