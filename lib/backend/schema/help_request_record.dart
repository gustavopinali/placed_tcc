import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpRequestRecord extends FirestoreRecord {
  HelpRequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "request" field.
  String? _request;
  String get request => _request ?? '';
  bool hasRequest() => _request != null;

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
    _request = snapshotData['request'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('helpRequest');

  static Stream<HelpRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpRequestRecord.fromSnapshot(s));

  static Future<HelpRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpRequestRecord.fromSnapshot(s));

  static HelpRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HelpRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelpRequestRecordData({
  String? request,
  bool? active,
  DocumentReference? createdBy,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'request': request,
      'active': active,
      'createdBy': createdBy,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpRequestRecordDocumentEquality implements Equality<HelpRequestRecord> {
  const HelpRequestRecordDocumentEquality();

  @override
  bool equals(HelpRequestRecord? e1, HelpRequestRecord? e2) {
    return e1?.request == e2?.request &&
        e1?.active == e2?.active &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(HelpRequestRecord? e) => const ListEquality()
      .hash([e?.request, e?.active, e?.createdBy, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is HelpRequestRecord;
}
