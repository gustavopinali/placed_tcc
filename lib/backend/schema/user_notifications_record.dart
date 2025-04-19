import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationsRecord extends FirestoreRecord {
  UserNotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  TextStruct? _text;
  TextStruct get text => _text ?? TextStruct();
  bool hasText() => _text != null;

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

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "viewed" field.
  bool? _viewed;
  bool get viewed => _viewed ?? false;
  bool hasViewed() => _viewed != null;

  // "viewedAt" field.
  DateTime? _viewedAt;
  DateTime? get viewedAt => _viewedAt;
  bool hasViewedAt() => _viewedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = TextStruct.maybeFromMap(snapshotData['text']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _viewed = snapshotData['viewed'] as bool?;
    _viewedAt = snapshotData['viewedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userNotifications')
          : FirebaseFirestore.instance.collectionGroup('userNotifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userNotifications').doc(id);

  static Stream<UserNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationsRecord.fromSnapshot(s));

  static Future<UserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationsRecord.fromSnapshot(s));

  static UserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationsRecordData({
  TextStruct? text,
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? eventRef,
  bool? active,
  DateTime? createdAt,
  bool? viewed,
  DateTime? viewedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': TextStruct().toMap(),
      'userRef': userRef,
      'placeRef': placeRef,
      'eventRef': eventRef,
      'active': active,
      'createdAt': createdAt,
      'viewed': viewed,
      'viewedAt': viewedAt,
    }.withoutNulls,
  );

  // Handle nested data for "text" field.
  addTextStructData(firestoreData, text, 'text');

  return firestoreData;
}

class UserNotificationsRecordDocumentEquality
    implements Equality<UserNotificationsRecord> {
  const UserNotificationsRecordDocumentEquality();

  @override
  bool equals(UserNotificationsRecord? e1, UserNotificationsRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.viewed == e2?.viewed &&
        e1?.viewedAt == e2?.viewedAt;
  }

  @override
  int hash(UserNotificationsRecord? e) => const ListEquality().hash([
        e?.text,
        e?.userRef,
        e?.placeRef,
        e?.eventRef,
        e?.active,
        e?.createdAt,
        e?.viewed,
        e?.viewedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationsRecord;
}
