import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceSubscriptionsRecord extends FirestoreRecord {
  PlaceSubscriptionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "subscriptionRef" field.
  DocumentReference? _subscriptionRef;
  DocumentReference? get subscriptionRef => _subscriptionRef;
  bool hasSubscriptionRef() => _subscriptionRef != null;

  // "placeName" field.
  String? _placeName;
  String get placeName => _placeName ?? '';
  bool hasPlaceName() => _placeName != null;

  // "placeDescription" field.
  String? _placeDescription;
  String get placeDescription => _placeDescription ?? '';
  bool hasPlaceDescription() => _placeDescription != null;

  // "placeLinks" field.
  PlaceLinksStruct? _placeLinks;
  PlaceLinksStruct get placeLinks => _placeLinks ?? PlaceLinksStruct();
  bool hasPlaceLinks() => _placeLinks != null;

  // "placeData" field.
  PlaceDataStruct? _placeData;
  PlaceDataStruct get placeData => _placeData ?? PlaceDataStruct();
  bool hasPlaceData() => _placeData != null;

  // "placeConfig" field.
  PlaceConfigStruct? _placeConfig;
  PlaceConfigStruct get placeConfig => _placeConfig ?? PlaceConfigStruct();
  bool hasPlaceConfig() => _placeConfig != null;

  // "placeStatus" field.
  PlaceStatusStruct? _placeStatus;
  PlaceStatusStruct get placeStatus => _placeStatus ?? PlaceStatusStruct();
  bool hasPlaceStatus() => _placeStatus != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _subscriptionRef = snapshotData['subscriptionRef'] as DocumentReference?;
    _placeName = snapshotData['placeName'] as String?;
    _placeDescription = snapshotData['placeDescription'] as String?;
    _placeLinks = PlaceLinksStruct.maybeFromMap(snapshotData['placeLinks']);
    _placeData = PlaceDataStruct.maybeFromMap(snapshotData['placeData']);
    _placeConfig = PlaceConfigStruct.maybeFromMap(snapshotData['placeConfig']);
    _placeStatus = PlaceStatusStruct.maybeFromMap(snapshotData['placeStatus']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('placeSubscriptions');

  static Stream<PlaceSubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceSubscriptionsRecord.fromSnapshot(s));

  static Future<PlaceSubscriptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlaceSubscriptionsRecord.fromSnapshot(s));

  static PlaceSubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceSubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceSubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceSubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceSubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceSubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceSubscriptionsRecordData({
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? subscriptionRef,
  String? placeName,
  String? placeDescription,
  PlaceLinksStruct? placeLinks,
  PlaceDataStruct? placeData,
  PlaceConfigStruct? placeConfig,
  PlaceStatusStruct? placeStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'placeRef': placeRef,
      'subscriptionRef': subscriptionRef,
      'placeName': placeName,
      'placeDescription': placeDescription,
      'placeLinks': PlaceLinksStruct().toMap(),
      'placeData': PlaceDataStruct().toMap(),
      'placeConfig': PlaceConfigStruct().toMap(),
      'placeStatus': PlaceStatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "placeLinks" field.
  addPlaceLinksStructData(firestoreData, placeLinks, 'placeLinks');

  // Handle nested data for "placeData" field.
  addPlaceDataStructData(firestoreData, placeData, 'placeData');

  // Handle nested data for "placeConfig" field.
  addPlaceConfigStructData(firestoreData, placeConfig, 'placeConfig');

  // Handle nested data for "placeStatus" field.
  addPlaceStatusStructData(firestoreData, placeStatus, 'placeStatus');

  return firestoreData;
}

class PlaceSubscriptionsRecordDocumentEquality
    implements Equality<PlaceSubscriptionsRecord> {
  const PlaceSubscriptionsRecordDocumentEquality();

  @override
  bool equals(PlaceSubscriptionsRecord? e1, PlaceSubscriptionsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.subscriptionRef == e2?.subscriptionRef &&
        e1?.placeName == e2?.placeName &&
        e1?.placeDescription == e2?.placeDescription &&
        e1?.placeLinks == e2?.placeLinks &&
        e1?.placeData == e2?.placeData &&
        e1?.placeConfig == e2?.placeConfig &&
        e1?.placeStatus == e2?.placeStatus;
  }

  @override
  int hash(PlaceSubscriptionsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.placeRef,
        e?.subscriptionRef,
        e?.placeName,
        e?.placeDescription,
        e?.placeLinks,
        e?.placeData,
        e?.placeConfig,
        e?.placeStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaceSubscriptionsRecord;
}
