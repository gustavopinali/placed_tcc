import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitLikesRecord extends FirestoreRecord {
  VisitLikesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "visitRef" field.
  DocumentReference? _visitRef;
  DocumentReference? get visitRef => _visitRef;
  bool hasVisitRef() => _visitRef != null;

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
    _visitRef = snapshotData['visitRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitLikes')
          : FirebaseFirestore.instance.collectionGroup('visitLikes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitLikes').doc(id);

  static Stream<VisitLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitLikesRecord.fromSnapshot(s));

  static Future<VisitLikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitLikesRecord.fromSnapshot(s));

  static VisitLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitLikesRecordData({
  DocumentReference? userRef,
  DocumentReference? visitRef,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'visitRef': visitRef,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitLikesRecordDocumentEquality implements Equality<VisitLikesRecord> {
  const VisitLikesRecordDocumentEquality();

  @override
  bool equals(VisitLikesRecord? e1, VisitLikesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.visitRef == e2?.visitRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(VisitLikesRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.visitRef, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is VisitLikesRecord;
}
