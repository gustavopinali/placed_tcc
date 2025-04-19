// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleSeachLocationStruct extends FFFirebaseStruct {
  GoogleSeachLocationStruct({
    List<String>? placeid,
    List<String>? address,
    List<LatLng>? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _placeid = placeid,
        _address = address,
        _location = location,
        super(firestoreUtilData);

  // "placeid" field.
  List<String>? _placeid;
  List<String> get placeid => _placeid ?? const [];
  set placeid(List<String>? val) => _placeid = val;

  void updatePlaceid(Function(List<String>) updateFn) {
    updateFn(_placeid ??= []);
  }

  bool hasPlaceid() => _placeid != null;

  // "address" field.
  List<String>? _address;
  List<String> get address => _address ?? const [];
  set address(List<String>? val) => _address = val;

  void updateAddress(Function(List<String>) updateFn) {
    updateFn(_address ??= []);
  }

  bool hasAddress() => _address != null;

  // "location" field.
  List<LatLng>? _location;
  List<LatLng> get location => _location ?? const [];
  set location(List<LatLng>? val) => _location = val;

  void updateLocation(Function(List<LatLng>) updateFn) {
    updateFn(_location ??= []);
  }

  bool hasLocation() => _location != null;

  static GoogleSeachLocationStruct fromMap(Map<String, dynamic> data) =>
      GoogleSeachLocationStruct(
        placeid: getDataList(data['placeid']),
        address: getDataList(data['address']),
        location: getDataList(data['location']),
      );

  static GoogleSeachLocationStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleSeachLocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'placeid': _placeid,
        'address': _address,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'placeid': serializeParam(
          _placeid,
          ParamType.String,
          isList: true,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
          isList: true,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
          isList: true,
        ),
      }.withoutNulls;

  static GoogleSeachLocationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoogleSeachLocationStruct(
        placeid: deserializeParam<String>(
          data['placeid'],
          ParamType.String,
          true,
        ),
        address: deserializeParam<String>(
          data['address'],
          ParamType.String,
          true,
        ),
        location: deserializeParam<LatLng>(
          data['location'],
          ParamType.LatLng,
          true,
        ),
      );

  static GoogleSeachLocationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GoogleSeachLocationStruct(
        placeid: convertAlgoliaParam<String>(
          data['placeid'],
          ParamType.String,
          true,
        ),
        address: convertAlgoliaParam<String>(
          data['address'],
          ParamType.String,
          true,
        ),
        location: convertAlgoliaParam<LatLng>(
          data,
          ParamType.LatLng,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GoogleSeachLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GoogleSeachLocationStruct &&
        listEquality.equals(placeid, other.placeid) &&
        listEquality.equals(address, other.address) &&
        listEquality.equals(location, other.location);
  }

  @override
  int get hashCode => const ListEquality().hash([placeid, address, location]);
}

GoogleSeachLocationStruct createGoogleSeachLocationStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoogleSeachLocationStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoogleSeachLocationStruct? updateGoogleSeachLocationStruct(
  GoogleSeachLocationStruct? googleSeachLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    googleSeachLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoogleSeachLocationStructData(
  Map<String, dynamic> firestoreData,
  GoogleSeachLocationStruct? googleSeachLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (googleSeachLocation == null) {
    return;
  }
  if (googleSeachLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && googleSeachLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final googleSeachLocationData =
      getGoogleSeachLocationFirestoreData(googleSeachLocation, forFieldValue);
  final nestedData =
      googleSeachLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      googleSeachLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoogleSeachLocationFirestoreData(
  GoogleSeachLocationStruct? googleSeachLocation, [
  bool forFieldValue = false,
]) {
  if (googleSeachLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(googleSeachLocation.toMap());

  // Add any Firestore field values
  googleSeachLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoogleSeachLocationListFirestoreData(
  List<GoogleSeachLocationStruct>? googleSeachLocations,
) =>
    googleSeachLocations
        ?.map((e) => getGoogleSeachLocationFirestoreData(e, true))
        .toList() ??
    [];
