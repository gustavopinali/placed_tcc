import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendshipsRecord extends FirestoreRecord {
  FriendshipsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "userRequesting" field.
  DocumentReference? _userRequesting;
  DocumentReference? get userRequesting => _userRequesting;
  bool hasUserRequesting() => _userRequesting != null;

  // "userRequested" field.
  DocumentReference? _userRequested;
  DocumentReference? get userRequested => _userRequested;
  bool hasUserRequested() => _userRequested != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "acceptedAt" field.
  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _acceptedAt;
  bool hasAcceptedAt() => _acceptedAt != null;

  // "refusedAt" field.
  DateTime? _refusedAt;
  DateTime? get refusedAt => _refusedAt;
  bool hasRefusedAt() => _refusedAt != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _userRequesting = snapshotData['userRequesting'] as DocumentReference?;
    _userRequested = snapshotData['userRequested'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _accepted = snapshotData['accepted'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _acceptedAt = snapshotData['acceptedAt'] as DateTime?;
    _refusedAt = snapshotData['refusedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendships');

  static Stream<FriendshipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendshipsRecord.fromSnapshot(s));

  static Future<FriendshipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendshipsRecord.fromSnapshot(s));

  static FriendshipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendshipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendshipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendshipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendshipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendshipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendshipsRecordData({
  DocumentReference? userRequesting,
  DocumentReference? userRequested,
  bool? active,
  bool? accepted,
  DateTime? createdAt,
  DateTime? acceptedAt,
  DateTime? refusedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRequesting': userRequesting,
      'userRequested': userRequested,
      'active': active,
      'accepted': accepted,
      'createdAt': createdAt,
      'acceptedAt': acceptedAt,
      'refusedAt': refusedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendshipsRecordDocumentEquality implements Equality<FriendshipsRecord> {
  const FriendshipsRecordDocumentEquality();

  @override
  bool equals(FriendshipsRecord? e1, FriendshipsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.userRequesting == e2?.userRequesting &&
        e1?.userRequested == e2?.userRequested &&
        e1?.active == e2?.active &&
        e1?.accepted == e2?.accepted &&
        e1?.createdAt == e2?.createdAt &&
        e1?.acceptedAt == e2?.acceptedAt &&
        e1?.refusedAt == e2?.refusedAt;
  }

  @override
  int hash(FriendshipsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.userRequesting,
        e?.userRequested,
        e?.active,
        e?.accepted,
        e?.createdAt,
        e?.acceptedAt,
        e?.refusedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is FriendshipsRecord;
}
