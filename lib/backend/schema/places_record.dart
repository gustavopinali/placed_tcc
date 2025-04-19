import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "placeGoogle" field.
  String? _placeGoogle;
  String get placeGoogle => _placeGoogle ?? '';
  bool hasPlaceGoogle() => _placeGoogle != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

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

  // "placeLinks" field.
  PlaceLinksStruct? _placeLinks;
  PlaceLinksStruct get placeLinks => _placeLinks ?? PlaceLinksStruct();
  bool hasPlaceLinks() => _placeLinks != null;

  // "placeImages" field.
  List<ImageStruct>? _placeImages;
  List<ImageStruct> get placeImages => _placeImages ?? const [];
  bool hasPlaceImages() => _placeImages != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _rating = castToType<double>(snapshotData['rating']);
    _level = castToType<int>(snapshotData['level']);
    _placeGoogle = snapshotData['placeGoogle'] as String?;
    _address = snapshotData['address'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _placeData = PlaceDataStruct.maybeFromMap(snapshotData['placeData']);
    _placeConfig = PlaceConfigStruct.maybeFromMap(snapshotData['placeConfig']);
    _placeStatus = PlaceStatusStruct.maybeFromMap(snapshotData['placeStatus']);
    _placeLinks = PlaceLinksStruct.maybeFromMap(snapshotData['placeLinks']);
    _placeImages = getStructList(
      snapshotData['placeImages'],
      ImageStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  static PlacesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PlacesRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'rating': convertAlgoliaParam(
            snapshot.data['rating'],
            ParamType.double,
            false,
          ),
          'level': convertAlgoliaParam(
            snapshot.data['level'],
            ParamType.int,
            false,
          ),
          'placeGoogle': snapshot.data['placeGoogle'],
          'address': snapshot.data['address'],
          'categories': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['categories'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'placeData':
              PlaceDataStruct.fromAlgoliaData(snapshot.data['placeData'] ?? {})
                  .toMap(),
          'placeConfig': PlaceConfigStruct.fromAlgoliaData(
                  snapshot.data['placeConfig'] ?? {})
              .toMap(),
          'placeStatus': PlaceStatusStruct.fromAlgoliaData(
                  snapshot.data['placeStatus'] ?? {})
              .toMap(),
          'placeLinks': PlaceLinksStruct.fromAlgoliaData(
                  snapshot.data['placeLinks'] ?? {})
              .toMap(),
          'placeImages': safeGet(
            () => (snapshot.data['placeImages'] as Iterable)
                .map((d) => ImageStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
        },
        PlacesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PlacesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'places',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  String? name,
  LatLng? location,
  double? rating,
  int? level,
  String? placeGoogle,
  String? address,
  PlaceDataStruct? placeData,
  PlaceConfigStruct? placeConfig,
  PlaceStatusStruct? placeStatus,
  PlaceLinksStruct? placeLinks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'rating': rating,
      'level': level,
      'placeGoogle': placeGoogle,
      'address': address,
      'placeData': PlaceDataStruct().toMap(),
      'placeConfig': PlaceConfigStruct().toMap(),
      'placeStatus': PlaceStatusStruct().toMap(),
      'placeLinks': PlaceLinksStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "placeData" field.
  addPlaceDataStructData(firestoreData, placeData, 'placeData');

  // Handle nested data for "placeConfig" field.
  addPlaceConfigStructData(firestoreData, placeConfig, 'placeConfig');

  // Handle nested data for "placeStatus" field.
  addPlaceStatusStructData(firestoreData, placeStatus, 'placeStatus');

  // Handle nested data for "placeLinks" field.
  addPlaceLinksStructData(firestoreData, placeLinks, 'placeLinks');

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.rating == e2?.rating &&
        e1?.level == e2?.level &&
        e1?.placeGoogle == e2?.placeGoogle &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.placeData == e2?.placeData &&
        e1?.placeConfig == e2?.placeConfig &&
        e1?.placeStatus == e2?.placeStatus &&
        e1?.placeLinks == e2?.placeLinks &&
        listEquality.equals(e1?.placeImages, e2?.placeImages);
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.rating,
        e?.level,
        e?.placeGoogle,
        e?.address,
        e?.categories,
        e?.placeData,
        e?.placeConfig,
        e?.placeStatus,
        e?.placeLinks,
        e?.placeImages
      ]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
