import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitsRecord extends FirestoreRecord {
  VisitsRecord._(
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

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "checkIn" field.
  bool? _checkIn;
  bool get checkIn => _checkIn ?? false;
  bool hasCheckIn() => _checkIn != null;

  // "checkInTime" field.
  DateTime? _checkInTime;
  DateTime? get checkInTime => _checkInTime;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOut" field.
  bool? _checkOut;
  bool get checkOut => _checkOut ?? false;
  bool hasCheckOut() => _checkOut != null;

  // "checkOutTime" field.
  DateTime? _checkOutTime;
  DateTime? get checkOutTime => _checkOutTime;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "checkList" field.
  List<DateTime>? _checkList;
  List<DateTime> get checkList => _checkList ?? const [];
  bool hasCheckList() => _checkList != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "scheduling" field.
  bool? _scheduling;
  bool get scheduling => _scheduling ?? false;
  bool hasScheduling() => _scheduling != null;

  // "schedulingTime" field.
  DateTime? _schedulingTime;
  DateTime? get schedulingTime => _schedulingTime;
  bool hasSchedulingTime() => _schedulingTime != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "place" field.
  bool? _place;
  bool get place => _place ?? false;
  bool hasPlace() => _place != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _checkIn = snapshotData['checkIn'] as bool?;
    _checkInTime = snapshotData['checkInTime'] as DateTime?;
    _checkOut = snapshotData['checkOut'] as bool?;
    _checkOutTime = snapshotData['checkOutTime'] as DateTime?;
    _checkList = getDataList(snapshotData['checkList']);
    _location = snapshotData['location'] as LatLng?;
    _scheduling = snapshotData['scheduling'] as bool?;
    _schedulingTime = snapshotData['schedulingTime'] as DateTime?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _place = snapshotData['place'] as bool?;
    _event = snapshotData['event'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visits');

  static Stream<VisitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitsRecord.fromSnapshot(s));

  static Future<VisitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitsRecord.fromSnapshot(s));

  static VisitsRecord fromSnapshot(DocumentSnapshot snapshot) => VisitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitsRecordData({
  DocumentReference? userRef,
  DocumentReference? placeRef,
  DocumentReference? eventRef,
  bool? checkIn,
  DateTime? checkInTime,
  bool? checkOut,
  DateTime? checkOutTime,
  LatLng? location,
  bool? scheduling,
  DateTime? schedulingTime,
  bool? active,
  DateTime? createdAt,
  bool? place,
  bool? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'placeRef': placeRef,
      'eventRef': eventRef,
      'checkIn': checkIn,
      'checkInTime': checkInTime,
      'checkOut': checkOut,
      'checkOutTime': checkOutTime,
      'location': location,
      'scheduling': scheduling,
      'schedulingTime': schedulingTime,
      'active': active,
      'createdAt': createdAt,
      'place': place,
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitsRecordDocumentEquality implements Equality<VisitsRecord> {
  const VisitsRecordDocumentEquality();

  @override
  bool equals(VisitsRecord? e1, VisitsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.checkIn == e2?.checkIn &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOut == e2?.checkOut &&
        e1?.checkOutTime == e2?.checkOutTime &&
        listEquality.equals(e1?.checkList, e2?.checkList) &&
        e1?.location == e2?.location &&
        e1?.scheduling == e2?.scheduling &&
        e1?.schedulingTime == e2?.schedulingTime &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.place == e2?.place &&
        e1?.event == e2?.event;
  }

  @override
  int hash(VisitsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.placeRef,
        e?.eventRef,
        e?.checkIn,
        e?.checkInTime,
        e?.checkOut,
        e?.checkOutTime,
        e?.checkList,
        e?.location,
        e?.scheduling,
        e?.schedulingTime,
        e?.active,
        e?.createdAt,
        e?.place,
        e?.event
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitsRecord;
}
