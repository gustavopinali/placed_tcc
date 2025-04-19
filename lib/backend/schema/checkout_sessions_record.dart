import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutSessionsRecord extends FirestoreRecord {
  CheckoutSessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "aaaa" field.
  String? _aaaa;
  String get aaaa => _aaaa ?? '';
  bool hasAaaa() => _aaaa != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _aaaa = snapshotData['aaaa'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('checkout_sessions')
          : FirebaseFirestore.instance.collectionGroup('checkout_sessions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('checkout_sessions').doc(id);

  static Stream<CheckoutSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckoutSessionsRecord.fromSnapshot(s));

  static Future<CheckoutSessionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CheckoutSessionsRecord.fromSnapshot(s));

  static CheckoutSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckoutSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckoutSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckoutSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckoutSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckoutSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckoutSessionsRecordData({
  String? aaaa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aaaa': aaaa,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckoutSessionsRecordDocumentEquality
    implements Equality<CheckoutSessionsRecord> {
  const CheckoutSessionsRecordDocumentEquality();

  @override
  bool equals(CheckoutSessionsRecord? e1, CheckoutSessionsRecord? e2) {
    return e1?.aaaa == e2?.aaaa;
  }

  @override
  int hash(CheckoutSessionsRecord? e) => const ListEquality().hash([e?.aaaa]);

  @override
  bool isValidKey(Object? o) => o is CheckoutSessionsRecord;
}
