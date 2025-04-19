import '/backend/backend.dart';
import '/components/gradient/gradient_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'event_banner_model.dart';
export 'event_banner_model.dart';

class EventBannerWidget extends StatefulWidget {
  const EventBannerWidget({
    super.key,
    required this.eventDoc,
    bool? gradient,
    bool? pageView,
  })  : gradient = gradient ?? false,
        pageView = pageView ?? false;

  final EventsRecord? eventDoc;
  final bool gradient;
  final bool pageView;

  @override
  State<EventBannerWidget> createState() => _EventBannerWidgetState();
}

class _EventBannerWidgetState extends State<EventBannerWidget> {
  late EventBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventBannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).placedBlack,
            ),
          ),
          Builder(
            builder: (context) {
              if (!widget.pageView) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      StreamBuilder<List<EventImagesRecord>>(
                        stream: FFAppState().eventImage(
                          uniqueQueryKey:
                              '${widget.eventDoc?.reference.id}_eventImage',
                          requestFn: () => queryEventImagesRecord(
                            parent: widget.eventDoc?.reference,
                            queryBuilder: (eventImagesRecord) =>
                                eventImagesRecord
                                    .where(
                                      'status.active',
                                      isEqualTo: true,
                                    )
                                    .orderBy('order'),
                            singleRecord: true,
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
                          List<EventImagesRecord> imageEventImagesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final imageEventImagesRecord =
                              imageEventImagesRecordList.isNotEmpty
                                  ? imageEventImagesRecordList.first
                                  : null;

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              getCORSProxyUrl(
                                imageEventImagesRecord!.url,
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      if (widget.gradient)
                        wrapWithModel(
                          model: _model.gradientModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: const GradientWidget(),
                        ),
                    ],
                  ),
                );
              } else {
                return StreamBuilder<List<EventImagesRecord>>(
                  stream: FFAppState().eventImages(
                    uniqueQueryKey: widget.eventDoc?.reference.id,
                    requestFn: () => queryEventImagesRecord(
                      parent: widget.eventDoc?.reference,
                      queryBuilder: (eventImagesRecord) => eventImagesRecord
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
                    List<EventImagesRecord> pageViewEventImagesRecordList =
                        snapshot.data!;

                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            0,
                                            pageViewEventImagesRecordList
                                                    .length -
                                                1))),
                            scrollDirection: Axis.horizontal,
                            itemCount: pageViewEventImagesRecordList.length,
                            itemBuilder: (context, pageViewIndex) {
                              final pageViewEventImagesRecord =
                                  pageViewEventImagesRecordList[pageViewIndex];
                              return SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 100),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 100),
                                        imageUrl: getCORSProxyUrl(
                                          pageViewEventImagesRecord.url,
                                        ),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    if (widget.gradient)
                                      wrapWithModel(
                                        model: _model.gradientModels2.getModel(
                                          pageViewEventImagesRecord
                                              .reference.id,
                                          pageViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: GradientWidget(
                                          key: Key(
                                            'Key961_${pageViewEventImagesRecord.reference.id}',
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: max(
                                            0,
                                            min(
                                                0,
                                                pageViewEventImagesRecordList
                                                        .length -
                                                    1))),
                                count: pageViewEventImagesRecordList.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  safeSetState(() {});
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
