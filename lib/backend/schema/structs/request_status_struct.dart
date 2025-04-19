// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RequestStatusStruct extends FFFirebaseStruct {
  RequestStatusStruct({
    bool? accepted,
    DateTime? acceptedAt,
    DocumentReference? acceptedBy,
    bool? refused,
    DateTime? refusedAt,
    DocumentReference? refusedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accepted = accepted,
        _acceptedAt = acceptedAt,
        _acceptedBy = acceptedBy,
        _refused = refused,
        _refusedAt = refusedAt,
        _refusedBy = refusedBy,
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

  static RequestStatusStruct fromMap(Map<String, dynamic> data) =>
      RequestStatusStruct(
        accepted: data['accepted'] as bool?,
        acceptedAt: data['acceptedAt'] as DateTime?,
        acceptedBy: data['acceptedBy'] as DocumentReference?,
        refused: data['refused'] as bool?,
        refusedAt: data['refusedAt'] as DateTime?,
        refusedBy: data['refusedBy'] as DocumentReference?,
      );

  static RequestStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'accepted': _accepted,
        'acceptedAt': _acceptedAt,
        'acceptedBy': _acceptedBy,
        'refused': _refused,
        'refusedAt': _refusedAt,
        'refusedBy': _refusedBy,
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
      }.withoutNulls;

  static RequestStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      RequestStatusStruct(
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
      );

  static RequestStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RequestStatusStruct(
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
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RequestStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RequestStatusStruct &&
        accepted == other.accepted &&
        acceptedAt == other.acceptedAt &&
        acceptedBy == other.acceptedBy &&
        refused == other.refused &&
        refusedAt == other.refusedAt &&
        refusedBy == other.refusedBy;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accepted, acceptedAt, acceptedBy, refused, refusedAt, refusedBy]);
}

RequestStatusStruct createRequestStatusStruct({
  bool? accepted,
  DateTime? acceptedAt,
  DocumentReference? acceptedBy,
  bool? refused,
  DateTime? refusedAt,
  DocumentReference? refusedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RequestStatusStruct(
      accepted: accepted,
      acceptedAt: acceptedAt,
      acceptedBy: acceptedBy,
      refused: refused,
      refusedAt: refusedAt,
      refusedBy: refusedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RequestStatusStruct? updateRequestStatusStruct(
  RequestStatusStruct? requestStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    requestStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRequestStatusStructData(
  Map<String, dynamic> firestoreData,
  RequestStatusStruct? requestStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (requestStatus == null) {
    return;
  }
  if (requestStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && requestStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final requestStatusData =
      getRequestStatusFirestoreData(requestStatus, forFieldValue);
  final nestedData =
      requestStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = requestStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRequestStatusFirestoreData(
  RequestStatusStruct? requestStatus, [
  bool forFieldValue = false,
]) {
  if (requestStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(requestStatus.toMap());

  // Add any Firestore field values
  requestStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRequestStatusListFirestoreData(
  List<RequestStatusStruct>? requestStatuss,
) =>
    requestStatuss
        ?.map((e) => getRequestStatusFirestoreData(e, true))
        .toList() ??
    [];
