import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/list_event/list_event_widget.dart';
import '/components/list_v_place/list_v_place_widget.dart';
import '/components/review_place/review_place_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_tab_visits_model.dart';
export 'profile_tab_visits_model.dart';

class ProfileTabVisitsWidget extends StatefulWidget {
  const ProfileTabVisitsWidget({super.key});

  @override
  State<ProfileTabVisitsWidget> createState() => _ProfileTabVisitsWidgetState();
}

class _ProfileTabVisitsWidgetState extends State<ProfileTabVisitsWidget> {
  late ProfileTabVisitsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTabVisitsModel());

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
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'zzn7ckid' /* Minhas visitas */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                      Icon(
                        Icons.circle_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 10.0,
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<VisitsRecord>>(
                  stream: queryVisitsRecord(
                    queryBuilder: (visitsRecord) => visitsRecord
                        .where(
                          'userRef',
                          isEqualTo: currentUserReference,
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
                    List<VisitsRecord> staggeredViewVisitsRecordList =
                        snapshot.data!;

                    return MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.sizeOf(context).width < kBreakpointMedium
                                ? 1
                                : 2,
                      ),
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      itemCount: staggeredViewVisitsRecordList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, staggeredViewIndex) {
                        final staggeredViewVisitsRecord =
                            staggeredViewVisitsRecordList[staggeredViewIndex];
                        return Builder(
                          builder: (context) {
                            if (staggeredViewVisitsRecord.placeRef != null) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<PlacesRecord>(
                                    stream: PlacesRecord.getDocument(
                                        staggeredViewVisitsRecord.placeRef!),
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

                                      final listVPlacePlacesRecord =
                                          snapshot.data!;

                                      return wrapWithModel(
                                        model: _model.listVPlaceModels.getModel(
                                          listVPlacePlacesRecord.reference.id,
                                          staggeredViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ListVPlaceWidget(
                                          key: Key(
                                            'Key6r0_${listVPlacePlacesRecord.reference.id}',
                                          ),
                                          invite: false,
                                          edit: false,
                                          place: listVPlacePlacesRecord,
                                          linkToPlace: true,
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child:
                                        StreamBuilder<List<PlaceReviewsRecord>>(
                                      stream: queryPlaceReviewsRecord(
                                        parent:
                                            staggeredViewVisitsRecord.placeRef,
                                        queryBuilder: (placeReviewsRecord) =>
                                            placeReviewsRecord.where(Filter.or(
                                          Filter(
                                            'createdBy',
                                            isEqualTo: currentUserReference,
                                          ),
                                          Filter(
                                            'active',
                                            isEqualTo: true,
                                          ),
                                        )),
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
                                        List<PlaceReviewsRecord>
                                            conditionalBuilderPlaceReviewsRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final conditionalBuilderPlaceReviewsRecord =
                                            conditionalBuilderPlaceReviewsRecordList
                                                    .isNotEmpty
                                                ? conditionalBuilderPlaceReviewsRecordList
                                                    .first
                                                : null;

                                        return Builder(
                                          builder: (context) {
                                            if (!(conditionalBuilderPlaceReviewsRecord !=
                                                null)) {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ReviewPlaceWidget(
                                                            visit:
                                                                staggeredViewVisitsRecord,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'mmapile8' /* Avaliar */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    dateTimeFormat(
                                                      "relative",
                                                      conditionalBuilderPlaceReviewsRecord
                                                          .createdAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  RatingBarIndicator(
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    direction: Axis.horizontal,
                                                    rating:
                                                        conditionalBuilderPlaceReviewsRecord
                                                            .rating,
                                                    unratedColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    itemCount: 5,
                                                    itemSize: 15.0,
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 6.0))
                                                    .around(
                                                        const SizedBox(width: 6.0)),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else if (staggeredViewVisitsRecord.eventRef !=
                                null) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: StreamBuilder<EventsRecord>(
                                      stream: EventsRecord.getDocument(
                                          staggeredViewVisitsRecord.eventRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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

                                        final listEventEventsRecord =
                                            snapshot.data!;

                                        return wrapWithModel(
                                          model:
                                              _model.listEventModels.getModel(
                                            listEventEventsRecord.reference.id,
                                            staggeredViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ListEventWidget(
                                            key: Key(
                                              'Keyb79_${listEventEventsRecord.reference.id}',
                                            ),
                                            link: false,
                                            event: listEventEventsRecord,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'pjrzjf2q' /* null ref */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ].addToEnd(const SizedBox(height: 100.0)),
            ),
          ),
        ),
      ],
    );
  }
}
