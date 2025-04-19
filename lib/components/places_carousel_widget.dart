import '/backend/backend.dart';
import '/components/place_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'places_carousel_model.dart';
export 'places_carousel_model.dart';

class PlacesCarouselWidget extends StatefulWidget {
  const PlacesCarouselWidget({
    super.key,
    required this.placeRef,
    int? index,
    required this.placeDocList,
  }) : index = index ?? 0;

  final DocumentReference? placeRef;
  final int index;
  final List<PlacesRecord>? placeDocList;

  @override
  State<PlacesCarouselWidget> createState() => _PlacesCarouselWidgetState();
}

class _PlacesCarouselWidgetState extends State<PlacesCarouselWidget> {
  late PlacesCarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacesCarouselModel());

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
              final placeDoc = widget.placeDocList!.toList();

              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: placeDoc.length,
                  itemBuilder: (context, placeDocIndex, _) {
                    final placeDocItem = placeDoc[placeDocIndex];
                    return wrapWithModel(
                      model: _model.placeCardBannerModels.getModel(
                        placeDocItem.reference.id,
                        placeDocIndex,
                      ),
                      updateCallback: () => safeSetState(() {}),
                      child: PlaceCardBannerWidget(
                        key: Key(
                          'Keykwx_${placeDocItem.reference.id}',
                        ),
                        placeDoc: placeDocItem,
                      ),
                    );
                  },
                  carouselController: _model.carouselController ??=
                      CarouselController(),
                  options: CarouselOptions(
                    initialPage: max(
                        0,
                        min(
                            valueOrDefault<int>(
                              widget.index,
                              0,
                            ),
                            placeDoc.length - 1)),
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).placedWhite,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).placedBlack,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
