import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComplaintsRecord extends FirestoreRecord {
  ComplaintsRecord._(
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

  // "postRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "commentRef" field.
  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  bool hasCommentRef() => _commentRef != null;

  // "complaint" field.
  String? _complaint;
  String get complaint => _complaint ?? '';
  bool hasComplaint() => _complaint != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _visitRef = snapshotData['visitRef'] as DocumentReference?;
    _postRef = snapshotData['postRef'] as DocumentReference?;
    _commentRef = snapshotData['commentRef'] as DocumentReference?;
    _complaint = snapshotData['complaint'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('complaints');

  static Stream<ComplaintsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComplaintsRecord.fromSnapshot(s));

  static Future<ComplaintsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComplaintsRecord.fromSnapshot(s));

  static ComplaintsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComplaintsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComplaintsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComplaintsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComplaintsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComplaintsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComplaintsRecordData({
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? eventRef,
  DocumentReference? visitRef,
  DocumentReference? postRef,
  DocumentReference? commentRef,
  String? complaint,
  bool? active,
  DocumentReference? createdBy,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'placeRef': placeRef,
      'eventRef': eventRef,
      'visitRef': visitRef,
      'postRef': postRef,
      'commentRef': commentRef,
      'complaint': complaint,
      'active': active,
      'createdBy': createdBy,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComplaintsRecordDocumentEquality implements Equality<ComplaintsRecord> {
  const ComplaintsRecordDocumentEquality();

  @override
  bool equals(ComplaintsRecord? e1, ComplaintsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.visitRef == e2?.visitRef &&
        e1?.postRef == e2?.postRef &&
        e1?.commentRef == e2?.commentRef &&
        e1?.complaint == e2?.complaint &&
        e1?.active == e2?.active &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ComplaintsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.placeRef,
        e?.eventRef,
        e?.visitRef,
        e?.postRef,
        e?.commentRef,
        e?.complaint,
        e?.active,
        e?.createdBy,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ComplaintsRecord;
}
