import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxRatesRecord extends FirestoreRecord {
  TaxRatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "aaaaa" field.
  int? _aaaaa;
  int get aaaaa => _aaaaa ?? 0;
  bool hasAaaaa() => _aaaaa != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _aaaaa = castToType<int>(snapshotData['aaaaa']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tax_rates')
          : FirebaseFirestore.instance.collectionGroup('tax_rates');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tax_rates').doc(id);

  static Stream<TaxRatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaxRatesRecord.fromSnapshot(s));

  static Future<TaxRatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaxRatesRecord.fromSnapshot(s));

  static TaxRatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaxRatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaxRatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaxRatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaxRatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaxRatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaxRatesRecordData({
  int? aaaaa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aaaaa': aaaaa,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaxRatesRecordDocumentEquality implements Equality<TaxRatesRecord> {
  const TaxRatesRecordDocumentEquality();

  @override
  bool equals(TaxRatesRecord? e1, TaxRatesRecord? e2) {
    return e1?.aaaaa == e2?.aaaaa;
  }

  @override
  int hash(TaxRatesRecord? e) => const ListEquality().hash([e?.aaaaa]);

  @override
  bool isValidKey(Object? o) => o is TaxRatesRecord;
}
