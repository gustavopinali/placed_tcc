import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/animation_like_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future<UserLikesRecord> userLike(
  BuildContext context, {
  required DocumentReference? userRef,
}) async {
  UserLikesRecord? checkUserLike;
  UserLikesRecord? checkedUserLike;
  UserLikesRecord? newUserLike;

  checkUserLike = await queryUserLikesRecordOnce(
    parent: userRef,
    queryBuilder: (userLikesRecord) => userLikesRecord.where(
      'userRef',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (checkUserLike != null) {
    await checkUserLike.reference.update(createUserLikesRecordData(
      active: !checkUserLike.active,
    ));
    checkedUserLike =
        await UserLikesRecord.getDocumentOnce(checkUserLike.reference);
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: SizedBox(
            height: double.infinity,
            child: AnimationLikeWidget(
              value: checkedUserLike!.active,
            ),
          ),
        );
      },
    );

    return checkedUserLike;
  } else {
    var userLikesRecordReference2 = UserLikesRecord.createDoc(
      userRef!,
      id: currentUserReference!.id,
    );
    await userLikesRecordReference2.set({
      ...createUserLikesRecordData(
        userRef: currentUserReference,
        active: true,
        createdAt: getCurrentTimestamp,
      ),
      ...mapToFirestore(
        {
          'users': [currentUserReference],
        },
      ),
    });
    newUserLike = UserLikesRecord.getDocumentFromData({
      ...createUserLikesRecordData(
        userRef: currentUserReference,
        active: true,
        createdAt: getCurrentTimestamp,
      ),
      ...mapToFirestore(
        {
          'users': [currentUserReference],
        },
      ),
    }, userLikesRecordReference2);

    await newUserLike.reference.update({
      ...mapToFirestore(
        {
          'users': FieldValue.arrayUnion([userRef]),
        },
      ),
    });
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: const SizedBox(
            height: double.infinity,
            child: AnimationLikeWidget(
              value: true,
            ),
          ),
        );
      },
    );

    return newUserLike;
  }
}

Future placeFollow(
  BuildContext context, {
  required DocumentReference? placeRef,
}) async {
  UserFollowedPlacesRecord? checkPlaceFollowed;
  UserFollowedPlacesRecord? checkedPlaceFollowed;
  UserFollowedPlacesRecord? newFollowPlace;

  checkPlaceFollowed = await queryUserFollowedPlacesRecordOnce(
    parent: currentUserReference,
    queryBuilder: (userFollowedPlacesRecord) => userFollowedPlacesRecord.where(
      'placeRef',
      isEqualTo: placeRef,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (checkPlaceFollowed != null) {
    await checkPlaceFollowed.reference
        .update(createUserFollowedPlacesRecordData(
      active: !checkPlaceFollowed.active,
    ));
    checkedPlaceFollowed = await UserFollowedPlacesRecord.getDocumentOnce(
        checkPlaceFollowed.reference);
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: SizedBox(
            height: double.infinity,
            child: AnimationLikeWidget(
              value: checkedPlaceFollowed!.active,
            ),
          ),
        );
      },
    );

    return;
  } else {
    var userFollowedPlacesRecordReference2 = UserFollowedPlacesRecord.createDoc(
      currentUserReference!,
      id: placeRef!.id,
    );
    await userFollowedPlacesRecordReference2
        .set(createUserFollowedPlacesRecordData(
      active: true,
      createdAt: getCurrentTimestamp,
      placeRef: placeRef,
    ));
    newFollowPlace = UserFollowedPlacesRecord.getDocumentFromData(
        createUserFollowedPlacesRecordData(
          active: true,
          createdAt: getCurrentTimestamp,
          placeRef: placeRef,
        ),
        userFollowedPlacesRecordReference2);
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: const SizedBox(
            height: double.infinity,
            child: AnimationLikeWidget(
              value: true,
            ),
          ),
        );
      },
    );

    return;
  }
}

Future checkUser(BuildContext context) async {
  LatLng currentUserLocationValue =
      await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));

  await Future.wait([
    Future(() async {
      if (currentUserDocument?.userStatus == null) {
        await currentUserReference!.update(createUsersRecordData(
          userStatus: createUserStatusStruct(
            active: true,
            searchable: false,
            onboarding: false,
            fieldValues: {
              'createdAt': FieldValue.serverTimestamp(),
            },
            clearUnsetFields: false,
          ),
        ));
      }
      if (!currentUserDocument!.userStatus.onboarding) {
        context.goNamed('Onboarding');
      }
    }),
    Future(() async {
      if (functions.checkLatLongNotNull(currentUserLocationValue)) {
        unawaited(
          () async {
            await currentUserReference!.update(createUsersRecordData(
              location: currentUserLocationValue,
            ));
          }(),
        );

        await UserLocationsRecord.createDoc(currentUserReference!).set({
          ...createUserLocationsRecordData(
            location: currentUserLocationValue,
          ),
          ...mapToFirestore(
            {
              'date': FieldValue.serverTimestamp(),
            },
          ),
        });
      }
    }),
  ]);
}
