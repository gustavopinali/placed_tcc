import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLikesRecord extends FirestoreRecord {
  UserLikesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "visitRef" field.
  DocumentReference? _visitRef;
  DocumentReference? get visitRef => _visitRef;
  bool hasVisitRef() => _visitRef != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _visitRef = snapshotData['visitRef'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _users = getDataList(snapshotData['users']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userLikes')
          : FirebaseFirestore.instance.collectionGroup('userLikes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userLikes').doc(id);

  static Stream<UserLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLikesRecord.fromSnapshot(s));

  static Future<UserLikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLikesRecord.fromSnapshot(s));

  static UserLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLikesRecordData({
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? eventRef,
  DocumentReference? visitRef,
  LatLng? location,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'placeRef': placeRef,
      'eventRef': eventRef,
      'visitRef': visitRef,
      'location': location,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserLikesRecordDocumentEquality implements Equality<UserLikesRecord> {
  const UserLikesRecordDocumentEquality();

  @override
  bool equals(UserLikesRecord? e1, UserLikesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.visitRef == e2?.visitRef &&
        e1?.location == e2?.location &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(UserLikesRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.placeRef,
        e?.eventRef,
        e?.visitRef,
        e?.location,
        e?.active,
        e?.createdAt,
        e?.users
      ]);

  @override
  bool isValidKey(Object? o) => o is UserLikesRecord;
}
