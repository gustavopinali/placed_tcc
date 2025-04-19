import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceSubImagesRecord extends FirestoreRecord {
  PlaceSubImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

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
    _image = snapshotData['image'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('placeSubImages')
          : FirebaseFirestore.instance.collectionGroup('placeSubImages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('placeSubImages').doc(id);

  static Stream<PlaceSubImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceSubImagesRecord.fromSnapshot(s));

  static Future<PlaceSubImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceSubImagesRecord.fromSnapshot(s));

  static PlaceSubImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceSubImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceSubImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceSubImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceSubImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceSubImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceSubImagesRecordData({
  String? image,
  int? order,
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'order': order,
      'active': active,
      'createdAt': createdAt,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceSubImagesRecordDocumentEquality
    implements Equality<PlaceSubImagesRecord> {
  const PlaceSubImagesRecordDocumentEquality();

  @override
  bool equals(PlaceSubImagesRecord? e1, PlaceSubImagesRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.order == e2?.order &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(PlaceSubImagesRecord? e) => const ListEquality()
      .hash([e?.image, e?.order, e?.active, e?.createdAt, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is PlaceSubImagesRecord;
}
