import '/backend/backend.dart';
import '/components/gradient/gradient_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'place_banner_model.dart';
export 'place_banner_model.dart';

class PlaceBannerWidget extends StatefulWidget {
  const PlaceBannerWidget({
    super.key,
    required this.placeDoc,
    bool? pageView,
    bool? gradientTop,
    bool? gradientBotton,
    bool? link,
  })  : pageView = pageView ?? false,
        gradientTop = gradientTop ?? false,
        gradientBotton = gradientBotton ?? false,
        link = link ?? false;

  final PlacesRecord? placeDoc;
  final bool pageView;
  final bool gradientTop;
  final bool gradientBotton;
  final bool link;

  @override
  State<PlaceBannerWidget> createState() => _PlaceBannerWidgetState();
}

class _PlaceBannerWidgetState extends State<PlaceBannerWidget> {
  late PlaceBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceBannerModel());

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
          if (widget.pageView)
            StreamBuilder<List<PlaceImagesRecord>>(
              stream: queryPlaceImagesRecord(
                parent: widget.placeDoc?.reference,
                queryBuilder: (placeImagesRecord) => placeImagesRecord
                    .where(
                      'status.active',
                      isEqualTo: true,
                    )
                    .orderBy('order'),
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
                List<PlaceImagesRecord> pageViewPlaceImagesRecordList =
                    snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(0,
                            min(0, pageViewPlaceImagesRecordList.length - 1))),
                    scrollDirection: Axis.horizontal,
                    itemCount: pageViewPlaceImagesRecordList.length,
                    itemBuilder: (context, pageViewIndex) {
                      final pageViewPlaceImagesRecord =
                          pageViewPlaceImagesRecordList[pageViewIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          getCORSProxyUrl(
                            pageViewPlaceImagesRecord.url,
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
          if (!widget.pageView)
            StreamBuilder<List<PlaceImagesRecord>>(
              stream: queryPlaceImagesRecord(
                parent: widget.placeDoc?.reference,
                queryBuilder: (placeImagesRecord) => placeImagesRecord
                    .where(
                      'status.active',
                      isEqualTo: true,
                    )
                    .orderBy('order'),
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
                List<PlaceImagesRecord> carouselPlaceImagesRecordList =
                    snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: carouselPlaceImagesRecordList.length,
                    itemBuilder: (context, carouselIndex, _) {
                      final carouselPlaceImagesRecord =
                          carouselPlaceImagesRecordList[carouselIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 100),
                          fadeOutDuration: const Duration(milliseconds: 100),
                          imageUrl: getCORSProxyUrl(
                            carouselPlaceImagesRecord.url,
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: max(
                          0, min(1, carouselPlaceImagesRecordList.length - 1)),
                      viewportFraction: 1.0,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                );
              },
            ),
          if (widget.gradientTop || widget.gradientBotton)
            wrapWithModel(
              model: _model.gradientModel,
              updateCallback: () => safeSetState(() {}),
              child: GradientWidget(
                top: widget.gradientTop,
                botton: widget.gradientBotton,
              ),
            ),
          if (widget.pageView)
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await _model.pageViewController?.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await _model.pageViewController?.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                    ),
                  ),
                ),
              ],
            ),
          if (widget.link)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
            ),
        ],
      ),
    );
  }
}
