import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeConfigurationRecord extends FirestoreRecord {
  StripeConfigurationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "asdasd" field.
  String? _asdasd;
  String get asdasd => _asdasd ?? '';
  bool hasAsdasd() => _asdasd != null;

  void _initializeFields() {
    _asdasd = snapshotData['asdasd'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stripeConfiguration');

  static Stream<StripeConfigurationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StripeConfigurationRecord.fromSnapshot(s));

  static Future<StripeConfigurationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StripeConfigurationRecord.fromSnapshot(s));

  static StripeConfigurationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StripeConfigurationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StripeConfigurationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StripeConfigurationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StripeConfigurationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StripeConfigurationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStripeConfigurationRecordData({
  String? asdasd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'asdasd': asdasd,
    }.withoutNulls,
  );

  return firestoreData;
}

class StripeConfigurationRecordDocumentEquality
    implements Equality<StripeConfigurationRecord> {
  const StripeConfigurationRecordDocumentEquality();

  @override
  bool equals(StripeConfigurationRecord? e1, StripeConfigurationRecord? e2) {
    return e1?.asdasd == e2?.asdasd;
  }

  @override
  int hash(StripeConfigurationRecord? e) =>
      const ListEquality().hash([e?.asdasd]);

  @override
  bool isValidKey(Object? o) => o is StripeConfigurationRecord;
}
