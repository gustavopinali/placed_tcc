import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricesRecord extends FirestoreRecord {
  PricesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  bool hasProduct() => _product != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "interval" field.
  String? _interval;
  String get interval => _interval ?? '';
  bool hasInterval() => _interval != null;

  // "interval_count" field.
  int? _intervalCount;
  int get intervalCount => _intervalCount ?? 0;
  bool hasIntervalCount() => _intervalCount != null;

  // "unit_amount" field.
  int? _unitAmount;
  int get unitAmount => _unitAmount ?? 0;
  bool hasUnitAmount() => _unitAmount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _product = snapshotData['product'] as String?;
    _type = snapshotData['type'] as String?;
    _interval = snapshotData['interval'] as String?;
    _intervalCount = castToType<int>(snapshotData['interval_count']);
    _unitAmount = castToType<int>(snapshotData['unit_amount']);
    _currency = snapshotData['currency'] as String?;
    _active = snapshotData['active'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('prices')
          : FirebaseFirestore.instance.collectionGroup('prices');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('prices').doc(id);

  static Stream<PricesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricesRecord.fromSnapshot(s));

  static Future<PricesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricesRecord.fromSnapshot(s));

  static PricesRecord fromSnapshot(DocumentSnapshot snapshot) => PricesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricesRecordData({
  String? product,
  String? type,
  String? interval,
  int? intervalCount,
  int? unitAmount,
  String? currency,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product': product,
      'type': type,
      'interval': interval,
      'interval_count': intervalCount,
      'unit_amount': unitAmount,
      'currency': currency,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricesRecordDocumentEquality implements Equality<PricesRecord> {
  const PricesRecordDocumentEquality();

  @override
  bool equals(PricesRecord? e1, PricesRecord? e2) {
    return e1?.product == e2?.product &&
        e1?.type == e2?.type &&
        e1?.interval == e2?.interval &&
        e1?.intervalCount == e2?.intervalCount &&
        e1?.unitAmount == e2?.unitAmount &&
        e1?.currency == e2?.currency &&
        e1?.active == e2?.active;
  }

  @override
  int hash(PricesRecord? e) => const ListEquality().hash([
        e?.product,
        e?.type,
        e?.interval,
        e?.intervalCount,
        e?.unitAmount,
        e?.currency,
        e?.active
      ]);

  @override
  bool isValidKey(Object? o) => o is PricesRecord;
}
