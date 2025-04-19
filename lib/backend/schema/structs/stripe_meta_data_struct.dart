// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StripeMetaDataStruct extends FFFirebaseStruct {
  StripeMetaDataStruct({
    String? subRef,
    String? subPlaceRef,
    String? subProductRef,
    String? subPlaceProductRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subRef = subRef,
        _subPlaceRef = subPlaceRef,
        _subProductRef = subProductRef,
        _subPlaceProductRef = subPlaceProductRef,
        super(firestoreUtilData);

  // "subRef" field.
  String? _subRef;
  String get subRef => _subRef ?? '';
  set subRef(String? val) => _subRef = val;

  bool hasSubRef() => _subRef != null;

  // "subPlaceRef" field.
  String? _subPlaceRef;
  String get subPlaceRef => _subPlaceRef ?? '';
  set subPlaceRef(String? val) => _subPlaceRef = val;

  bool hasSubPlaceRef() => _subPlaceRef != null;

  // "subProductRef" field.
  String? _subProductRef;
  String get subProductRef => _subProductRef ?? '';
  set subProductRef(String? val) => _subProductRef = val;

  bool hasSubProductRef() => _subProductRef != null;

  // "SubPlaceProductRef" field.
  String? _subPlaceProductRef;
  String get subPlaceProductRef => _subPlaceProductRef ?? '';
  set subPlaceProductRef(String? val) => _subPlaceProductRef = val;

  bool hasSubPlaceProductRef() => _subPlaceProductRef != null;

  static StripeMetaDataStruct fromMap(Map<String, dynamic> data) =>
      StripeMetaDataStruct(
        subRef: data['subRef'] as String?,
        subPlaceRef: data['subPlaceRef'] as String?,
        subProductRef: data['subProductRef'] as String?,
        subPlaceProductRef: data['SubPlaceProductRef'] as String?,
      );

  static StripeMetaDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeMetaDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subRef': _subRef,
        'subPlaceRef': _subPlaceRef,
        'subProductRef': _subProductRef,
        'SubPlaceProductRef': _subPlaceProductRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subRef': serializeParam(
          _subRef,
          ParamType.String,
        ),
        'subPlaceRef': serializeParam(
          _subPlaceRef,
          ParamType.String,
        ),
        'subProductRef': serializeParam(
          _subProductRef,
          ParamType.String,
        ),
        'SubPlaceProductRef': serializeParam(
          _subPlaceProductRef,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeMetaDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StripeMetaDataStruct(
        subRef: deserializeParam(
          data['subRef'],
          ParamType.String,
          false,
        ),
        subPlaceRef: deserializeParam(
          data['subPlaceRef'],
          ParamType.String,
          false,
        ),
        subProductRef: deserializeParam(
          data['subProductRef'],
          ParamType.String,
          false,
        ),
        subPlaceProductRef: deserializeParam(
          data['SubPlaceProductRef'],
          ParamType.String,
          false,
        ),
      );

  static StripeMetaDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StripeMetaDataStruct(
        subRef: convertAlgoliaParam(
          data['subRef'],
          ParamType.String,
          false,
        ),
        subPlaceRef: convertAlgoliaParam(
          data['subPlaceRef'],
          ParamType.String,
          false,
        ),
        subProductRef: convertAlgoliaParam(
          data['subProductRef'],
          ParamType.String,
          false,
        ),
        subPlaceProductRef: convertAlgoliaParam(
          data['SubPlaceProductRef'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripeMetaDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripeMetaDataStruct &&
        subRef == other.subRef &&
        subPlaceRef == other.subPlaceRef &&
        subProductRef == other.subProductRef &&
        subPlaceProductRef == other.subPlaceProductRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subRef, subPlaceRef, subProductRef, subPlaceProductRef]);
}

StripeMetaDataStruct createStripeMetaDataStruct({
  String? subRef,
  String? subPlaceRef,
  String? subProductRef,
  String? subPlaceProductRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeMetaDataStruct(
      subRef: subRef,
      subPlaceRef: subPlaceRef,
      subProductRef: subProductRef,
      subPlaceProductRef: subPlaceProductRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeMetaDataStruct? updateStripeMetaDataStruct(
  StripeMetaDataStruct? stripeMetaData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeMetaData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeMetaDataStructData(
  Map<String, dynamic> firestoreData,
  StripeMetaDataStruct? stripeMetaData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeMetaData == null) {
    return;
  }
  if (stripeMetaData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeMetaData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeMetaDataData =
      getStripeMetaDataFirestoreData(stripeMetaData, forFieldValue);
  final nestedData =
      stripeMetaDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripeMetaData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeMetaDataFirestoreData(
  StripeMetaDataStruct? stripeMetaData, [
  bool forFieldValue = false,
]) {
  if (stripeMetaData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeMetaData.toMap());

  // Add any Firestore field values
  stripeMetaData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeMetaDataListFirestoreData(
  List<StripeMetaDataStruct>? stripeMetaDatas,
) =>
    stripeMetaDatas
        ?.map((e) => getStripeMetaDataFirestoreData(e, true))
        .toList() ??
    [];
