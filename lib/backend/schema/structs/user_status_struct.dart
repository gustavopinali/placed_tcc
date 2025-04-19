// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserStatusStruct extends FFFirebaseStruct {
  UserStatusStruct({
    bool? active,
    bool? searchable,
    bool? onboarding,
    DateTime? createdAt,
    int? userImagesCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _searchable = searchable,
        _onboarding = onboarding,
        _createdAt = createdAt,
        _userImagesCount = userImagesCount,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "searchable" field.
  bool? _searchable;
  bool get searchable => _searchable ?? true;
  set searchable(bool? val) => _searchable = val;

  bool hasSearchable() => _searchable != null;

  // "onboarding" field.
  bool? _onboarding;
  bool get onboarding => _onboarding ?? false;
  set onboarding(bool? val) => _onboarding = val;

  bool hasOnboarding() => _onboarding != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "userImagesCount" field.
  int? _userImagesCount;
  int get userImagesCount => _userImagesCount ?? 0;
  set userImagesCount(int? val) => _userImagesCount = val;

  void incrementUserImagesCount(int amount) =>
      userImagesCount = userImagesCount + amount;

  bool hasUserImagesCount() => _userImagesCount != null;

  static UserStatusStruct fromMap(Map<String, dynamic> data) =>
      UserStatusStruct(
        active: data['active'] as bool?,
        searchable: data['searchable'] as bool?,
        onboarding: data['onboarding'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
        userImagesCount: castToType<int>(data['userImagesCount']),
      );

  static UserStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? UserStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'searchable': _searchable,
        'onboarding': _onboarding,
        'createdAt': _createdAt,
        'userImagesCount': _userImagesCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'searchable': serializeParam(
          _searchable,
          ParamType.bool,
        ),
        'onboarding': serializeParam(
          _onboarding,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'userImagesCount': serializeParam(
          _userImagesCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        searchable: deserializeParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        onboarding: deserializeParam(
          data['onboarding'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        userImagesCount: deserializeParam(
          data['userImagesCount'],
          ParamType.int,
          false,
        ),
      );

  static UserStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        searchable: convertAlgoliaParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        onboarding: convertAlgoliaParam(
          data['onboarding'],
          ParamType.bool,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        userImagesCount: convertAlgoliaParam(
          data['userImagesCount'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStatusStruct &&
        active == other.active &&
        searchable == other.searchable &&
        onboarding == other.onboarding &&
        createdAt == other.createdAt &&
        userImagesCount == other.userImagesCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([active, searchable, onboarding, createdAt, userImagesCount]);
}

UserStatusStruct createUserStatusStruct({
  bool? active,
  bool? searchable,
  bool? onboarding,
  DateTime? createdAt,
  int? userImagesCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStatusStruct(
      active: active,
      searchable: searchable,
      onboarding: onboarding,
      createdAt: createdAt,
      userImagesCount: userImagesCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStatusStruct? updateUserStatusStruct(
  UserStatusStruct? userStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStatusStructData(
  Map<String, dynamic> firestoreData,
  UserStatusStruct? userStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userStatus == null) {
    return;
  }
  if (userStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userStatusData = getUserStatusFirestoreData(userStatus, forFieldValue);
  final nestedData = userStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserStatusFirestoreData(
  UserStatusStruct? userStatus, [
  bool forFieldValue = false,
]) {
  if (userStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userStatus.toMap());

  // Add any Firestore field values
  userStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserStatusListFirestoreData(
  List<UserStatusStruct>? userStatuss,
) =>
    userStatuss?.map((e) => getUserStatusFirestoreData(e, true)).toList() ?? [];
