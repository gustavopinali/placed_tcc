// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LinkStatusStruct extends FFFirebaseStruct {
  LinkStatusStruct({
    bool? active,
    DateTime? createdAt,
    DocumentReference? createdBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _createdAt = createdAt,
        _createdBy = createdBy,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  static LinkStatusStruct fromMap(Map<String, dynamic> data) =>
      LinkStatusStruct(
        active: data['active'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
        createdBy: data['createdBy'] as DocumentReference?,
      );

  static LinkStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? LinkStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'createdAt': _createdAt,
        'createdBy': _createdBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static LinkStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinkStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static LinkStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LinkStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LinkStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkStatusStruct &&
        active == other.active &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode => const ListEquality().hash([active, createdAt, createdBy]);
}

LinkStatusStruct createLinkStatusStruct({
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkStatusStruct(
      active: active,
      createdAt: createdAt,
      createdBy: createdBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkStatusStruct? updateLinkStatusStruct(
  LinkStatusStruct? linkStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    linkStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkStatusStructData(
  Map<String, dynamic> firestoreData,
  LinkStatusStruct? linkStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (linkStatus == null) {
    return;
  }
  if (linkStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && linkStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkStatusData = getLinkStatusFirestoreData(linkStatus, forFieldValue);
  final nestedData = linkStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = linkStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkStatusFirestoreData(
  LinkStatusStruct? linkStatus, [
  bool forFieldValue = false,
]) {
  if (linkStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(linkStatus.toMap());

  // Add any Firestore field values
  linkStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkStatusListFirestoreData(
  List<LinkStatusStruct>? linkStatuss,
) =>
    linkStatuss?.map((e) => getLinkStatusFirestoreData(e, true)).toList() ?? [];
