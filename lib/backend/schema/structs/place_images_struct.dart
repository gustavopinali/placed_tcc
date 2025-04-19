// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceImagesStruct extends FFFirebaseStruct {
  PlaceImagesStruct({
    List<ImageStruct>? images,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _images = images,
        super(firestoreUtilData);

  // "images" field.
  List<ImageStruct>? _images;
  List<ImageStruct> get images => _images ?? const [];
  set images(List<ImageStruct>? val) => _images = val;

  void updateImages(Function(List<ImageStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  static PlaceImagesStruct fromMap(Map<String, dynamic> data) =>
      PlaceImagesStruct(
        images: getStructList(
          data['images'],
          ImageStruct.fromMap,
        ),
      );

  static PlaceImagesStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceImagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'images': _images?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PlaceImagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceImagesStruct(
        images: deserializeStructParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
      );

  static PlaceImagesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceImagesStruct(
        images: convertAlgoliaParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceImagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceImagesStruct &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([images]);
}

PlaceImagesStruct createPlaceImagesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceImagesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceImagesStruct? updatePlaceImagesStruct(
  PlaceImagesStruct? placeImages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeImages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceImagesStructData(
  Map<String, dynamic> firestoreData,
  PlaceImagesStruct? placeImages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeImages == null) {
    return;
  }
  if (placeImages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeImages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeImagesData =
      getPlaceImagesFirestoreData(placeImages, forFieldValue);
  final nestedData =
      placeImagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeImages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceImagesFirestoreData(
  PlaceImagesStruct? placeImages, [
  bool forFieldValue = false,
]) {
  if (placeImages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeImages.toMap());

  // Add any Firestore field values
  placeImages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceImagesListFirestoreData(
  List<PlaceImagesStruct>? placeImagess,
) =>
    placeImagess?.map((e) => getPlaceImagesFirestoreData(e, true)).toList() ??
    [];
