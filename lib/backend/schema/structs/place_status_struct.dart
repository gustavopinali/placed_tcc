// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlaceStatusStruct extends FFFirebaseStruct {
  PlaceStatusStruct({
    bool? active,
    bool? activeSub,
    bool? signable,
    bool? custom,
    bool? temporary,
    DocumentReference? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? searchable,
    bool? placed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _activeSub = activeSub,
        _signable = signable,
        _custom = custom,
        _temporary = temporary,
        _createdBy = createdBy,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _searchable = searchable,
        _placed = placed,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "activeSub" field.
  bool? _activeSub;
  bool get activeSub => _activeSub ?? false;
  set activeSub(bool? val) => _activeSub = val;

  bool hasActiveSub() => _activeSub != null;

  // "signable" field.
  bool? _signable;
  bool get signable => _signable ?? false;
  set signable(bool? val) => _signable = val;

  bool hasSignable() => _signable != null;

  // "custom" field.
  bool? _custom;
  bool get custom => _custom ?? false;
  set custom(bool? val) => _custom = val;

  bool hasCustom() => _custom != null;

  // "temporary" field.
  bool? _temporary;
  bool get temporary => _temporary ?? false;
  set temporary(bool? val) => _temporary = val;

  bool hasTemporary() => _temporary != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "searchable" field.
  bool? _searchable;
  bool get searchable => _searchable ?? true;
  set searchable(bool? val) => _searchable = val;

  bool hasSearchable() => _searchable != null;

  // "placed" field.
  bool? _placed;
  bool get placed => _placed ?? false;
  set placed(bool? val) => _placed = val;

  bool hasPlaced() => _placed != null;

  static PlaceStatusStruct fromMap(Map<String, dynamic> data) =>
      PlaceStatusStruct(
        active: data['active'] as bool?,
        activeSub: data['activeSub'] as bool?,
        signable: data['signable'] as bool?,
        custom: data['custom'] as bool?,
        temporary: data['temporary'] as bool?,
        createdBy: data['created_by'] as DocumentReference?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        searchable: data['searchable'] as bool?,
        placed: data['placed'] as bool?,
      );

  static PlaceStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'activeSub': _activeSub,
        'signable': _signable,
        'custom': _custom,
        'temporary': _temporary,
        'created_by': _createdBy,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'searchable': _searchable,
        'placed': _placed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'activeSub': serializeParam(
          _activeSub,
          ParamType.bool,
        ),
        'signable': serializeParam(
          _signable,
          ParamType.bool,
        ),
        'custom': serializeParam(
          _custom,
          ParamType.bool,
        ),
        'temporary': serializeParam(
          _temporary,
          ParamType.bool,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'searchable': serializeParam(
          _searchable,
          ParamType.bool,
        ),
        'placed': serializeParam(
          _placed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PlaceStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        activeSub: deserializeParam(
          data['activeSub'],
          ParamType.bool,
          false,
        ),
        signable: deserializeParam(
          data['signable'],
          ParamType.bool,
          false,
        ),
        custom: deserializeParam(
          data['custom'],
          ParamType.bool,
          false,
        ),
        temporary: deserializeParam(
          data['temporary'],
          ParamType.bool,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        searchable: deserializeParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        placed: deserializeParam(
          data['placed'],
          ParamType.bool,
          false,
        ),
      );

  static PlaceStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        activeSub: convertAlgoliaParam(
          data['activeSub'],
          ParamType.bool,
          false,
        ),
        signable: convertAlgoliaParam(
          data['signable'],
          ParamType.bool,
          false,
        ),
        custom: convertAlgoliaParam(
          data['custom'],
          ParamType.bool,
          false,
        ),
        temporary: convertAlgoliaParam(
          data['temporary'],
          ParamType.bool,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        searchable: convertAlgoliaParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        placed: convertAlgoliaParam(
          data['placed'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceStatusStruct &&
        active == other.active &&
        activeSub == other.activeSub &&
        signable == other.signable &&
        custom == other.custom &&
        temporary == other.temporary &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        searchable == other.searchable &&
        placed == other.placed;
  }

  @override
  int get hashCode => const ListEquality().hash([
        active,
        activeSub,
        signable,
        custom,
        temporary,
        createdBy,
        createdAt,
        updatedAt,
        searchable,
        placed
      ]);
}

PlaceStatusStruct createPlaceStatusStruct({
  bool? active,
  bool? activeSub,
  bool? signable,
  bool? custom,
  bool? temporary,
  DocumentReference? createdBy,
  DateTime? createdAt,
  DateTime? updatedAt,
  bool? searchable,
  bool? placed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceStatusStruct(
      active: active,
      activeSub: activeSub,
      signable: signable,
      custom: custom,
      temporary: temporary,
      createdBy: createdBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
      searchable: searchable,
      placed: placed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceStatusStruct? updatePlaceStatusStruct(
  PlaceStatusStruct? placeStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceStatusStructData(
  Map<String, dynamic> firestoreData,
  PlaceStatusStruct? placeStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeStatus == null) {
    return;
  }
  if (placeStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeStatusData =
      getPlaceStatusFirestoreData(placeStatus, forFieldValue);
  final nestedData =
      placeStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceStatusFirestoreData(
  PlaceStatusStruct? placeStatus, [
  bool forFieldValue = false,
]) {
  if (placeStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeStatus.toMap());

  // Add any Firestore field values
  placeStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceStatusListFirestoreData(
  List<PlaceStatusStruct>? placeStatuss,
) =>
    placeStatuss?.map((e) => getPlaceStatusFirestoreData(e, true)).toList() ??
    [];
