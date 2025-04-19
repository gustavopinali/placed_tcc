// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceDataStruct extends FFFirebaseStruct {
  PlaceDataStruct({
    String? name,
    String? description,
    double? rating,
    String? address,
    List<DocumentReference>? categories,
    List<ImageStruct>? images,
    PlaceLinksStruct? links,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _rating = rating,
        _address = address,
        _categories = categories,
        _images = images,
        _links = links,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  set categories(List<DocumentReference>? val) => _categories = val;

  void updateCategories(Function(List<DocumentReference>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "images" field.
  List<ImageStruct>? _images;
  List<ImageStruct> get images => _images ?? const [];
  set images(List<ImageStruct>? val) => _images = val;

  void updateImages(Function(List<ImageStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "links" field.
  PlaceLinksStruct? _links;
  PlaceLinksStruct get links => _links ?? PlaceLinksStruct();
  set links(PlaceLinksStruct? val) => _links = val;

  void updateLinks(Function(PlaceLinksStruct) updateFn) {
    updateFn(_links ??= PlaceLinksStruct());
  }

  bool hasLinks() => _links != null;

  static PlaceDataStruct fromMap(Map<String, dynamic> data) => PlaceDataStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        rating: castToType<double>(data['rating']),
        address: data['address'] as String?,
        categories: getDataList(data['categories']),
        images: getStructList(
          data['images'],
          ImageStruct.fromMap,
        ),
        links: PlaceLinksStruct.maybeFromMap(data['links']),
      );

  static PlaceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'rating': _rating,
        'address': _address,
        'categories': _categories,
        'images': _images?.map((e) => e.toMap()).toList(),
        'links': _links?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.DocumentReference,
          isList: true,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'links': serializeParam(
          _links,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PlaceDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        categories: deserializeParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['categories'],
        ),
        images: deserializeStructParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        links: deserializeStructParam(
          data['links'],
          ParamType.DataStruct,
          false,
          structBuilder: PlaceLinksStruct.fromSerializableMap,
        ),
      );

  static PlaceDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceDataStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        rating: convertAlgoliaParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        categories: convertAlgoliaParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
        ),
        images: convertAlgoliaParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromAlgoliaData,
        ),
        links: convertAlgoliaParam(
          data['links'],
          ParamType.DataStruct,
          false,
          structBuilder: PlaceLinksStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceDataStruct &&
        name == other.name &&
        description == other.description &&
        rating == other.rating &&
        address == other.address &&
        listEquality.equals(categories, other.categories) &&
        listEquality.equals(images, other.images) &&
        links == other.links;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, description, rating, address, categories, images, links]);
}

PlaceDataStruct createPlaceDataStruct({
  String? name,
  String? description,
  double? rating,
  String? address,
  PlaceLinksStruct? links,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceDataStruct(
      name: name,
      description: description,
      rating: rating,
      address: address,
      links: links ?? (clearUnsetFields ? PlaceLinksStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceDataStruct? updatePlaceDataStruct(
  PlaceDataStruct? placeData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceDataStructData(
  Map<String, dynamic> firestoreData,
  PlaceDataStruct? placeData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeData == null) {
    return;
  }
  if (placeData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeDataData = getPlaceDataFirestoreData(placeData, forFieldValue);
  final nestedData = placeDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceDataFirestoreData(
  PlaceDataStruct? placeData, [
  bool forFieldValue = false,
]) {
  if (placeData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeData.toMap());

  // Handle nested data for "links" field.
  addPlaceLinksStructData(
    firestoreData,
    placeData.hasLinks() ? placeData.links : null,
    'links',
    forFieldValue,
  );

  // Add any Firestore field values
  placeData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceDataListFirestoreData(
  List<PlaceDataStruct>? placeDatas,
) =>
    placeDatas?.map((e) => getPlaceDataFirestoreData(e, true)).toList() ?? [];
