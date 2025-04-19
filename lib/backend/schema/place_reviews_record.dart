import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceReviewsRecord extends FirestoreRecord {
  PlaceReviewsRecord._(
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

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rating = castToType<double>(snapshotData['rating']);
    _description = snapshotData['description'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('placeReviews')
          : FirebaseFirestore.instance.collectionGroup('placeReviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('placeReviews').doc(id);

  static Stream<PlaceReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceReviewsRecord.fromSnapshot(s));

  static Future<PlaceReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceReviewsRecord.fromSnapshot(s));

  static PlaceReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceReviewsRecordData({
  double? rating,
  String? description,
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'description': description,
      'active': active,
      'createdAt': createdAt,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceReviewsRecordDocumentEquality
    implements Equality<PlaceReviewsRecord> {
  const PlaceReviewsRecordDocumentEquality();

  @override
  bool equals(PlaceReviewsRecord? e1, PlaceReviewsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.description == e2?.description &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(PlaceReviewsRecord? e) => const ListEquality()
      .hash([e?.rating, e?.description, e?.active, e?.createdAt, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is PlaceReviewsRecord;
}
