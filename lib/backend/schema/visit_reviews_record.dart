import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitReviewsRecord extends FirestoreRecord {
  VisitReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

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

  // "status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rating = castToType<double>(snapshotData['rating']);
    _description = snapshotData['description'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _status = StatusStruct.maybeFromMap(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitReviews')
          : FirebaseFirestore.instance.collectionGroup('visitReviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitReviews').doc(id);

  static Stream<VisitReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitReviewsRecord.fromSnapshot(s));

  static Future<VisitReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitReviewsRecord.fromSnapshot(s));

  static VisitReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitReviewsRecordData({
  double? rating,
  String? description,
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? eventRef,
  StatusStruct? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'description': description,
      'userRef': userRef,
      'placeRef': placeRef,
      'eventRef': eventRef,
      'status': StatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class VisitReviewsRecordDocumentEquality
    implements Equality<VisitReviewsRecord> {
  const VisitReviewsRecordDocumentEquality();

  @override
  bool equals(VisitReviewsRecord? e1, VisitReviewsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.description == e2?.description &&
        e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.status == e2?.status;
  }

  @override
  int hash(VisitReviewsRecord? e) => const ListEquality().hash([
        e?.rating,
        e?.description,
        e?.userRef,
        e?.placeRef,
        e?.eventRef,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitReviewsRecord;
}
