// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInterestsStruct extends FFFirebaseStruct {
  UserInterestsStruct({
    bool? friendships,
    bool? friendshipMale,
    bool? friendshipFemale,
    bool? relationships,
    bool? relationshipMale,
    bool? relationshipFemale,
    List<DocumentReference>? categories,
    List<DocumentReference>? tags,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _friendships = friendships,
        _friendshipMale = friendshipMale,
        _friendshipFemale = friendshipFemale,
        _relationships = relationships,
        _relationshipMale = relationshipMale,
        _relationshipFemale = relationshipFemale,
        _categories = categories,
        _tags = tags,
        _gender = gender,
        super(firestoreUtilData);

  // "friendships" field.
  bool? _friendships;
  bool get friendships => _friendships ?? false;
  set friendships(bool? val) => _friendships = val;

  bool hasFriendships() => _friendships != null;

  // "friendshipMale" field.
  bool? _friendshipMale;
  bool get friendshipMale => _friendshipMale ?? false;
  set friendshipMale(bool? val) => _friendshipMale = val;

  bool hasFriendshipMale() => _friendshipMale != null;

  // "friendshipFemale" field.
  bool? _friendshipFemale;
  bool get friendshipFemale => _friendshipFemale ?? false;
  set friendshipFemale(bool? val) => _friendshipFemale = val;

  bool hasFriendshipFemale() => _friendshipFemale != null;

  // "relationships" field.
  bool? _relationships;
  bool get relationships => _relationships ?? false;
  set relationships(bool? val) => _relationships = val;

  bool hasRelationships() => _relationships != null;

  // "relationshipMale" field.
  bool? _relationshipMale;
  bool get relationshipMale => _relationshipMale ?? false;
  set relationshipMale(bool? val) => _relationshipMale = val;

  bool hasRelationshipMale() => _relationshipMale != null;

  // "relationshipFemale" field.
  bool? _relationshipFemale;
  bool get relationshipFemale => _relationshipFemale ?? false;
  set relationshipFemale(bool? val) => _relationshipFemale = val;

  bool hasRelationshipFemale() => _relationshipFemale != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  set categories(List<DocumentReference>? val) => _categories = val;

  void updateCategories(Function(List<DocumentReference>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  set tags(List<DocumentReference>? val) => _tags = val;

  void updateTags(Function(List<DocumentReference>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static UserInterestsStruct fromMap(Map<String, dynamic> data) =>
      UserInterestsStruct(
        friendships: data['friendships'] as bool?,
        friendshipMale: data['friendshipMale'] as bool?,
        friendshipFemale: data['friendshipFemale'] as bool?,
        relationships: data['relationships'] as bool?,
        relationshipMale: data['relationshipMale'] as bool?,
        relationshipFemale: data['relationshipFemale'] as bool?,
        categories: getDataList(data['categories']),
        tags: getDataList(data['tags']),
        gender: data['gender'] as String?,
      );

  static UserInterestsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserInterestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'friendships': _friendships,
        'friendshipMale': _friendshipMale,
        'friendshipFemale': _friendshipFemale,
        'relationships': _relationships,
        'relationshipMale': _relationshipMale,
        'relationshipFemale': _relationshipFemale,
        'categories': _categories,
        'tags': _tags,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'friendships': serializeParam(
          _friendships,
          ParamType.bool,
        ),
        'friendshipMale': serializeParam(
          _friendshipMale,
          ParamType.bool,
        ),
        'friendshipFemale': serializeParam(
          _friendshipFemale,
          ParamType.bool,
        ),
        'relationships': serializeParam(
          _relationships,
          ParamType.bool,
        ),
        'relationshipMale': serializeParam(
          _relationshipMale,
          ParamType.bool,
        ),
        'relationshipFemale': serializeParam(
          _relationshipFemale,
          ParamType.bool,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.DocumentReference,
          isList: true,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.DocumentReference,
          isList: true,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInterestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInterestsStruct(
        friendships: deserializeParam(
          data['friendships'],
          ParamType.bool,
          false,
        ),
        friendshipMale: deserializeParam(
          data['friendshipMale'],
          ParamType.bool,
          false,
        ),
        friendshipFemale: deserializeParam(
          data['friendshipFemale'],
          ParamType.bool,
          false,
        ),
        relationships: deserializeParam(
          data['relationships'],
          ParamType.bool,
          false,
        ),
        relationshipMale: deserializeParam(
          data['relationshipMale'],
          ParamType.bool,
          false,
        ),
        relationshipFemale: deserializeParam(
          data['relationshipFemale'],
          ParamType.bool,
          false,
        ),
        categories: deserializeParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['categories'],
        ),
        tags: deserializeParam<DocumentReference>(
          data['tags'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['tags'],
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  static UserInterestsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserInterestsStruct(
        friendships: convertAlgoliaParam(
          data['friendships'],
          ParamType.bool,
          false,
        ),
        friendshipMale: convertAlgoliaParam(
          data['friendshipMale'],
          ParamType.bool,
          false,
        ),
        friendshipFemale: convertAlgoliaParam(
          data['friendshipFemale'],
          ParamType.bool,
          false,
        ),
        relationships: convertAlgoliaParam(
          data['relationships'],
          ParamType.bool,
          false,
        ),
        relationshipMale: convertAlgoliaParam(
          data['relationshipMale'],
          ParamType.bool,
          false,
        ),
        relationshipFemale: convertAlgoliaParam(
          data['relationshipFemale'],
          ParamType.bool,
          false,
        ),
        categories: convertAlgoliaParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
        ),
        tags: convertAlgoliaParam<DocumentReference>(
          data['tags'],
          ParamType.DocumentReference,
          true,
        ),
        gender: convertAlgoliaParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserInterestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserInterestsStruct &&
        friendships == other.friendships &&
        friendshipMale == other.friendshipMale &&
        friendshipFemale == other.friendshipFemale &&
        relationships == other.relationships &&
        relationshipMale == other.relationshipMale &&
        relationshipFemale == other.relationshipFemale &&
        listEquality.equals(categories, other.categories) &&
        listEquality.equals(tags, other.tags) &&
        gender == other.gender;
  }

  @override
  int get hashCode => const ListEquality().hash([
        friendships,
        friendshipMale,
        friendshipFemale,
        relationships,
        relationshipMale,
        relationshipFemale,
        categories,
        tags,
        gender
      ]);
}

UserInterestsStruct createUserInterestsStruct({
  bool? friendships,
  bool? friendshipMale,
  bool? friendshipFemale,
  bool? relationships,
  bool? relationshipMale,
  bool? relationshipFemale,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInterestsStruct(
      friendships: friendships,
      friendshipMale: friendshipMale,
      friendshipFemale: friendshipFemale,
      relationships: relationships,
      relationshipMale: relationshipMale,
      relationshipFemale: relationshipFemale,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInterestsStruct? updateUserInterestsStruct(
  UserInterestsStruct? userInterests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInterests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInterestsStructData(
  Map<String, dynamic> firestoreData,
  UserInterestsStruct? userInterests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInterests == null) {
    return;
  }
  if (userInterests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInterests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInterestsData =
      getUserInterestsFirestoreData(userInterests, forFieldValue);
  final nestedData =
      userInterestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInterests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInterestsFirestoreData(
  UserInterestsStruct? userInterests, [
  bool forFieldValue = false,
]) {
  if (userInterests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInterests.toMap());

  // Add any Firestore field values
  userInterests.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInterestsListFirestoreData(
  List<UserInterestsStruct>? userInterestss,
) =>
    userInterestss
        ?.map((e) => getUserInterestsFirestoreData(e, true))
        .toList() ??
    [];
