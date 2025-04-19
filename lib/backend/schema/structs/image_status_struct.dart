// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImageStatusStruct extends FFFirebaseStruct {
  ImageStatusStruct({
    bool? active,
    DateTime? createdAt,
    DocumentReference? createdBy,
    DateTime? disabledAt,
    DocumentReference? disabledBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _createdAt = createdAt,
        _createdBy = createdBy,
        _disabledAt = disabledAt,
        _disabledBy = disabledBy,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

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

  // "disabled_at" field.
  DateTime? _disabledAt;
  DateTime? get disabledAt => _disabledAt;
  set disabledAt(DateTime? val) => _disabledAt = val;

  bool hasDisabledAt() => _disabledAt != null;

  // "disabled_by" field.
  DocumentReference? _disabledBy;
  DocumentReference? get disabledBy => _disabledBy;
  set disabledBy(DocumentReference? val) => _disabledBy = val;

  bool hasDisabledBy() => _disabledBy != null;

  static ImageStatusStruct fromMap(Map<String, dynamic> data) =>
      ImageStatusStruct(
        active: data['active'] as bool?,
        createdAt: data['created_at'] as DateTime?,
        createdBy: data['created_by'] as DocumentReference?,
        disabledAt: data['disabled_at'] as DateTime?,
        disabledBy: data['disabled_by'] as DocumentReference?,
      );

  static ImageStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'created_at': _createdAt,
        'created_by': _createdBy,
        'disabled_at': _disabledAt,
        'disabled_by': _disabledBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'disabled_at': serializeParam(
          _disabledAt,
          ParamType.DateTime,
        ),
        'disabled_by': serializeParam(
          _disabledBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ImageStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
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
        disabledAt: deserializeParam(
          data['disabled_at'],
          ParamType.DateTime,
          false,
        ),
        disabledBy: deserializeParam(
          data['disabled_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static ImageStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ImageStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
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
        disabledAt: convertAlgoliaParam(
          data['disabled_at'],
          ParamType.DateTime,
          false,
        ),
        disabledBy: convertAlgoliaParam(
          data['disabled_by'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ImageStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageStatusStruct &&
        active == other.active &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        disabledAt == other.disabledAt &&
        disabledBy == other.disabledBy;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([active, createdAt, createdBy, disabledAt, disabledBy]);
}

ImageStatusStruct createImageStatusStruct({
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? disabledAt,
  DocumentReference? disabledBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageStatusStruct(
      active: active,
      createdAt: createdAt,
      createdBy: createdBy,
      disabledAt: disabledAt,
      disabledBy: disabledBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageStatusStruct? updateImageStatusStruct(
  ImageStatusStruct? imageStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageStatusStructData(
  Map<String, dynamic> firestoreData,
  ImageStatusStruct? imageStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageStatus == null) {
    return;
  }
  if (imageStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageStatusData =
      getImageStatusFirestoreData(imageStatus, forFieldValue);
  final nestedData =
      imageStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageStatusFirestoreData(
  ImageStatusStruct? imageStatus, [
  bool forFieldValue = false,
]) {
  if (imageStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageStatus.toMap());

  // Add any Firestore field values
  imageStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageStatusListFirestoreData(
  List<ImageStatusStruct>? imageStatuss,
) =>
    imageStatuss?.map((e) => getImageStatusFirestoreData(e, true)).toList() ??
    [];
