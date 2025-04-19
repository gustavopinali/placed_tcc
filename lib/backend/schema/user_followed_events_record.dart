import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFollowedEventsRecord extends FirestoreRecord {
  UserFollowedEventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

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
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userFollowedEvents')
          : FirebaseFirestore.instance.collectionGroup('userFollowedEvents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userFollowedEvents').doc(id);

  static Stream<UserFollowedEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFollowedEventsRecord.fromSnapshot(s));

  static Future<UserFollowedEventsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserFollowedEventsRecord.fromSnapshot(s));

  static UserFollowedEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFollowedEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFollowedEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFollowedEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFollowedEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFollowedEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFollowedEventsRecordData({
  DocumentReference? eventRef,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventRef': eventRef,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFollowedEventsRecordDocumentEquality
    implements Equality<UserFollowedEventsRecord> {
  const UserFollowedEventsRecordDocumentEquality();

  @override
  bool equals(UserFollowedEventsRecord? e1, UserFollowedEventsRecord? e2) {
    return e1?.eventRef == e2?.eventRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UserFollowedEventsRecord? e) =>
      const ListEquality().hash([e?.eventRef, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UserFollowedEventsRecord;
}
