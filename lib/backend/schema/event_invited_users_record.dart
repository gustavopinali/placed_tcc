import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventInvitedUsersRecord extends FirestoreRecord {
  EventInvitedUsersRecord._(
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

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "refused" field.
  bool? _refused;
  bool get refused => _refused ?? false;
  bool hasRefused() => _refused != null;

  // "answered" field.
  bool? _answered;
  bool get answered => _answered ?? false;
  bool hasAnswered() => _answered != null;

  // "answeredAt" field.
  DateTime? _answeredAt;
  DateTime? get answeredAt => _answeredAt;
  bool hasAnsweredAt() => _answeredAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _accepted = snapshotData['accepted'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _refused = snapshotData['refused'] as bool?;
    _answered = snapshotData['answered'] as bool?;
    _answeredAt = snapshotData['answeredAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventInvitedUsers')
          : FirebaseFirestore.instance.collectionGroup('eventInvitedUsers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('eventInvitedUsers').doc(id);

  static Stream<EventInvitedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventInvitedUsersRecord.fromSnapshot(s));

  static Future<EventInvitedUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventInvitedUsersRecord.fromSnapshot(s));

  static EventInvitedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventInvitedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventInvitedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventInvitedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventInvitedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventInvitedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventInvitedUsersRecordData({
  DocumentReference? userRef,
  bool? active,
  bool? accepted,
  DateTime? createdAt,
  DocumentReference? createdBy,
  bool? refused,
  bool? answered,
  DateTime? answeredAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'active': active,
      'accepted': accepted,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'refused': refused,
      'answered': answered,
      'answeredAt': answeredAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventInvitedUsersRecordDocumentEquality
    implements Equality<EventInvitedUsersRecord> {
  const EventInvitedUsersRecordDocumentEquality();

  @override
  bool equals(EventInvitedUsersRecord? e1, EventInvitedUsersRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.active == e2?.active &&
        e1?.accepted == e2?.accepted &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.refused == e2?.refused &&
        e1?.answered == e2?.answered &&
        e1?.answeredAt == e2?.answeredAt;
  }

  @override
  int hash(EventInvitedUsersRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.active,
        e?.accepted,
        e?.createdAt,
        e?.createdBy,
        e?.refused,
        e?.answered,
        e?.answeredAt
      ]);

  @override
  bool isValidKey(Object? o) => o is EventInvitedUsersRecord;
}
