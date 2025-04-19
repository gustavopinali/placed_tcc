import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchLocationsRecord extends FirestoreRecord {
  SearchLocationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "executed" field.
  bool? _executed;
  bool get executed => _executed ?? false;
  bool hasExecuted() => _executed != null;

  // "executedAt" field.
  DateTime? _executedAt;
  DateTime? get executedAt => _executedAt;
  bool hasExecutedAt() => _executedAt != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _executed = snapshotData['executed'] as bool?;
    _executedAt = snapshotData['executedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('searchLocations');

  static Stream<SearchLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchLocationsRecord.fromSnapshot(s));

  static Future<SearchLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchLocationsRecord.fromSnapshot(s));

  static SearchLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchLocationsRecordData({
  LatLng? location,
  DocumentReference? userRef,
  DateTime? createdAt,
  bool? executed,
  DateTime? executedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'userRef': userRef,
      'createdAt': createdAt,
      'executed': executed,
      'executedAt': executedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchLocationsRecordDocumentEquality
    implements Equality<SearchLocationsRecord> {
  const SearchLocationsRecordDocumentEquality();

  @override
  bool equals(SearchLocationsRecord? e1, SearchLocationsRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.executed == e2?.executed &&
        e1?.executedAt == e2?.executedAt;
  }

  @override
  int hash(SearchLocationsRecord? e) => const ListEquality().hash(
      [e?.location, e?.userRef, e?.createdAt, e?.executed, e?.executedAt]);

  @override
  bool isValidKey(Object? o) => o is SearchLocationsRecord;
}
