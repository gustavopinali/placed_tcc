// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserConfigStruct extends FFFirebaseStruct {
  UserConfigStruct({
    bool? showOnProfileFavitePlaces,
    bool? showOnProfileComfirmedEvents,
    String? showOnProfileLinks,
    int? searchDistance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _showOnProfileFavitePlaces = showOnProfileFavitePlaces,
        _showOnProfileComfirmedEvents = showOnProfileComfirmedEvents,
        _showOnProfileLinks = showOnProfileLinks,
        _searchDistance = searchDistance,
        super(firestoreUtilData);

  // "showOnProfileFavitePlaces" field.
  bool? _showOnProfileFavitePlaces;
  bool get showOnProfileFavitePlaces => _showOnProfileFavitePlaces ?? false;
  set showOnProfileFavitePlaces(bool? val) => _showOnProfileFavitePlaces = val;

  bool hasShowOnProfileFavitePlaces() => _showOnProfileFavitePlaces != null;

  // "showOnProfileComfirmedEvents" field.
  bool? _showOnProfileComfirmedEvents;
  bool get showOnProfileComfirmedEvents =>
      _showOnProfileComfirmedEvents ?? false;
  set showOnProfileComfirmedEvents(bool? val) =>
      _showOnProfileComfirmedEvents = val;

  bool hasShowOnProfileComfirmedEvents() =>
      _showOnProfileComfirmedEvents != null;

  // "showOnProfileLinks" field.
  String? _showOnProfileLinks;
  String get showOnProfileLinks => _showOnProfileLinks ?? '';
  set showOnProfileLinks(String? val) => _showOnProfileLinks = val;

  bool hasShowOnProfileLinks() => _showOnProfileLinks != null;

  // "searchDistance" field.
  int? _searchDistance;
  int get searchDistance => _searchDistance ?? 0;
  set searchDistance(int? val) => _searchDistance = val;

  void incrementSearchDistance(int amount) =>
      searchDistance = searchDistance + amount;

  bool hasSearchDistance() => _searchDistance != null;

  static UserConfigStruct fromMap(Map<String, dynamic> data) =>
      UserConfigStruct(
        showOnProfileFavitePlaces: data['showOnProfileFavitePlaces'] as bool?,
        showOnProfileComfirmedEvents:
            data['showOnProfileComfirmedEvents'] as bool?,
        showOnProfileLinks: data['showOnProfileLinks'] as String?,
        searchDistance: castToType<int>(data['searchDistance']),
      );

  static UserConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? UserConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'showOnProfileFavitePlaces': _showOnProfileFavitePlaces,
        'showOnProfileComfirmedEvents': _showOnProfileComfirmedEvents,
        'showOnProfileLinks': _showOnProfileLinks,
        'searchDistance': _searchDistance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'showOnProfileFavitePlaces': serializeParam(
          _showOnProfileFavitePlaces,
          ParamType.bool,
        ),
        'showOnProfileComfirmedEvents': serializeParam(
          _showOnProfileComfirmedEvents,
          ParamType.bool,
        ),
        'showOnProfileLinks': serializeParam(
          _showOnProfileLinks,
          ParamType.String,
        ),
        'searchDistance': serializeParam(
          _searchDistance,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserConfigStruct(
        showOnProfileFavitePlaces: deserializeParam(
          data['showOnProfileFavitePlaces'],
          ParamType.bool,
          false,
        ),
        showOnProfileComfirmedEvents: deserializeParam(
          data['showOnProfileComfirmedEvents'],
          ParamType.bool,
          false,
        ),
        showOnProfileLinks: deserializeParam(
          data['showOnProfileLinks'],
          ParamType.String,
          false,
        ),
        searchDistance: deserializeParam(
          data['searchDistance'],
          ParamType.int,
          false,
        ),
      );

  static UserConfigStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserConfigStruct(
        showOnProfileFavitePlaces: convertAlgoliaParam(
          data['showOnProfileFavitePlaces'],
          ParamType.bool,
          false,
        ),
        showOnProfileComfirmedEvents: convertAlgoliaParam(
          data['showOnProfileComfirmedEvents'],
          ParamType.bool,
          false,
        ),
        showOnProfileLinks: convertAlgoliaParam(
          data['showOnProfileLinks'],
          ParamType.String,
          false,
        ),
        searchDistance: convertAlgoliaParam(
          data['searchDistance'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserConfigStruct &&
        showOnProfileFavitePlaces == other.showOnProfileFavitePlaces &&
        showOnProfileComfirmedEvents == other.showOnProfileComfirmedEvents &&
        showOnProfileLinks == other.showOnProfileLinks &&
        searchDistance == other.searchDistance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        showOnProfileFavitePlaces,
        showOnProfileComfirmedEvents,
        showOnProfileLinks,
        searchDistance
      ]);
}

UserConfigStruct createUserConfigStruct({
  bool? showOnProfileFavitePlaces,
  bool? showOnProfileComfirmedEvents,
  String? showOnProfileLinks,
  int? searchDistance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserConfigStruct(
      showOnProfileFavitePlaces: showOnProfileFavitePlaces,
      showOnProfileComfirmedEvents: showOnProfileComfirmedEvents,
      showOnProfileLinks: showOnProfileLinks,
      searchDistance: searchDistance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserConfigStruct? updateUserConfigStruct(
  UserConfigStruct? userConfig, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userConfig
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserConfigStructData(
  Map<String, dynamic> firestoreData,
  UserConfigStruct? userConfig,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userConfig == null) {
    return;
  }
  if (userConfig.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userConfig.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userConfigData = getUserConfigFirestoreData(userConfig, forFieldValue);
  final nestedData = userConfigData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userConfig.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserConfigFirestoreData(
  UserConfigStruct? userConfig, [
  bool forFieldValue = false,
]) {
  if (userConfig == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userConfig.toMap());

  // Add any Firestore field values
  userConfig.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserConfigListFirestoreData(
  List<UserConfigStruct>? userConfigs,
) =>
    userConfigs?.map((e) => getUserConfigFirestoreData(e, true)).toList() ?? [];
