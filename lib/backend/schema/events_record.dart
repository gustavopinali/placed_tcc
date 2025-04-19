import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
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

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "eventData" field.
  EventDataStruct? _eventData;
  EventDataStruct get eventData => _eventData ?? EventDataStruct();
  bool hasEventData() => _eventData != null;

  // "eventConfig" field.
  EventConfigStruct? _eventConfig;
  EventConfigStruct get eventConfig => _eventConfig ?? EventConfigStruct();
  bool hasEventConfig() => _eventConfig != null;

  // "eventStatus" field.
  EventStatusStruct? _eventStatus;
  EventStatusStruct get eventStatus => _eventStatus ?? EventStatusStruct();
  bool hasEventStatus() => _eventStatus != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "subRef" field.
  DocumentReference? _subRef;
  DocumentReference? get subRef => _subRef;
  bool hasSubRef() => _subRef != null;

  // "eventLinks" field.
  EventLinksStruct? _eventLinks;
  EventLinksStruct get eventLinks => _eventLinks ?? EventLinksStruct();
  bool hasEventLinks() => _eventLinks != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _start = snapshotData['start'] as DateTime?;
    _end = snapshotData['end'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _level = castToType<int>(snapshotData['level']);
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _categories = getDataList(snapshotData['categories']);
    _eventData = EventDataStruct.maybeFromMap(snapshotData['eventData']);
    _eventConfig = EventConfigStruct.maybeFromMap(snapshotData['eventConfig']);
    _eventStatus = EventStatusStruct.maybeFromMap(snapshotData['eventStatus']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _subRef = snapshotData['subRef'] as DocumentReference?;
    _eventLinks = EventLinksStruct.maybeFromMap(snapshotData['eventLinks']);
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  static EventsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'start': convertAlgoliaParam(
            snapshot.data['start'],
            ParamType.DateTime,
            false,
          ),
          'end': convertAlgoliaParam(
            snapshot.data['end'],
            ParamType.DateTime,
            false,
          ),
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'level': convertAlgoliaParam(
            snapshot.data['level'],
            ParamType.int,
            false,
          ),
          'placeRef': convertAlgoliaParam(
            snapshot.data['placeRef'],
            ParamType.DocumentReference,
            false,
          ),
          'categories': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['categories'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'eventData':
              EventDataStruct.fromAlgoliaData(snapshot.data['eventData'] ?? {})
                  .toMap(),
          'eventConfig': EventConfigStruct.fromAlgoliaData(
                  snapshot.data['eventConfig'] ?? {})
              .toMap(),
          'eventStatus': EventStatusStruct.fromAlgoliaData(
                  snapshot.data['eventStatus'] ?? {})
              .toMap(),
          'userRef': convertAlgoliaParam(
            snapshot.data['userRef'],
            ParamType.DocumentReference,
            false,
          ),
          'subRef': convertAlgoliaParam(
            snapshot.data['subRef'],
            ParamType.DocumentReference,
            false,
          ),
          'eventLinks': EventLinksStruct.fromAlgoliaData(
                  snapshot.data['eventLinks'] ?? {})
              .toMap(),
          'address': snapshot.data['address'],
        },
        EventsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'events',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  String? description,
  DateTime? start,
  DateTime? end,
  LatLng? location,
  int? level,
  DocumentReference? placeRef,
  EventDataStruct? eventData,
  EventConfigStruct? eventConfig,
  EventStatusStruct? eventStatus,
  DocumentReference? userRef,
  DocumentReference? subRef,
  EventLinksStruct? eventLinks,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'start': start,
      'end': end,
      'location': location,
      'level': level,
      'placeRef': placeRef,
      'eventData': EventDataStruct().toMap(),
      'eventConfig': EventConfigStruct().toMap(),
      'eventStatus': EventStatusStruct().toMap(),
      'userRef': userRef,
      'subRef': subRef,
      'eventLinks': EventLinksStruct().toMap(),
      'address': address,
    }.withoutNulls,
  );

  // Handle nested data for "eventData" field.
  addEventDataStructData(firestoreData, eventData, 'eventData');

  // Handle nested data for "eventConfig" field.
  addEventConfigStructData(firestoreData, eventConfig, 'eventConfig');

  // Handle nested data for "eventStatus" field.
  addEventStatusStructData(firestoreData, eventStatus, 'eventStatus');

  // Handle nested data for "eventLinks" field.
  addEventLinksStructData(firestoreData, eventLinks, 'eventLinks');

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.start == e2?.start &&
        e1?.end == e2?.end &&
        e1?.location == e2?.location &&
        e1?.level == e2?.level &&
        e1?.placeRef == e2?.placeRef &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.eventData == e2?.eventData &&
        e1?.eventConfig == e2?.eventConfig &&
        e1?.eventStatus == e2?.eventStatus &&
        e1?.userRef == e2?.userRef &&
        e1?.subRef == e2?.subRef &&
        e1?.eventLinks == e2?.eventLinks &&
        e1?.address == e2?.address;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.start,
        e?.end,
        e?.location,
        e?.level,
        e?.placeRef,
        e?.categories,
        e?.eventData,
        e?.eventConfig,
        e?.eventStatus,
        e?.userRef,
        e?.subRef,
        e?.eventLinks,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
