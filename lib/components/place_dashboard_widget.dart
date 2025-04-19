import '/backend/backend.dart';
import '/components/list_h_place2/list_h_place2_widget.dart';
import '/components/post_card_widget.dart';
import '/components/user_card100/user_card100_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'place_dashboard_model.dart';
export 'place_dashboard_model.dart';

class PlaceDashboardWidget extends StatefulWidget {
  const PlaceDashboardWidget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlaceDashboardWidget> createState() => _PlaceDashboardWidgetState();
}

class _PlaceDashboardWidgetState extends State<PlaceDashboardWidget> {
  late PlaceDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceDashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.85,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: wrapWithModel(
                        model: _model.listHPlace2Model,
                        updateCallback: () => safeSetState(() {}),
                        child: Hero(
                          tag: 'placeHeroTag',
                          transitionOnUserGestures: true,
                          child: Material(
                            color: Colors.transparent,
                            child: ListHPlace2Widget(
                              placeDoc: widget.placeDoc!,
                              pageView: true,
                              link: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              getCORSProxyUrl(
                                                'https://c.files.bbci.co.uk/ECA7/production/_131938506_ind3bc40c5f1c10d4248e6bf848ae7033c8814005e9-1.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                getCORSProxyUrl(
                                                  'https://c.files.bbci.co.uk/ECA7/production/_131938506_ind3bc40c5f1c10d4248e6bf848ae7033c8814005e9-1.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                getCORSProxyUrl(
                                                  'https://c.files.bbci.co.uk/ECA7/production/_131938506_ind3bc40c5f1c10d4248e6bf848ae7033c8814005e9-1.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    60.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                getCORSProxyUrl(
                                                  'https://c.files.bbci.co.uk/ECA7/production/_131938506_ind3bc40c5f1c10d4248e6bf848ae7033c8814005e9-1.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7cpsqyc3' /* 20 Visitantes */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xy658cdb' /* Avaliações */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  buttonSize: double.infinity,
                                  fillColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  icon: Icon(
                                    Icons.meeting_room_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              StreamBuilder<List<VisitsRecord>>(
                stream: queryVisitsRecord(
                  queryBuilder: (visitsRecord) => visitsRecord
                      .where(
                        'checkOut',
                        isNotEqualTo: true,
                      )
                      .where(
                        'placeRef',
                        isEqualTo: widget.placeDoc?.reference,
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
                  List<VisitsRecord> containerVisitsRecordList = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: 120.0,
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final visit = containerVisitsRecordList.toList();

                        return ListView.builder(
                          padding: const EdgeInsets.fromLTRB(
                            12.0,
                            0,
                            12.0,
                            0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: visit.length,
                          itemBuilder: (context, visitIndex) {
                            final visitItem = visit[visitIndex];
                            return StreamBuilder<UsersRecord>(
                              stream:
                                  UsersRecord.getDocument(visitItem.userRef!),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final userCard100UsersRecord = snapshot.data!;

                                return wrapWithModel(
                                  model: _model.userCard100Models.getModel(
                                    userCard100UsersRecord.reference.id,
                                    visitIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserCard100Widget(
                                    key: Key(
                                      'Key3yv_${userCard100UsersRecord.reference.id}',
                                    ),
                                    userDoc: userCard100UsersRecord,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.image_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: (_model.tabIndex == 0)
                                              ? null
                                              : () async {
                                                  _model.tabIndex = 0;
                                                  safeSetState(() {});
                                                },
                                        ),
                                      ),
                                      Expanded(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.place_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: (_model.tabIndex == 1)
                                              ? null
                                              : () async {
                                                  _model.tabIndex = 1;
                                                  safeSetState(() {});
                                                },
                                        ),
                                      ),
                                      Expanded(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.event,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: (_model.tabIndex == 2)
                                              ? null
                                              : () async {
                                                  _model.tabIndex = 2;
                                                  safeSetState(() {});
                                                },
                                        ),
                                      ),
                                      Expanded(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.group,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: (_model.tabIndex == 3)
                                              ? null
                                              : () async {
                                                  _model.tabIndex = 3;
                                                  safeSetState(() {});
                                                },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (_model.tabIndex == 0) {
                                  return StreamBuilder<List<PostsRecord>>(
                                    stream: queryPostsRecord(),
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
                                      List<PostsRecord>
                                          containerPostsRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final post =
                                                containerPostsRecordList
                                                    .toList();

                                            return MasonryGridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                              ),
                                              crossAxisSpacing: 6.0,
                                              mainAxisSpacing: 6.0,
                                              itemCount: post.length,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (context, postIndex) {
                                                final postItem =
                                                    post[postIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Posts',
                                                      queryParameters: {
                                                        'index': serializeParam(
                                                          postIndex,
                                                          ParamType.int,
                                                        ),
                                                        'posts': serializeParam(
                                                          containerPostsRecordList,
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'posts':
                                                            containerPostsRecordList,
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.postCardModels
                                                        .getModel(
                                                      postItem.reference.id,
                                                      postIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: PostCardWidget(
                                                      key: Key(
                                                        'Keyxzv_${postItem.reference.id}',
                                                      ),
                                                      postDoc: postItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
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
                          ),
                        ],
                      ),
                    ].addToEnd(const SizedBox(height: 120.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
