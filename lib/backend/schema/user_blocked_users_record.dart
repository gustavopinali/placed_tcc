import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBlockedUsersRecord extends FirestoreRecord {
  UserBlockedUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _status = StatusStruct.maybeFromMap(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userBlockedUsers')
          : FirebaseFirestore.instance.collectionGroup('userBlockedUsers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userBlockedUsers').doc(id);

  static Stream<UserBlockedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBlockedUsersRecord.fromSnapshot(s));

  static Future<UserBlockedUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserBlockedUsersRecord.fromSnapshot(s));

  static UserBlockedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBlockedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBlockedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBlockedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBlockedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBlockedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBlockedUsersRecordData({
  DocumentReference? user,
  StatusStruct? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'status': StatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class UserBlockedUsersRecordDocumentEquality
    implements Equality<UserBlockedUsersRecord> {
  const UserBlockedUsersRecordDocumentEquality();

  @override
  bool equals(UserBlockedUsersRecord? e1, UserBlockedUsersRecord? e2) {
    return e1?.user == e2?.user && e1?.status == e2?.status;
  }

  @override
  int hash(UserBlockedUsersRecord? e) =>
      const ListEquality().hash([e?.user, e?.status]);

  @override
  bool isValidKey(Object? o) => o is UserBlockedUsersRecord;
}
