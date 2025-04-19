// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StripeSubscriptionDataStruct extends FFFirebaseStruct {
  StripeSubscriptionDataStruct({
    String? checkoutRef,
    String? placeRef,
    String? userRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checkoutRef = checkoutRef,
        _placeRef = placeRef,
        _userRef = userRef,
        super(firestoreUtilData);

  // "checkoutRef" field.
  String? _checkoutRef;
  String get checkoutRef => _checkoutRef ?? '';
  set checkoutRef(String? val) => _checkoutRef = val;

  bool hasCheckoutRef() => _checkoutRef != null;

  // "placeRef" field.
  String? _placeRef;
  String get placeRef => _placeRef ?? '';
  set placeRef(String? val) => _placeRef = val;

  bool hasPlaceRef() => _placeRef != null;

  // "userRef" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  set userRef(String? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  static StripeSubscriptionDataStruct fromMap(Map<String, dynamic> data) =>
      StripeSubscriptionDataStruct(
        checkoutRef: data['checkoutRef'] as String?,
        placeRef: data['placeRef'] as String?,
        userRef: data['userRef'] as String?,
      );

  static StripeSubscriptionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeSubscriptionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'checkoutRef': _checkoutRef,
        'placeRef': _placeRef,
        'userRef': _userRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checkoutRef': serializeParam(
          _checkoutRef,
          ParamType.String,
        ),
        'placeRef': serializeParam(
          _placeRef,
          ParamType.String,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeSubscriptionDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StripeSubscriptionDataStruct(
        checkoutRef: deserializeParam(
          data['checkoutRef'],
          ParamType.String,
          false,
        ),
        placeRef: deserializeParam(
          data['placeRef'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.String,
          false,
        ),
      );

  static StripeSubscriptionDataStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      StripeSubscriptionDataStruct(
        checkoutRef: convertAlgoliaParam(
          data['checkoutRef'],
          ParamType.String,
          false,
        ),
        placeRef: convertAlgoliaParam(
          data['placeRef'],
          ParamType.String,
          false,
        ),
        userRef: convertAlgoliaParam(
          data['userRef'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripeSubscriptionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripeSubscriptionDataStruct &&
        checkoutRef == other.checkoutRef &&
        placeRef == other.placeRef &&
        userRef == other.userRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([checkoutRef, placeRef, userRef]);
}

StripeSubscriptionDataStruct createStripeSubscriptionDataStruct({
  String? checkoutRef,
  String? placeRef,
  String? userRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeSubscriptionDataStruct(
      checkoutRef: checkoutRef,
      placeRef: placeRef,
      userRef: userRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeSubscriptionDataStruct? updateStripeSubscriptionDataStruct(
  StripeSubscriptionDataStruct? stripeSubscriptionData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeSubscriptionData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeSubscriptionDataStructData(
  Map<String, dynamic> firestoreData,
  StripeSubscriptionDataStruct? stripeSubscriptionData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeSubscriptionData == null) {
    return;
  }
  if (stripeSubscriptionData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      stripeSubscriptionData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeSubscriptionDataData = getStripeSubscriptionDataFirestoreData(
      stripeSubscriptionData, forFieldValue);
  final nestedData =
      stripeSubscriptionDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      stripeSubscriptionData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeSubscriptionDataFirestoreData(
  StripeSubscriptionDataStruct? stripeSubscriptionData, [
  bool forFieldValue = false,
]) {
  if (stripeSubscriptionData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeSubscriptionData.toMap());

  // Add any Firestore field values
  stripeSubscriptionData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeSubscriptionDataListFirestoreData(
  List<StripeSubscriptionDataStruct>? stripeSubscriptionDatas,
) =>
    stripeSubscriptionDatas
        ?.map((e) => getStripeSubscriptionDataFirestoreData(e, true))
        .toList() ??
    [];
