import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceSubscriptionRecord extends FirestoreRecord {
  PlaceSubscriptionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "subscriptionRef" field.
  DocumentReference? _subscriptionRef;
  DocumentReference? get subscriptionRef => _subscriptionRef;
  bool hasSubscriptionRef() => _subscriptionRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _subscriptionRef = snapshotData['subscriptionRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('placeSubscription')
          : FirebaseFirestore.instance.collectionGroup('placeSubscription');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('placeSubscription').doc(id);

  static Stream<PlaceSubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceSubscriptionRecord.fromSnapshot(s));

  static Future<PlaceSubscriptionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlaceSubscriptionRecord.fromSnapshot(s));

  static PlaceSubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceSubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceSubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceSubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceSubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceSubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceSubscriptionRecordData({
  DocumentReference? userRef,
  DocumentReference? subscriptionRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'subscriptionRef': subscriptionRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceSubscriptionRecordDocumentEquality
    implements Equality<PlaceSubscriptionRecord> {
  const PlaceSubscriptionRecordDocumentEquality();

  @override
  bool equals(PlaceSubscriptionRecord? e1, PlaceSubscriptionRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.subscriptionRef == e2?.subscriptionRef;
  }

  @override
  int hash(PlaceSubscriptionRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.subscriptionRef]);

  @override
  bool isValidKey(Object? o) => o is PlaceSubscriptionRecord;
}
