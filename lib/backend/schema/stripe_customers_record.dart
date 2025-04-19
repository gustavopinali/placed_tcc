import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeCustomersRecord extends FirestoreRecord {
  StripeCustomersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "stripeId" field.
  String? _stripeId;
  String get stripeId => _stripeId ?? '';
  bool hasStripeId() => _stripeId != null;

  // "stripeLink" field.
  String? _stripeLink;
  String get stripeLink => _stripeLink ?? '';
  bool hasStripeLink() => _stripeLink != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _stripeId = snapshotData['stripeId'] as String?;
    _stripeLink = snapshotData['stripeLink'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stripeCustomers');

  static Stream<StripeCustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StripeCustomersRecord.fromSnapshot(s));

  static Future<StripeCustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StripeCustomersRecord.fromSnapshot(s));

  static StripeCustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StripeCustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StripeCustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StripeCustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StripeCustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StripeCustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStripeCustomersRecordData({
  String? email,
  String? stripeId,
  String? stripeLink,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'stripeId': stripeId,
      'stripeLink': stripeLink,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StripeCustomersRecordDocumentEquality
    implements Equality<StripeCustomersRecord> {
  const StripeCustomersRecordDocumentEquality();

  @override
  bool equals(StripeCustomersRecord? e1, StripeCustomersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.stripeId == e2?.stripeId &&
        e1?.stripeLink == e2?.stripeLink &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(StripeCustomersRecord? e) => const ListEquality()
      .hash([e?.email, e?.stripeId, e?.stripeLink, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is StripeCustomersRecord;
}
