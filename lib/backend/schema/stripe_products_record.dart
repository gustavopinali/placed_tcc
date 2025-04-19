import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeProductsRecord extends FirestoreRecord {
  StripeProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "metadata" field.
  StripeProductDataStruct? _metadata;
  StripeProductDataStruct get metadata =>
      _metadata ?? StripeProductDataStruct();
  bool hasMetadata() => _metadata != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _images = getDataList(snapshotData['images']);
    _active = snapshotData['active'] as bool?;
    _role = snapshotData['role'] as String?;
    _metadata = StripeProductDataStruct.maybeFromMap(snapshotData['metadata']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stripeProducts');

  static Stream<StripeProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StripeProductsRecord.fromSnapshot(s));

  static Future<StripeProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StripeProductsRecord.fromSnapshot(s));

  static StripeProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StripeProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StripeProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StripeProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StripeProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StripeProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStripeProductsRecordData({
  String? name,
  String? description,
  bool? active,
  String? role,
  StripeProductDataStruct? metadata,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'active': active,
      'role': role,
      'metadata': StripeProductDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "metadata" field.
  addStripeProductDataStructData(firestoreData, metadata, 'metadata');

  return firestoreData;
}

class StripeProductsRecordDocumentEquality
    implements Equality<StripeProductsRecord> {
  const StripeProductsRecordDocumentEquality();

  @override
  bool equals(StripeProductsRecord? e1, StripeProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.active == e2?.active &&
        e1?.role == e2?.role &&
        e1?.metadata == e2?.metadata;
  }

  @override
  int hash(StripeProductsRecord? e) => const ListEquality().hash(
      [e?.name, e?.description, e?.images, e?.active, e?.role, e?.metadata]);

  @override
  bool isValidKey(Object? o) => o is StripeProductsRecord;
}
