import '/backend/backend.dart';
import '/components/user_card_banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'users_carousel_model.dart';
export 'users_carousel_model.dart';

class UsersCarouselWidget extends StatefulWidget {
  const UsersCarouselWidget({
    super.key,
    required this.userRef,
    int? index,
    required this.usersDocList,
  }) : index = index ?? 0;

  final DocumentReference? userRef;
  final int index;
  final List<UsersRecord>? usersDocList;

  @override
  State<UsersCarouselWidget> createState() => _UsersCarouselWidgetState();
}

class _UsersCarouselWidgetState extends State<UsersCarouselWidget> {
  late UsersCarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersCarouselModel());

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
              final userDoc = widget.usersDocList!.toList();

              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: userDoc.length,
                  itemBuilder: (context, userDocIndex, _) {
                    final userDocItem = userDoc[userDocIndex];
                    return wrapWithModel(
                      model: _model.userCardBannerModels.getModel(
                        userDocItem.reference.id,
                        userDocIndex,
                      ),
                      updateCallback: () => safeSetState(() {}),
                      child: UserCardBannerWidget(
                        key: Key(
                          'Key587_${userDocItem.reference.id}',
                        ),
                        userDoc: userDocItem,
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
                            userDoc.length - 1)),
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
