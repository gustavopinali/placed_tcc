import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventConfirmedUsersRecord extends FirestoreRecord {
  EventConfirmedUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

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
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventConfirmedUsers')
          : FirebaseFirestore.instance.collectionGroup('eventConfirmedUsers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('eventConfirmedUsers').doc(id);

  static Stream<EventConfirmedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventConfirmedUsersRecord.fromSnapshot(s));

  static Future<EventConfirmedUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventConfirmedUsersRecord.fromSnapshot(s));

  static EventConfirmedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventConfirmedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventConfirmedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventConfirmedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventConfirmedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventConfirmedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventConfirmedUsersRecordData({
  DocumentReference? userRef,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventConfirmedUsersRecordDocumentEquality
    implements Equality<EventConfirmedUsersRecord> {
  const EventConfirmedUsersRecordDocumentEquality();

  @override
  bool equals(EventConfirmedUsersRecord? e1, EventConfirmedUsersRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(EventConfirmedUsersRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is EventConfirmedUsersRecord;
}
