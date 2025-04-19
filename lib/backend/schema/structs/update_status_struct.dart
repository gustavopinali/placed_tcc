// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UpdateStatusStruct extends FFFirebaseStruct {
  UpdateStatusStruct({
    bool? active,
    bool? aproved,
    DateTime? aprovedAt,
    DocumentReference? aprovedBy,
    DateTime? createdAt,
    DocumentReference? createdBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _aproved = aproved,
        _aprovedAt = aprovedAt,
        _aprovedBy = aprovedBy,
        _createdAt = createdAt,
        _createdBy = createdBy,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "aproved" field.
  bool? _aproved;
  bool get aproved => _aproved ?? false;
  set aproved(bool? val) => _aproved = val;

  bool hasAproved() => _aproved != null;

  // "aproved_at" field.
  DateTime? _aprovedAt;
  DateTime? get aprovedAt => _aprovedAt;
  set aprovedAt(DateTime? val) => _aprovedAt = val;

  bool hasAprovedAt() => _aprovedAt != null;

  // "aproved_by" field.
  DocumentReference? _aprovedBy;
  DocumentReference? get aprovedBy => _aprovedBy;
  set aprovedBy(DocumentReference? val) => _aprovedBy = val;

  bool hasAprovedBy() => _aprovedBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  static UpdateStatusStruct fromMap(Map<String, dynamic> data) =>
      UpdateStatusStruct(
        active: data['active'] as bool?,
        aproved: data['aproved'] as bool?,
        aprovedAt: data['aproved_at'] as DateTime?,
        aprovedBy: data['aproved_by'] as DocumentReference?,
        createdAt: data['created_at'] as DateTime?,
        createdBy: data['created_by'] as DocumentReference?,
      );

  static UpdateStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? UpdateStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'aproved': _aproved,
        'aproved_at': _aprovedAt,
        'aproved_by': _aprovedBy,
        'created_at': _createdAt,
        'created_by': _createdBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'aproved': serializeParam(
          _aproved,
          ParamType.bool,
        ),
        'aproved_at': serializeParam(
          _aprovedAt,
          ParamType.DateTime,
        ),
        'aproved_by': serializeParam(
          _aprovedBy,
          ParamType.DocumentReference,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UpdateStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      UpdateStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        aproved: deserializeParam(
          data['aproved'],
          ParamType.bool,
          false,
        ),
        aprovedAt: deserializeParam(
          data['aproved_at'],
          ParamType.DateTime,
          false,
        ),
        aprovedBy: deserializeParam(
          data['aproved_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static UpdateStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UpdateStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        aproved: convertAlgoliaParam(
          data['aproved'],
          ParamType.bool,
          false,
        ),
        aprovedAt: convertAlgoliaParam(
          data['aproved_at'],
          ParamType.DateTime,
          false,
        ),
        aprovedBy: convertAlgoliaParam(
          data['aproved_by'],
          ParamType.DocumentReference,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UpdateStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UpdateStatusStruct &&
        active == other.active &&
        aproved == other.aproved &&
        aprovedAt == other.aprovedAt &&
        aprovedBy == other.aprovedBy &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([active, aproved, aprovedAt, aprovedBy, createdAt, createdBy]);
}

UpdateStatusStruct createUpdateStatusStruct({
  bool? active,
  bool? aproved,
  DateTime? aprovedAt,
  DocumentReference? aprovedBy,
  DateTime? createdAt,
  DocumentReference? createdBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UpdateStatusStruct(
      active: active,
      aproved: aproved,
      aprovedAt: aprovedAt,
      aprovedBy: aprovedBy,
      createdAt: createdAt,
      createdBy: createdBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UpdateStatusStruct? updateUpdateStatusStruct(
  UpdateStatusStruct? updateStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    updateStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUpdateStatusStructData(
  Map<String, dynamic> firestoreData,
  UpdateStatusStruct? updateStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (updateStatus == null) {
    return;
  }
  if (updateStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && updateStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final updateStatusData =
      getUpdateStatusFirestoreData(updateStatus, forFieldValue);
  final nestedData =
      updateStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = updateStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUpdateStatusFirestoreData(
  UpdateStatusStruct? updateStatus, [
  bool forFieldValue = false,
]) {
  if (updateStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(updateStatus.toMap());

  // Add any Firestore field values
  updateStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUpdateStatusListFirestoreData(
  List<UpdateStatusStruct>? updateStatuss,
) =>
    updateStatuss?.map((e) => getUpdateStatusFirestoreData(e, true)).toList() ??
    [];
