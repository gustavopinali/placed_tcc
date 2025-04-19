// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends FFFirebaseStruct {
  UserDataStruct({
    String? biography,
    String? gender,
    List<ImageStruct>? images,
    List<LinkStruct>? links,
    UserInterestsStruct? userInterests,
    UserConfigStruct? userConfig,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _biography = biography,
        _gender = gender,
        _images = images,
        _links = links,
        _userInterests = userInterests,
        _userConfig = userConfig,
        super(firestoreUtilData);

  // "biography" field.
  String? _biography;
  String get biography => _biography ?? '';
  set biography(String? val) => _biography = val;

  bool hasBiography() => _biography != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "images" field.
  List<ImageStruct>? _images;
  List<ImageStruct> get images => _images ?? const [];
  set images(List<ImageStruct>? val) => _images = val;

  void updateImages(Function(List<ImageStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "links" field.
  List<LinkStruct>? _links;
  List<LinkStruct> get links => _links ?? const [];
  set links(List<LinkStruct>? val) => _links = val;

  void updateLinks(Function(List<LinkStruct>) updateFn) {
    updateFn(_links ??= []);
  }

  bool hasLinks() => _links != null;

  // "userInterests" field.
  UserInterestsStruct? _userInterests;
  UserInterestsStruct get userInterests =>
      _userInterests ?? UserInterestsStruct();
  set userInterests(UserInterestsStruct? val) => _userInterests = val;

  void updateUserInterests(Function(UserInterestsStruct) updateFn) {
    updateFn(_userInterests ??= UserInterestsStruct());
  }

  bool hasUserInterests() => _userInterests != null;

  // "userConfig" field.
  UserConfigStruct? _userConfig;
  UserConfigStruct get userConfig => _userConfig ?? UserConfigStruct();
  set userConfig(UserConfigStruct? val) => _userConfig = val;

  void updateUserConfig(Function(UserConfigStruct) updateFn) {
    updateFn(_userConfig ??= UserConfigStruct());
  }

  bool hasUserConfig() => _userConfig != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        biography: data['biography'] as String?,
        gender: data['gender'] as String?,
        images: getStructList(
          data['images'],
          ImageStruct.fromMap,
        ),
        links: getStructList(
          data['links'],
          LinkStruct.fromMap,
        ),
        userInterests: UserInterestsStruct.maybeFromMap(data['userInterests']),
        userConfig: UserConfigStruct.maybeFromMap(data['userConfig']),
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'biography': _biography,
        'gender': _gender,
        'images': _images?.map((e) => e.toMap()).toList(),
        'links': _links?.map((e) => e.toMap()).toList(),
        'userInterests': _userInterests?.toMap(),
        'userConfig': _userConfig?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'biography': serializeParam(
          _biography,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'links': serializeParam(
          _links,
          ParamType.DataStruct,
          isList: true,
        ),
        'userInterests': serializeParam(
          _userInterests,
          ParamType.DataStruct,
        ),
        'userConfig': serializeParam(
          _userConfig,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        biography: deserializeParam(
          data['biography'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        images: deserializeStructParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        links: deserializeStructParam<LinkStruct>(
          data['links'],
          ParamType.DataStruct,
          true,
          structBuilder: LinkStruct.fromSerializableMap,
        ),
        userInterests: deserializeStructParam(
          data['userInterests'],
          ParamType.DataStruct,
          false,
          structBuilder: UserInterestsStruct.fromSerializableMap,
        ),
        userConfig: deserializeStructParam(
          data['userConfig'],
          ParamType.DataStruct,
          false,
          structBuilder: UserConfigStruct.fromSerializableMap,
        ),
      );

  static UserDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserDataStruct(
        biography: convertAlgoliaParam(
          data['biography'],
          ParamType.String,
          false,
        ),
        gender: convertAlgoliaParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        images: convertAlgoliaParam<ImageStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageStruct.fromAlgoliaData,
        ),
        links: convertAlgoliaParam<LinkStruct>(
          data['links'],
          ParamType.DataStruct,
          true,
          structBuilder: LinkStruct.fromAlgoliaData,
        ),
        userInterests: convertAlgoliaParam(
          data['userInterests'],
          ParamType.DataStruct,
          false,
          structBuilder: UserInterestsStruct.fromAlgoliaData,
        ),
        userConfig: convertAlgoliaParam(
          data['userConfig'],
          ParamType.DataStruct,
          false,
          structBuilder: UserConfigStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserDataStruct &&
        biography == other.biography &&
        gender == other.gender &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(links, other.links) &&
        userInterests == other.userInterests &&
        userConfig == other.userConfig;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([biography, gender, images, links, userInterests, userConfig]);
}

UserDataStruct createUserDataStruct({
  String? biography,
  String? gender,
  UserInterestsStruct? userInterests,
  UserConfigStruct? userConfig,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDataStruct(
      biography: biography,
      gender: gender,
      userInterests:
          userInterests ?? (clearUnsetFields ? UserInterestsStruct() : null),
      userConfig: userConfig ?? (clearUnsetFields ? UserConfigStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDataStruct? updateUserDataStruct(
  UserDataStruct? userData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDataStructData(
  Map<String, dynamic> firestoreData,
  UserDataStruct? userData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userData == null) {
    return;
  }
  if (userData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDataData = getUserDataFirestoreData(userData, forFieldValue);
  final nestedData = userDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDataFirestoreData(
  UserDataStruct? userData, [
  bool forFieldValue = false,
]) {
  if (userData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userData.toMap());

  // Handle nested data for "userInterests" field.
  addUserInterestsStructData(
    firestoreData,
    userData.hasUserInterests() ? userData.userInterests : null,
    'userInterests',
    forFieldValue,
  );

  // Handle nested data for "userConfig" field.
  addUserConfigStructData(
    firestoreData,
    userData.hasUserConfig() ? userData.userConfig : null,
    'userConfig',
    forFieldValue,
  );

  // Add any Firestore field values
  userData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDataListFirestoreData(
  List<UserDataStruct>? userDatas,
) =>
    userDatas?.map((e) => getUserDataFirestoreData(e, true)).toList() ?? [];
