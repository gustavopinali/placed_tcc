import '/backend/backend.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'relationship_comp_model.dart';
export 'relationship_comp_model.dart';

class RelationshipCompWidget extends StatefulWidget {
  const RelationshipCompWidget({super.key});

  @override
  State<RelationshipCompWidget> createState() => _RelationshipCompWidgetState();
}

class _RelationshipCompWidgetState extends State<RelationshipCompWidget>
    with TickerProviderStateMixin {
  late RelationshipCompModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelationshipCompModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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
      );
    }

    return FutureBuilder<List<UsersRecord>>(
      future: FFAppState().placedUsers(
        uniqueQueryKey: dateTimeFormat(
          "d/M/y h",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        requestFn: () => UsersRecord.search(
          location: FFAppState().customLocation
              ? FFAppState().customLocationLatLng
              : currentUserLocationValue,
          searchRadiusMeters: 5000000.0,
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
        List<UsersRecord> containerUsersRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 500.0,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Builder(
                      builder: (context) {
                        final userFromAll = containerUsersRecordList.toList();

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.75,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: userFromAll.length,
                          itemBuilder: (context, userFromAllIndex) {
                            final userFromAllItem =
                                userFromAll[userFromAllIndex];
                            return wrapWithModel(
                              model: _model.userCardModels1.getModel(
                                userFromAllItem.reference.id,
                                userFromAllIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserCardWidget(
                                key: Key(
                                  'Keywx1_${userFromAllItem.reference.id}',
                                ),
                                user: userFromAllItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        final userFromRelationships = containerUsersRecordList
                            .where((e) => valueOrDefault<bool>(
                                  e.userInterests.relationships,
                                  false,
                                ))
                            .toList();

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.75,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: userFromRelationships.length,
                          itemBuilder: (context, userFromRelationshipsIndex) {
                            final userFromRelationshipsItem =
                                userFromRelationships[
                                    userFromRelationshipsIndex];
                            return wrapWithModel(
                              model: _model.userCardModels2.getModel(
                                userFromRelationshipsItem.reference.id,
                                userFromRelationshipsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserCardWidget(
                                key: Key(
                                  'Keyg2u_${userFromRelationshipsItem.reference.id}',
                                ),
                                user: userFromRelationshipsItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        final userFromFriendships = containerUsersRecordList
                            .where((e) => e.userInterests.friendships)
                            .toList();

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.75,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: userFromFriendships.length,
                          itemBuilder: (context, userFromFriendshipsIndex) {
                            final userFromFriendshipsItem =
                                userFromFriendships[userFromFriendshipsIndex];
                            return wrapWithModel(
                              model: _model.userCardModels3.getModel(
                                userFromFriendshipsItem.reference.id,
                                userFromFriendshipsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserCardWidget(
                                key: Key(
                                  'Keyoai_${userFromFriendshipsItem.reference.id}',
                                ),
                                user: userFromFriendshipsItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.people,
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'g864f1b8' /*  */,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'kacp44ly' /*  */,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.smile,
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            't9ij6lkc' /*  */,
                          ),
                        ),
                      ],
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}, () async {}][i]();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
