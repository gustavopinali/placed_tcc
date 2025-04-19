import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_banner/user_banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_profile_card_model.dart';
export 'user_profile_card_model.dart';

class UserProfileCardWidget extends StatefulWidget {
  const UserProfileCardWidget({
    super.key,
    required this.userDoc,
    this.actionToSettings,
  });

  final UsersRecord? userDoc;
  final Future Function()? actionToSettings;

  @override
  State<UserProfileCardWidget> createState() => _UserProfileCardWidgetState();
}

class _UserProfileCardWidgetState extends State<UserProfileCardWidget> {
  late UserProfileCardModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userLikedQuery = await queryUserLikesRecordOnce(
        parent: widget.userDoc?.reference,
        queryBuilder: (userLikesRecord) => userLikesRecord.where(
          'userRef',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.userLikedQuery != null) {
        _model.userLiked = _model.userLikedQuery!.active;
        safeSetState(() {});
      } else {
        _model.userLiked = false;
        safeSetState(() {});
      }
    });

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
      width: MediaQuery.sizeOf(context).width < kBreakpointSmall
          ? MediaQuery.sizeOf(context).width
          : (MediaQuery.sizeOf(context).width * 0.4),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 650.0,
            decoration: const BoxDecoration(),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Container(
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: wrapWithModel(
                                model: _model.userBannerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: UserBannerWidget(
                                  userDoc: widget.userDoc!,
                                  hideTopData: false,
                                  hideBottomData: false,
                                  hideGradient: false,
                                  inProfile: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: StreamBuilder<List<UserLikesRecord>>(
                              stream: queryUserLikesRecord(
                                parent: widget.userDoc?.reference,
                                queryBuilder: (userLikesRecord) =>
                                    userLikesRecord
                                        .where(
                                          'userRef',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'active',
                                          isEqualTo: true,
                                        ),
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserLikesRecord>
                                    conditionalBuilderUserLikesRecordList =
                                    snapshot.data!;
                                final conditionalBuilderUserLikesRecord =
                                    conditionalBuilderUserLikesRecordList
                                            .isNotEmpty
                                        ? conditionalBuilderUserLikesRecordList
                                            .first
                                        : null;

                                return Builder(
                                  builder: (context) {
                                    if (_model.userLiked) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 25.0,
                                          buttonSize: 50.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .redApple,
                                          icon: Icon(
                                            Icons.favorite_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .placedWhite,
                                            size: 24.0,
                                          ),
                                          onPressed:
                                              (widget.userDoc?.reference ==
                                                      currentUserReference)
                                                  ? null
                                                  : () async {
                                                      _model.userLiked = false;
                                                      safeSetState(() {});

                                                      await conditionalBuilderUserLikesRecord!
                                                          .reference
                                                          .update(
                                                              createUserLikesRecordData(
                                                        active: false,
                                                      ));
                                                    },
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 25.0,
                                          buttonSize: 50.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .redApple,
                                          icon: Icon(
                                            Icons.favorite_border_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .placedWhite,
                                            size: 24.0,
                                          ),
                                          onPressed: (widget
                                                      .userDoc?.reference ==
                                                  currentUserReference)
                                              ? null
                                              : () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              const LatLng(0.0, 0.0));
                                                  _model.userLiked = true;
                                                  safeSetState(() {});

                                                  await UserLikesRecord
                                                      .createDoc(
                                                    widget.userDoc!.reference,
                                                    id: currentUserReference!
                                                        .id,
                                                  ).set({
                                                    ...createUserLikesRecordData(
                                                      userRef:
                                                          currentUserReference,
                                                      location:
                                                          currentUserLocationValue,
                                                      active: true,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'createdAt': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                },
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 100),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 100),
                                    imageUrl: getCORSProxyUrl(
                                      widget.userDoc!.photoUrl,
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (widget.userDoc?.reference !=
                                    currentUserReference) {
                                  return StreamBuilder<List<FriendshipsRecord>>(
                                    stream: queryFriendshipsRecord(
                                      queryBuilder: (friendshipsRecord) =>
                                          friendshipsRecord
                                              .where(
                                                'userRequesting',
                                                isEqualTo: currentUserReference,
                                              )
                                              .where(
                                                'userRequested',
                                                isEqualTo:
                                                    widget.userDoc?.reference,
                                              )
                                              .where(
                                                'active',
                                                isEqualTo: true,
                                              ),
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<FriendshipsRecord>
                                          conditionalBuilderFriendshipsRecordList =
                                          snapshot.data!;
                                      final conditionalBuilderFriendshipsRecord =
                                          conditionalBuilderFriendshipsRecordList
                                                  .isNotEmpty
                                              ? conditionalBuilderFriendshipsRecordList
                                                  .first
                                              : null;

                                      return Builder(
                                        builder: (context) {
                                          if (conditionalBuilderFriendshipsRecord !=
                                              null) {
                                            return Builder(
                                              builder: (context) {
                                                if (conditionalBuilderFriendshipsRecord
                                                        .accepted ??
                                                    false) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(3.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 25.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.person_remove,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: (widget
                                                                  .userDoc
                                                                  ?.reference ==
                                                              currentUserReference)
                                                          ? null
                                                          : () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Finalizar amizade'),
                                                                            content:
                                                                                const Text('Deseja finalizar sua amizade?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: const Text('Não'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: const Text('Sim'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                await conditionalBuilderFriendshipsRecord
                                                                    .reference
                                                                    .update(
                                                                        createFriendshipsRecordData(
                                                                  active: false,
                                                                ));
                                                              }
                                                            },
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(3.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 25.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons
                                                            .person_add_disabled,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: (widget
                                                                  .userDoc
                                                                  ?.reference ==
                                                              currentUserReference)
                                                          ? null
                                                          : () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Finalizar solicitação de amizade'),
                                                                            content:
                                                                                const Text('Deseja finalizar sua solicitação de amizade?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: const Text('Não'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: const Text('Sim'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                await conditionalBuilderFriendshipsRecord
                                                                    .reference
                                                                    .update(
                                                                        createFriendshipsRecordData(
                                                                  active: false,
                                                                ));
                                                              }
                                                            },
                                                    ),
                                                  );
                                                }
                                              },
                                            );
                                          } else {
                                            return StreamBuilder<
                                                List<FriendshipsRecord>>(
                                              stream: queryFriendshipsRecord(
                                                queryBuilder:
                                                    (friendshipsRecord) =>
                                                        friendshipsRecord
                                                            .where(
                                                              'userRequesting',
                                                              isEqualTo: widget
                                                                  .userDoc
                                                                  ?.reference,
                                                            )
                                                            .where(
                                                              'userRequested',
                                                              isEqualTo:
                                                                  currentUserReference,
                                                            )
                                                            .where(
                                                              'active',
                                                              isEqualTo: true,
                                                            ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FriendshipsRecord>
                                                    conditionalBuilderFriendshipsRecordList =
                                                    snapshot.data!;
                                                final conditionalBuilderFriendshipsRecord =
                                                    conditionalBuilderFriendshipsRecordList
                                                            .isNotEmpty
                                                        ? conditionalBuilderFriendshipsRecordList
                                                            .first
                                                        : null;

                                                return Builder(
                                                  builder: (context) {
                                                    if (conditionalBuilderFriendshipsRecord !=
                                                        null) {
                                                      return Builder(
                                                        builder: (context) {
                                                          if (conditionalBuilderFriendshipsRecord
                                                                  .accepted ??
                                                              false) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    25.0,
                                                                buttonSize:
                                                                    50.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .person_remove,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: (widget
                                                                            .userDoc
                                                                            ?.reference ==
                                                                        currentUserReference)
                                                                    ? null
                                                                    : () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: const Text('Finalizar amizade'),
                                                                                  content: const Text('Deseja finalizar sua amizade?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: const Text('Não'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: const Text('Sim'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await conditionalBuilderFriendshipsRecord
                                                                              .reference
                                                                              .update(createFriendshipsRecordData(
                                                                            active:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    25.0,
                                                                buttonSize:
                                                                    50.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .person_add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: (widget
                                                                            .userDoc
                                                                            ?.reference ==
                                                                        currentUserReference)
                                                                    ? null
                                                                    : () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: const Text('Aceitar amizade'),
                                                                                  content: const Text('Deseja aceitar sua amizade?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: const Text('Não'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: const Text('Sim'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await conditionalBuilderFriendshipsRecord
                                                                              .reference
                                                                              .update({
                                                                            ...createFriendshipsRecordData(
                                                                              accepted: true,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'acceptedAt': FieldValue.serverTimestamp(),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.all(3.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 25.0,
                                                          buttonSize: 50.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          icon: Icon(
                                                            Icons
                                                                .person_add_alt_1,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            var shouldSetState =
                                                                false;
                                                            if (widget.userDoc
                                                                    ?.reference !=
                                                                currentUserReference) {
                                                              var friendshipsRecordReference =
                                                                  FriendshipsRecord
                                                                      .collection
                                                                      .doc();
                                                              await friendshipsRecordReference
                                                                  .set({
                                                                ...createFriendshipsRecordData(
                                                                  active: true,
                                                                  userRequesting:
                                                                      currentUserReference,
                                                                  userRequested:
                                                                      widget
                                                                          .userDoc
                                                                          ?.reference,
                                                                  accepted:
                                                                      false,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': [
                                                                      currentUserReference
                                                                    ],
                                                                    'createdAt':
                                                                        FieldValue
                                                                            .serverTimestamp(),
                                                                  },
                                                                ),
                                                              });
                                                              _model.newFriendship =
                                                                  FriendshipsRecord
                                                                      .getDocumentFromData({
                                                                ...createFriendshipsRecordData(
                                                                  active: true,
                                                                  userRequesting:
                                                                      currentUserReference,
                                                                  userRequested:
                                                                      widget
                                                                          .userDoc
                                                                          ?.reference,
                                                                  accepted:
                                                                      false,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': [
                                                                      currentUserReference
                                                                    ],
                                                                    'createdAt':
                                                                        DateTime
                                                                            .now(),
                                                                  },
                                                                ),
                                                              }, friendshipsRecordReference);
                                                              shouldSetState =
                                                                  true;
                                                              unawaited(
                                                                () async {
                                                                  await _model
                                                                      .newFriendship!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'users':
                                                                            FieldValue.arrayUnion([
                                                                          widget
                                                                              .userDoc
                                                                              ?.reference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                }(),
                                                              );
                                                              if (shouldSetState) {
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              return;
                                                            } else {
                                                              if (shouldSetState) {
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 25.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.edit,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await widget.actionToSettings?.call();
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ].divide(const SizedBox(width: 30.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.userDoc!.displayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Poppins'),
                                ),
                          ),
                          Text(
                            widget.userDoc!.username,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Poppins'),
                                ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(width: 20.0)),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  height: 50.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: queryPostsRecordCount(
                                  queryBuilder: (postsRecord) =>
                                      postsRecord.where(
                                    'userRef',
                                    isEqualTo: widget.userDoc?.reference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
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
                                  int textCount = snapshot.data!;

                                  return Text(
                                    formatNumber(
                                      textCount,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sj0jm84k' /* Posts */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: queryUserLikesRecordCount(
                                  parent: widget.userDoc?.reference,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
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
                                  int textCount = snapshot.data!;

                                  return Text(
                                    formatNumber(
                                      textCount,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bgtodfew' /* Likes */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: queryVisitsRecordCount(
                                  queryBuilder: (visitsRecord) =>
                                      visitsRecord.where(
                                    'userRef',
                                    isEqualTo: widget.userDoc?.reference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
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
                                  int textCount = snapshot.data!;

                                  return Text(
                                    formatNumber(
                                      textCount,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'vcmr65vk' /* Visitas */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fpq7o58b' /* Visitas */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<int>(
                              future: queryVisitsRecordCount(
                                queryBuilder: (visitsRecord) =>
                                    visitsRecord.where(
                                  'userRef',
                                  isEqualTo: widget.userDoc?.reference,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                int textCount = snapshot.data!;

                                return Text(
                                  formatNumber(
                                    textCount,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(width: 5.0)),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  height: 50.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '9wtvlorb' /* Posts */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<int>(
                              future: queryPostsRecordCount(
                                queryBuilder: (postsRecord) =>
                                    postsRecord.where(
                                  'userRef',
                                  isEqualTo: widget.userDoc?.reference,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                int textCount = snapshot.data!;

                                return Text(
                                  formatNumber(
                                    textCount,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                );
                              },
                            ),
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                      SizedBox(
                        height: 25.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'nr07fosq' /* Likes */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<int>(
                              future: queryUserLikesRecordCount(
                                parent: widget.userDoc?.reference,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                int textCount = snapshot.data!;

                                return Text(
                                  formatNumber(
                                    textCount,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                );
                              },
                            ),
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                      SizedBox(
                        height: 25.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vgh901zz' /* Visitas */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<int>(
                              future: queryVisitsRecordCount(
                                queryBuilder: (visitsRecord) =>
                                    visitsRecord.where(
                                  'userRef',
                                  isEqualTo: widget.userDoc?.reference,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                int textCount = snapshot.data!;

                                return Text(
                                  formatNumber(
                                    textCount,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                );
                              },
                            ),
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                    ].divide(const SizedBox(width: 12.0)),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.userDoc?.hasUserLinks() ?? true)
                      Builder(
                        builder: (context) {
                          if ((widget.userDoc?.userConfig
                                      .showOnProfileLinks ==
                                  'T') ||
                              (widget.userDoc?.reference ==
                                  currentUserReference)) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (widget.userDoc?.userLinks.whatsapp !=
                                          null &&
                                      widget.userDoc?.userLinks.whatsapp !=
                                          '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 10.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: FaIcon(
                                          FontAwesomeIcons.whatsapp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'https://wa.me/${currentUserDocument?.userLinks.whatsapp}');
                                        },
                                      ),
                                    ),
                                  if (widget.userDoc?.userLinks.instagram !=
                                          null &&
                                      widget.userDoc?.userLinks.instagram !=
                                          '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 10.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: FaIcon(
                                          FontAwesomeIcons.instagram,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'https://instagram.com/${widget.userDoc?.userLinks.instagram}');
                                        },
                                      ),
                                    ),
                                  if (widget.userDoc?.userLinks.facebook !=
                                          null &&
                                      widget.userDoc?.userLinks.facebook !=
                                          '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 10.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: FaIcon(
                                          FontAwesomeIcons.facebookF,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'https://facebook.com/${widget.userDoc?.userLinks.facebook}');
                                        },
                                      ),
                                    ),
                                  if (widget.userDoc?.userLinks.twiter !=
                                          null &&
                                      widget.userDoc?.userLinks.twiter != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 10.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              'https://twitter.com/${widget.userDoc?.userLinks.twiter}');
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            );
                          } else if (widget
                                  .userDoc?.userConfig.showOnProfileLinks ==
                              'A') {
                            return StreamBuilder<List<FriendshipsRecord>>(
                              stream: queryFriendshipsRecord(
                                queryBuilder: (friendshipsRecord) =>
                                    friendshipsRecord
                                        .where(
                                          'userRequesting',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'userRequested',
                                          isEqualTo: widget.userDoc?.reference,
                                        )
                                        .where(
                                          'active',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'accepted',
                                          isEqualTo: true,
                                        ),
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FriendshipsRecord>
                                    conditionalBuilderFriendshipsRecordList =
                                    snapshot.data!;
                                final conditionalBuilderFriendshipsRecord =
                                    conditionalBuilderFriendshipsRecordList
                                            .isNotEmpty
                                        ? conditionalBuilderFriendshipsRecordList
                                            .first
                                        : null;

                                return Builder(
                                  builder: (context) {
                                    if (conditionalBuilderFriendshipsRecord !=
                                        null) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (widget.userDoc?.userLinks
                                                        .whatsapp !=
                                                    null &&
                                                widget.userDoc?.userLinks
                                                        .whatsapp !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.whatsapp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await launchURL(
                                                        'https://wa.me/${currentUserDocument?.userLinks.whatsapp}');
                                                  },
                                                ),
                                              ),
                                            if (widget.userDoc?.userLinks
                                                        .instagram !=
                                                    null &&
                                                widget.userDoc?.userLinks
                                                        .instagram !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await launchURL(
                                                        'https://instagram.com/${widget.userDoc?.userLinks.instagram}');
                                                  },
                                                ),
                                              ),
                                            if (widget.userDoc?.userLinks
                                                        .facebook !=
                                                    null &&
                                                widget.userDoc?.userLinks
                                                        .facebook !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.facebookF,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () async {
                                                    await launchURL(
                                                        'https://facebook.com/${widget.userDoc?.userLinks.facebook}');
                                                  },
                                                ),
                                              ),
                                            if (widget.userDoc?.userLinks
                                                        .twiter !=
                                                    null &&
                                                widget.userDoc?.userLinks
                                                        .twiter !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.twitter,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () async {
                                                    await launchURL(
                                                        'https://twitter.com/${widget.userDoc?.userLinks.twiter}');
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: StreamBuilder<
                                            List<FriendshipsRecord>>(
                                          stream: queryFriendshipsRecord(
                                            queryBuilder: (friendshipsRecord) =>
                                                friendshipsRecord
                                                    .where(
                                                      'userRequesting',
                                                      isEqualTo: widget
                                                          .userDoc?.reference,
                                                    )
                                                    .where(
                                                      'userRequested',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'active',
                                                      isEqualTo: true,
                                                    )
                                                    .where(
                                                      'accepted',
                                                      isEqualTo: true,
                                                    ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<FriendshipsRecord>
                                                rowFriendshipsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final rowFriendshipsRecord =
                                                rowFriendshipsRecordList
                                                        .isNotEmpty
                                                    ? rowFriendshipsRecordList
                                                        .first
                                                    : null;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (widget.userDoc?.userLinks
                                                            .whatsapp !=
                                                        null &&
                                                    widget.userDoc?.userLinks
                                                            .whatsapp !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 10.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .whatsapp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await launchURL(
                                                            'https://wa.me/${currentUserDocument?.userLinks.whatsapp}');
                                                      },
                                                    ),
                                                  ),
                                                if (widget.userDoc?.userLinks
                                                            .instagram !=
                                                        null &&
                                                    widget.userDoc?.userLinks
                                                            .instagram !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 10.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .instagram,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await launchURL(
                                                            'https://instagram.com/${widget.userDoc?.userLinks.instagram}');
                                                      },
                                                    ),
                                                  ),
                                                if (widget.userDoc?.userLinks
                                                            .facebook !=
                                                        null &&
                                                    widget.userDoc?.userLinks
                                                            .facebook !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 10.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .facebookF,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 15.0,
                                                      ),
                                                      onPressed: () async {
                                                        await launchURL(
                                                            'https://facebook.com/${widget.userDoc?.userLinks.facebook}');
                                                      },
                                                    ),
                                                  ),
                                                if (widget.userDoc?.userLinks
                                                            .twiter !=
                                                        null &&
                                                    widget.userDoc?.userLinks
                                                            .twiter !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .twitter,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 15.0,
                                                      ),
                                                      onPressed: () async {
                                                        await launchURL(
                                                            'https://twitter.com/${widget.userDoc?.userLinks.twiter}');
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          } else {
                            return const Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 6.0)),
          ),
        ],
      ),
    );
  }
}
