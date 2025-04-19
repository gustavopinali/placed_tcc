import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutRecord extends FirestoreRecord {
  CheckoutRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "stripe" field.
  bool? _stripe;
  bool get stripe => _stripe ?? false;
  bool hasStripe() => _stripe != null;

  // "stripeSessionID" field.
  String? _stripeSessionID;
  String get stripeSessionID => _stripeSessionID ?? '';
  bool hasStripeSessionID() => _stripeSessionID != null;

  // "error" field.
  bool? _error;
  bool get error => _error ?? false;
  bool hasError() => _error != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _stripe = snapshotData['stripe'] as bool?;
    _stripeSessionID = snapshotData['stripeSessionID'] as String?;
    _error = snapshotData['error'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checkout');

  static Stream<CheckoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckoutRecord.fromSnapshot(s));

  static Future<CheckoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckoutRecord.fromSnapshot(s));

  static CheckoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckoutRecordData({
  DocumentReference? userRef,
  bool? stripe,
  String? stripeSessionID,
  bool? error,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'stripe': stripe,
      'stripeSessionID': stripeSessionID,
      'error': error,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckoutRecordDocumentEquality implements Equality<CheckoutRecord> {
  const CheckoutRecordDocumentEquality();

  @override
  bool equals(CheckoutRecord? e1, CheckoutRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.stripe == e2?.stripe &&
        e1?.stripeSessionID == e2?.stripeSessionID &&
        e1?.error == e2?.error;
  }

  @override
  int hash(CheckoutRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.stripe, e?.stripeSessionID, e?.error]);

  @override
  bool isValidKey(Object? o) => o is CheckoutRecord;
}
