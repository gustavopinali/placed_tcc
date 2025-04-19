// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StatusStruct extends FFFirebaseStruct {
  StatusStruct({
    bool? public,
    bool? visible,
    bool? signable,
    bool? finished,
    DateTime? finishedAt,
    bool? disabled,
    DateTime? disabledAt,
    DocumentReference? disabledBy,
    bool? approved,
    DateTime? approvedAt,
    DocumentReference? approvedBy,
    bool? featured,
    DateTime? featuredAt,
    DocumentReference? featuredBy,
    DateTime? createdAt,
    DocumentReference? createdBy,
    DateTime? updatedAt,
    DocumentReference? updatedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _public = public,
        _visible = visible,
        _signable = signable,
        _finished = finished,
        _finishedAt = finishedAt,
        _disabled = disabled,
        _disabledAt = disabledAt,
        _disabledBy = disabledBy,
        _approved = approved,
        _approvedAt = approvedAt,
        _approvedBy = approvedBy,
        _featured = featured,
        _featuredAt = featuredAt,
        _featuredBy = featuredBy,
        _createdAt = createdAt,
        _createdBy = createdBy,
        _updatedAt = updatedAt,
        _updatedBy = updatedBy,
        super(firestoreUtilData);

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  set public(bool? val) => _public = val;

  bool hasPublic() => _public != null;

  // "visible" field.
  bool? _visible;
  bool get visible => _visible ?? false;
  set visible(bool? val) => _visible = val;

  bool hasVisible() => _visible != null;

  // "signable" field.
  bool? _signable;
  bool get signable => _signable ?? false;
  set signable(bool? val) => _signable = val;

  bool hasSignable() => _signable != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  set finished(bool? val) => _finished = val;

  bool hasFinished() => _finished != null;

  // "finished_at" field.
  DateTime? _finishedAt;
  DateTime? get finishedAt => _finishedAt;
  set finishedAt(DateTime? val) => _finishedAt = val;

  bool hasFinishedAt() => _finishedAt != null;

  // "disabled" field.
  bool? _disabled;
  bool get disabled => _disabled ?? false;
  set disabled(bool? val) => _disabled = val;

  bool hasDisabled() => _disabled != null;

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

  // "approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  set approved(bool? val) => _approved = val;

  bool hasApproved() => _approved != null;

  // "approved_at" field.
  DateTime? _approvedAt;
  DateTime? get approvedAt => _approvedAt;
  set approvedAt(DateTime? val) => _approvedAt = val;

  bool hasApprovedAt() => _approvedAt != null;

  // "approved_by" field.
  DocumentReference? _approvedBy;
  DocumentReference? get approvedBy => _approvedBy;
  set approvedBy(DocumentReference? val) => _approvedBy = val;

  bool hasApprovedBy() => _approvedBy != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  set featured(bool? val) => _featured = val;

  bool hasFeatured() => _featured != null;

  // "featured_at" field.
  DateTime? _featuredAt;
  DateTime? get featuredAt => _featuredAt;
  set featuredAt(DateTime? val) => _featuredAt = val;

  bool hasFeaturedAt() => _featuredAt != null;

  // "featured_by" field.
  DocumentReference? _featuredBy;
  DocumentReference? get featuredBy => _featuredBy;
  set featuredBy(DocumentReference? val) => _featuredBy = val;

  bool hasFeaturedBy() => _featuredBy != null;

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

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "updated_by" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  set updatedBy(DocumentReference? val) => _updatedBy = val;

  bool hasUpdatedBy() => _updatedBy != null;

  static StatusStruct fromMap(Map<String, dynamic> data) => StatusStruct(
        public: data['public'] as bool?,
        visible: data['visible'] as bool?,
        signable: data['signable'] as bool?,
        finished: data['finished'] as bool?,
        finishedAt: data['finished_at'] as DateTime?,
        disabled: data['disabled'] as bool?,
        disabledAt: data['disabled_at'] as DateTime?,
        disabledBy: data['disabled_by'] as DocumentReference?,
        approved: data['approved'] as bool?,
        approvedAt: data['approved_at'] as DateTime?,
        approvedBy: data['approved_by'] as DocumentReference?,
        featured: data['featured'] as bool?,
        featuredAt: data['featured_at'] as DateTime?,
        featuredBy: data['featured_by'] as DocumentReference?,
        createdAt: data['created_at'] as DateTime?,
        createdBy: data['created_by'] as DocumentReference?,
        updatedAt: data['updated_at'] as DateTime?,
        updatedBy: data['updated_by'] as DocumentReference?,
      );

  static StatusStruct? maybeFromMap(dynamic data) =>
      data is Map ? StatusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'public': _public,
        'visible': _visible,
        'signable': _signable,
        'finished': _finished,
        'finished_at': _finishedAt,
        'disabled': _disabled,
        'disabled_at': _disabledAt,
        'disabled_by': _disabledBy,
        'approved': _approved,
        'approved_at': _approvedAt,
        'approved_by': _approvedBy,
        'featured': _featured,
        'featured_at': _featuredAt,
        'featured_by': _featuredBy,
        'created_at': _createdAt,
        'created_by': _createdBy,
        'updated_at': _updatedAt,
        'updated_by': _updatedBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'public': serializeParam(
          _public,
          ParamType.bool,
        ),
        'visible': serializeParam(
          _visible,
          ParamType.bool,
        ),
        'signable': serializeParam(
          _signable,
          ParamType.bool,
        ),
        'finished': serializeParam(
          _finished,
          ParamType.bool,
        ),
        'finished_at': serializeParam(
          _finishedAt,
          ParamType.DateTime,
        ),
        'disabled': serializeParam(
          _disabled,
          ParamType.bool,
        ),
        'disabled_at': serializeParam(
          _disabledAt,
          ParamType.DateTime,
        ),
        'disabled_by': serializeParam(
          _disabledBy,
          ParamType.DocumentReference,
        ),
        'approved': serializeParam(
          _approved,
          ParamType.bool,
        ),
        'approved_at': serializeParam(
          _approvedAt,
          ParamType.DateTime,
        ),
        'approved_by': serializeParam(
          _approvedBy,
          ParamType.DocumentReference,
        ),
        'featured': serializeParam(
          _featured,
          ParamType.bool,
        ),
        'featured_at': serializeParam(
          _featuredAt,
          ParamType.DateTime,
        ),
        'featured_by': serializeParam(
          _featuredBy,
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
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'updated_by': serializeParam(
          _updatedBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static StatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusStruct(
        public: deserializeParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        visible: deserializeParam(
          data['visible'],
          ParamType.bool,
          false,
        ),
        signable: deserializeParam(
          data['signable'],
          ParamType.bool,
          false,
        ),
        finished: deserializeParam(
          data['finished'],
          ParamType.bool,
          false,
        ),
        finishedAt: deserializeParam(
          data['finished_at'],
          ParamType.DateTime,
          false,
        ),
        disabled: deserializeParam(
          data['disabled'],
          ParamType.bool,
          false,
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
        approved: deserializeParam(
          data['approved'],
          ParamType.bool,
          false,
        ),
        approvedAt: deserializeParam(
          data['approved_at'],
          ParamType.DateTime,
          false,
        ),
        approvedBy: deserializeParam(
          data['approved_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        featured: deserializeParam(
          data['featured'],
          ParamType.bool,
          false,
        ),
        featuredAt: deserializeParam(
          data['featured_at'],
          ParamType.DateTime,
          false,
        ),
        featuredBy: deserializeParam(
          data['featured_by'],
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
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        updatedBy: deserializeParam(
          data['updated_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static StatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StatusStruct(
        public: convertAlgoliaParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        visible: convertAlgoliaParam(
          data['visible'],
          ParamType.bool,
          false,
        ),
        signable: convertAlgoliaParam(
          data['signable'],
          ParamType.bool,
          false,
        ),
        finished: convertAlgoliaParam(
          data['finished'],
          ParamType.bool,
          false,
        ),
        finishedAt: convertAlgoliaParam(
          data['finished_at'],
          ParamType.DateTime,
          false,
        ),
        disabled: convertAlgoliaParam(
          data['disabled'],
          ParamType.bool,
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
        approved: convertAlgoliaParam(
          data['approved'],
          ParamType.bool,
          false,
        ),
        approvedAt: convertAlgoliaParam(
          data['approved_at'],
          ParamType.DateTime,
          false,
        ),
        approvedBy: convertAlgoliaParam(
          data['approved_by'],
          ParamType.DocumentReference,
          false,
        ),
        featured: convertAlgoliaParam(
          data['featured'],
          ParamType.bool,
          false,
        ),
        featuredAt: convertAlgoliaParam(
          data['featured_at'],
          ParamType.DateTime,
          false,
        ),
        featuredBy: convertAlgoliaParam(
          data['featured_by'],
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
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        updatedBy: convertAlgoliaParam(
          data['updated_by'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusStruct &&
        public == other.public &&
        visible == other.visible &&
        signable == other.signable &&
        finished == other.finished &&
        finishedAt == other.finishedAt &&
        disabled == other.disabled &&
        disabledAt == other.disabledAt &&
        disabledBy == other.disabledBy &&
        approved == other.approved &&
        approvedAt == other.approvedAt &&
        approvedBy == other.approvedBy &&
        featured == other.featured &&
        featuredAt == other.featuredAt &&
        featuredBy == other.featuredBy &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        updatedAt == other.updatedAt &&
        updatedBy == other.updatedBy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        public,
        visible,
        signable,
        finished,
        finishedAt,
        disabled,
        disabledAt,
        disabledBy,
        approved,
        approvedAt,
        approvedBy,
        featured,
        featuredAt,
        featuredBy,
        createdAt,
        createdBy,
        updatedAt,
        updatedBy
      ]);
}

StatusStruct createStatusStruct({
  bool? public,
  bool? visible,
  bool? signable,
  bool? finished,
  DateTime? finishedAt,
  bool? disabled,
  DateTime? disabledAt,
  DocumentReference? disabledBy,
  bool? approved,
  DateTime? approvedAt,
  DocumentReference? approvedBy,
  bool? featured,
  DateTime? featuredAt,
  DocumentReference? featuredBy,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? updatedAt,
  DocumentReference? updatedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusStruct(
      public: public,
      visible: visible,
      signable: signable,
      finished: finished,
      finishedAt: finishedAt,
      disabled: disabled,
      disabledAt: disabledAt,
      disabledBy: disabledBy,
      approved: approved,
      approvedAt: approvedAt,
      approvedBy: approvedBy,
      featured: featured,
      featuredAt: featuredAt,
      featuredBy: featuredBy,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusStruct? updateStatusStruct(
  StatusStruct? status, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    status
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusStructData(
  Map<String, dynamic> firestoreData,
  StatusStruct? status,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (status == null) {
    return;
  }
  if (status.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && status.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusData = getStatusFirestoreData(status, forFieldValue);
  final nestedData = statusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = status.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusFirestoreData(
  StatusStruct? status, [
  bool forFieldValue = false,
]) {
  if (status == null) {
    return {};
  }
  final firestoreData = mapToFirestore(status.toMap());

  // Add any Firestore field values
  status.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusListFirestoreData(
  List<StatusStruct>? statuss,
) =>
    statuss?.map((e) => getStatusFirestoreData(e, true)).toList() ?? [];
