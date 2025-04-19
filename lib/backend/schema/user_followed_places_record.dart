import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFollowedPlacesRecord extends FirestoreRecord {
  UserFollowedPlacesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userFollowedPlaces')
          : FirebaseFirestore.instance.collectionGroup('userFollowedPlaces');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userFollowedPlaces').doc(id);

  static Stream<UserFollowedPlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFollowedPlacesRecord.fromSnapshot(s));

  static Future<UserFollowedPlacesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserFollowedPlacesRecord.fromSnapshot(s));

  static UserFollowedPlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFollowedPlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFollowedPlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFollowedPlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFollowedPlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFollowedPlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFollowedPlacesRecordData({
  DocumentReference? placeRef,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'placeRef': placeRef,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFollowedPlacesRecordDocumentEquality
    implements Equality<UserFollowedPlacesRecord> {
  const UserFollowedPlacesRecordDocumentEquality();

  @override
  bool equals(UserFollowedPlacesRecord? e1, UserFollowedPlacesRecord? e2) {
    return e1?.placeRef == e2?.placeRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UserFollowedPlacesRecord? e) =>
      const ListEquality().hash([e?.placeRef, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UserFollowedPlacesRecord;
}
