// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostStatusStruct extends FFFirebaseStruct {
  PostStatusStruct({
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
  bool get active => _active ?? true;
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

  static PostStatusStruct fromMap(Map<String, dynamic> data) =>
      PostStatusStruct(
        active: data['active'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
        createdBy: data['createdBy'] as DocumentReference?,
      );

  static PostStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? PostStatusStruct.fromMap(data.cast<String, dynamic>())
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

  static PostStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStatusStruct(
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

  static PostStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PostStatusStruct(
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
  String toString() => 'PostStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostStatusStruct &&
        active == other.active &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode => const ListEquality().hash([active, createdAt, createdBy]);
}

PostStatusStruct createPostStatusStruct({
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStatusStruct(
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

PostStatusStruct? updatePostStatusStruct(
  PostStatusStruct? postStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStatusStructData(
  Map<String, dynamic> firestoreData,
  PostStatusStruct? postStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postStatus == null) {
    return;
  }
  if (postStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postStatusData = getPostStatusFirestoreData(postStatus, forFieldValue);
  final nestedData = postStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostStatusFirestoreData(
  PostStatusStruct? postStatus, [
  bool forFieldValue = false,
]) {
  if (postStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postStatus.toMap());

  // Add any Firestore field values
  postStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostStatusListFirestoreData(
  List<PostStatusStruct>? postStatuss,
) =>
    postStatuss?.map((e) => getPostStatusFirestoreData(e, true)).toList() ?? [];
