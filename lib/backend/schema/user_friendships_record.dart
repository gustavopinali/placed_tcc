import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFriendshipsRecord extends FirestoreRecord {
  UserFriendshipsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "acceptedAt" field.
  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _acceptedAt;
  bool hasAcceptedAt() => _acceptedAt != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "friendshipRef" field.
  DocumentReference? _friendshipRef;
  DocumentReference? get friendshipRef => _friendshipRef;
  bool hasFriendshipRef() => _friendshipRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
    _active = snapshotData['active'] as bool?;
    _accepted = snapshotData['accepted'] as bool?;
    _acceptedAt = snapshotData['acceptedAt'] as DateTime?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _friendshipRef = snapshotData['friendshipRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userFriendships')
          : FirebaseFirestore.instance.collectionGroup('userFriendships');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userFriendships').doc(id);

  static Stream<UserFriendshipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFriendshipsRecord.fromSnapshot(s));

  static Future<UserFriendshipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFriendshipsRecord.fromSnapshot(s));

  static UserFriendshipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFriendshipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFriendshipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFriendshipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFriendshipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFriendshipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFriendshipsRecordData({
  DocumentReference? userRef,
  bool? active,
  bool? accepted,
  DateTime? acceptedAt,
  DateTime? createdAt,
  DocumentReference? friendshipRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'active': active,
      'accepted': accepted,
      'acceptedAt': acceptedAt,
      'createdAt': createdAt,
      'friendshipRef': friendshipRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFriendshipsRecordDocumentEquality
    implements Equality<UserFriendshipsRecord> {
  const UserFriendshipsRecordDocumentEquality();

  @override
  bool equals(UserFriendshipsRecord? e1, UserFriendshipsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.active == e2?.active &&
        e1?.accepted == e2?.accepted &&
        e1?.acceptedAt == e2?.acceptedAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.friendshipRef == e2?.friendshipRef;
  }

  @override
  int hash(UserFriendshipsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.users,
        e?.active,
        e?.accepted,
        e?.acceptedAt,
        e?.createdAt,
        e?.friendshipRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UserFriendshipsRecord;
}
