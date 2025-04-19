import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventMessagesRecord extends FirestoreRecord {
  EventMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

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
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventMessages')
          : FirebaseFirestore.instance.collectionGroup('eventMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('eventMessages').doc(id);

  static Stream<EventMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventMessagesRecord.fromSnapshot(s));

  static Future<EventMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventMessagesRecord.fromSnapshot(s));

  static EventMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventMessagesRecordData({
  DocumentReference? userRef,
  String? text,
  String? image,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'text': text,
      'image': image,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventMessagesRecordDocumentEquality
    implements Equality<EventMessagesRecord> {
  const EventMessagesRecordDocumentEquality();

  @override
  bool equals(EventMessagesRecord? e1, EventMessagesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(EventMessagesRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.text, e?.image, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is EventMessagesRecord;
}
