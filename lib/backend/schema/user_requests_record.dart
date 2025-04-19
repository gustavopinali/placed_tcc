import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRequestsRecord extends FirestoreRecord {
  UserRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "requestStatus" field.
  RequestStatusStruct? _requestStatus;
  RequestStatusStruct get requestStatus =>
      _requestStatus ?? RequestStatusStruct();
  bool hasRequestStatus() => _requestStatus != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = castToType<int>(snapshotData['type']);
    _message = snapshotData['message'] as String?;
    _requestStatus =
        RequestStatusStruct.maybeFromMap(snapshotData['requestStatus']);
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userRequests')
          : FirebaseFirestore.instance.collectionGroup('userRequests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userRequests').doc(id);

  static Stream<UserRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRequestsRecord.fromSnapshot(s));

  static Future<UserRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRequestsRecord.fromSnapshot(s));

  static UserRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRequestsRecordData({
  int? type,
  String? message,
  RequestStatusStruct? requestStatus,
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'message': message,
      'requestStatus': RequestStatusStruct().toMap(),
      'active': active,
      'createdAt': createdAt,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  // Handle nested data for "requestStatus" field.
  addRequestStatusStructData(firestoreData, requestStatus, 'requestStatus');

  return firestoreData;
}

class UserRequestsRecordDocumentEquality
    implements Equality<UserRequestsRecord> {
  const UserRequestsRecordDocumentEquality();

  @override
  bool equals(UserRequestsRecord? e1, UserRequestsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.message == e2?.message &&
        e1?.requestStatus == e2?.requestStatus &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(UserRequestsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.message,
        e?.requestStatus,
        e?.active,
        e?.createdAt,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRequestsRecord;
}
