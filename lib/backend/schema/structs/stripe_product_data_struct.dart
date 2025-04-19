// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StripeProductDataStruct extends FFFirebaseStruct {
  StripeProductDataStruct({
    String? firebaseRole,
    String? placeRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firebaseRole = firebaseRole,
        _placeRef = placeRef,
        super(firestoreUtilData);

  // "firebaseRole" field.
  String? _firebaseRole;
  String get firebaseRole => _firebaseRole ?? '';
  set firebaseRole(String? val) => _firebaseRole = val;

  bool hasFirebaseRole() => _firebaseRole != null;

  // "placeRef" field.
  String? _placeRef;
  String get placeRef => _placeRef ?? '';
  set placeRef(String? val) => _placeRef = val;

  bool hasPlaceRef() => _placeRef != null;

  static StripeProductDataStruct fromMap(Map<String, dynamic> data) =>
      StripeProductDataStruct(
        firebaseRole: data['firebaseRole'] as String?,
        placeRef: data['placeRef'] as String?,
      );

  static StripeProductDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeProductDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'firebaseRole': _firebaseRole,
        'placeRef': _placeRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firebaseRole': serializeParam(
          _firebaseRole,
          ParamType.String,
        ),
        'placeRef': serializeParam(
          _placeRef,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeProductDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StripeProductDataStruct(
        firebaseRole: deserializeParam(
          data['firebaseRole'],
          ParamType.String,
          false,
        ),
        placeRef: deserializeParam(
          data['placeRef'],
          ParamType.String,
          false,
        ),
      );

  static StripeProductDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StripeProductDataStruct(
        firebaseRole: convertAlgoliaParam(
          data['firebaseRole'],
          ParamType.String,
          false,
        ),
        placeRef: convertAlgoliaParam(
          data['placeRef'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripeProductDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripeProductDataStruct &&
        firebaseRole == other.firebaseRole &&
        placeRef == other.placeRef;
  }

  @override
  int get hashCode => const ListEquality().hash([firebaseRole, placeRef]);
}

StripeProductDataStruct createStripeProductDataStruct({
  String? firebaseRole,
  String? placeRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeProductDataStruct(
      firebaseRole: firebaseRole,
      placeRef: placeRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeProductDataStruct? updateStripeProductDataStruct(
  StripeProductDataStruct? stripeProductData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeProductData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeProductDataStructData(
  Map<String, dynamic> firestoreData,
  StripeProductDataStruct? stripeProductData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeProductData == null) {
    return;
  }
  if (stripeProductData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeProductData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeProductDataData =
      getStripeProductDataFirestoreData(stripeProductData, forFieldValue);
  final nestedData =
      stripeProductDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripeProductData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeProductDataFirestoreData(
  StripeProductDataStruct? stripeProductData, [
  bool forFieldValue = false,
]) {
  if (stripeProductData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeProductData.toMap());

  // Add any Firestore field values
  stripeProductData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeProductDataListFirestoreData(
  List<StripeProductDataStruct>? stripeProductDatas,
) =>
    stripeProductDatas
        ?.map((e) => getStripeProductDataFirestoreData(e, true))
        .toList() ??
    [];
