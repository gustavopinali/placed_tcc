// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InvitationStatusStruct extends FFFirebaseStruct {
  InvitationStatusStruct({
    bool? accepted,
    DateTime? acceptedAt,
    DocumentReference? acceptedBy,
    bool? refused,
    DateTime? refusedAt,
    DocumentReference? refusedBy,
    DateTime? createdAt,
    DocumentReference? createdBy,
    DateTime? disabledAt,
    DocumentReference? disabledBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accepted = accepted,
        _acceptedAt = acceptedAt,
        _acceptedBy = acceptedBy,
        _refused = refused,
        _refusedAt = refusedAt,
        _refusedBy = refusedBy,
        _createdAt = createdAt,
        _createdBy = createdBy,
        _disabledAt = disabledAt,
        _disabledBy = disabledBy,
        super(firestoreUtilData);

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  set accepted(bool? val) => _accepted = val;

  bool hasAccepted() => _accepted != null;

  // "acceptedAt" field.
  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _acceptedAt;
  set acceptedAt(DateTime? val) => _acceptedAt = val;

  bool hasAcceptedAt() => _acceptedAt != null;

  // "acceptedBy" field.
  DocumentReference? _acceptedBy;
  DocumentReference? get acceptedBy => _acceptedBy;
  set acceptedBy(DocumentReference? val) => _acceptedBy = val;

  bool hasAcceptedBy() => _acceptedBy != null;

  // "refused" field.
  bool? _refused;
  bool get refused => _refused ?? false;
  set refused(bool? val) => _refused = val;

  bool hasRefused() => _refused != null;

  // "refusedAt" field.
  DateTime? _refusedAt;
  DateTime? get refusedAt => _refusedAt;
  set refusedAt(DateTime? val) => _refusedAt = val;

  bool hasRefusedAt() => _refusedAt != null;

  // "refusedBy" field.
  DocumentReference? _refusedBy;
  DocumentReference? get refusedBy => _refusedBy;
  set refusedBy(DocumentReference? val) => _refusedBy = val;

  bool hasRefusedBy() => _refusedBy != null;

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

  // "disabledAt" field.
  DateTime? _disabledAt;
  DateTime? get disabledAt => _disabledAt;
  set disabledAt(DateTime? val) => _disabledAt = val;

  bool hasDisabledAt() => _disabledAt != null;

  // "disabledBy" field.
  DocumentReference? _disabledBy;
  DocumentReference? get disabledBy => _disabledBy;
  set disabledBy(DocumentReference? val) => _disabledBy = val;

  bool hasDisabledBy() => _disabledBy != null;

  static InvitationStatusStruct fromMap(Map<String, dynamic> data) =>
      InvitationStatusStruct(
        accepted: data['accepted'] as bool?,
        acceptedAt: data['acceptedAt'] as DateTime?,
        acceptedBy: data['acceptedBy'] as DocumentReference?,
        refused: data['refused'] as bool?,
        refusedAt: data['refusedAt'] as DateTime?,
        refusedBy: data['refusedBy'] as DocumentReference?,
        createdAt: data['createdAt'] as DateTime?,
        createdBy: data['createdBy'] as DocumentReference?,
        disabledAt: data['disabledAt'] as DateTime?,
        disabledBy: data['disabledBy'] as DocumentReference?,
      );

  static InvitationStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? InvitationStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'accepted': _accepted,
        'acceptedAt': _acceptedAt,
        'acceptedBy': _acceptedBy,
        'refused': _refused,
        'refusedAt': _refusedAt,
        'refusedBy': _refusedBy,
        'createdAt': _createdAt,
        'createdBy': _createdBy,
        'disabledAt': _disabledAt,
        'disabledBy': _disabledBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'accepted': serializeParam(
          _accepted,
          ParamType.bool,
        ),
        'acceptedAt': serializeParam(
          _acceptedAt,
          ParamType.DateTime,
        ),
        'acceptedBy': serializeParam(
          _acceptedBy,
          ParamType.DocumentReference,
        ),
        'refused': serializeParam(
          _refused,
          ParamType.bool,
        ),
        'refusedAt': serializeParam(
          _refusedAt,
          ParamType.DateTime,
        ),
        'refusedBy': serializeParam(
          _refusedBy,
          ParamType.DocumentReference,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'disabledAt': serializeParam(
          _disabledAt,
          ParamType.DateTime,
        ),
        'disabledBy': serializeParam(
          _disabledBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static InvitationStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InvitationStatusStruct(
        accepted: deserializeParam(
          data['accepted'],
          ParamType.bool,
          false,
        ),
        acceptedAt: deserializeParam(
          data['acceptedAt'],
          ParamType.DateTime,
          false,
        ),
        acceptedBy: deserializeParam(
          data['acceptedBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        refused: deserializeParam(
          data['refused'],
          ParamType.bool,
          false,
        ),
        refusedAt: deserializeParam(
          data['refusedAt'],
          ParamType.DateTime,
          false,
        ),
        refusedBy: deserializeParam(
          data['refusedBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
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
        disabledAt: deserializeParam(
          data['disabledAt'],
          ParamType.DateTime,
          false,
        ),
        disabledBy: deserializeParam(
          data['disabledBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static InvitationStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InvitationStatusStruct(
        accepted: convertAlgoliaParam(
          data['accepted'],
          ParamType.bool,
          false,
        ),
        acceptedAt: convertAlgoliaParam(
          data['acceptedAt'],
          ParamType.DateTime,
          false,
        ),
        acceptedBy: convertAlgoliaParam(
          data['acceptedBy'],
          ParamType.DocumentReference,
          false,
        ),
        refused: convertAlgoliaParam(
          data['refused'],
          ParamType.bool,
          false,
        ),
        refusedAt: convertAlgoliaParam(
          data['refusedAt'],
          ParamType.DateTime,
          false,
        ),
        refusedBy: convertAlgoliaParam(
          data['refusedBy'],
          ParamType.DocumentReference,
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
        disabledAt: convertAlgoliaParam(
          data['disabledAt'],
          ParamType.DateTime,
          false,
        ),
        disabledBy: convertAlgoliaParam(
          data['disabledBy'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InvitationStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvitationStatusStruct &&
        accepted == other.accepted &&
        acceptedAt == other.acceptedAt &&
        acceptedBy == other.acceptedBy &&
        refused == other.refused &&
        refusedAt == other.refusedAt &&
        refusedBy == other.refusedBy &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        disabledAt == other.disabledAt &&
        disabledBy == other.disabledBy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        accepted,
        acceptedAt,
        acceptedBy,
        refused,
        refusedAt,
        refusedBy,
        createdAt,
        createdBy,
        disabledAt,
        disabledBy
      ]);
}

InvitationStatusStruct createInvitationStatusStruct({
  bool? accepted,
  DateTime? acceptedAt,
  DocumentReference? acceptedBy,
  bool? refused,
  DateTime? refusedAt,
  DocumentReference? refusedBy,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? disabledAt,
  DocumentReference? disabledBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvitationStatusStruct(
      accepted: accepted,
      acceptedAt: acceptedAt,
      acceptedBy: acceptedBy,
      refused: refused,
      refusedAt: refusedAt,
      refusedBy: refusedBy,
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

InvitationStatusStruct? updateInvitationStatusStruct(
  InvitationStatusStruct? invitationStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invitationStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvitationStatusStructData(
  Map<String, dynamic> firestoreData,
  InvitationStatusStruct? invitationStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invitationStatus == null) {
    return;
  }
  if (invitationStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invitationStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invitationStatusData =
      getInvitationStatusFirestoreData(invitationStatus, forFieldValue);
  final nestedData =
      invitationStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invitationStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvitationStatusFirestoreData(
  InvitationStatusStruct? invitationStatus, [
  bool forFieldValue = false,
]) {
  if (invitationStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invitationStatus.toMap());

  // Add any Firestore field values
  invitationStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvitationStatusListFirestoreData(
  List<InvitationStatusStruct>? invitationStatuss,
) =>
    invitationStatuss
        ?.map((e) => getInvitationStatusFirestoreData(e, true))
        .toList() ??
    [];
