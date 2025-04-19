// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserLinksStruct extends FFFirebaseStruct {
  UserLinksStruct({
    String? instagram,
    String? facebook,
    String? twiter,
    String? whatsapp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _instagram = instagram,
        _facebook = facebook,
        _twiter = twiter,
        _whatsapp = whatsapp,
        super(firestoreUtilData);

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  set facebook(String? val) => _facebook = val;

  bool hasFacebook() => _facebook != null;

  // "twiter" field.
  String? _twiter;
  String get twiter => _twiter ?? '';
  set twiter(String? val) => _twiter = val;

  bool hasTwiter() => _twiter != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  set whatsapp(String? val) => _whatsapp = val;

  bool hasWhatsapp() => _whatsapp != null;

  static UserLinksStruct fromMap(Map<String, dynamic> data) => UserLinksStruct(
        instagram: data['instagram'] as String?,
        facebook: data['facebook'] as String?,
        twiter: data['twiter'] as String?,
        whatsapp: data['whatsapp'] as String?,
      );

  static UserLinksStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLinksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'instagram': _instagram,
        'facebook': _facebook,
        'twiter': _twiter,
        'whatsapp': _whatsapp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'facebook': serializeParam(
          _facebook,
          ParamType.String,
        ),
        'twiter': serializeParam(
          _twiter,
          ParamType.String,
        ),
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserLinksStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLinksStruct(
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        facebook: deserializeParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        twiter: deserializeParam(
          data['twiter'],
          ParamType.String,
          false,
        ),
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
      );

  static UserLinksStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserLinksStruct(
        instagram: convertAlgoliaParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        facebook: convertAlgoliaParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        twiter: convertAlgoliaParam(
          data['twiter'],
          ParamType.String,
          false,
        ),
        whatsapp: convertAlgoliaParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserLinksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLinksStruct &&
        instagram == other.instagram &&
        facebook == other.facebook &&
        twiter == other.twiter &&
        whatsapp == other.whatsapp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([instagram, facebook, twiter, whatsapp]);
}

UserLinksStruct createUserLinksStruct({
  String? instagram,
  String? facebook,
  String? twiter,
  String? whatsapp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLinksStruct(
      instagram: instagram,
      facebook: facebook,
      twiter: twiter,
      whatsapp: whatsapp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLinksStruct? updateUserLinksStruct(
  UserLinksStruct? userLinks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLinks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLinksStructData(
  Map<String, dynamic> firestoreData,
  UserLinksStruct? userLinks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLinks == null) {
    return;
  }
  if (userLinks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLinks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLinksData = getUserLinksFirestoreData(userLinks, forFieldValue);
  final nestedData = userLinksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userLinks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLinksFirestoreData(
  UserLinksStruct? userLinks, [
  bool forFieldValue = false,
]) {
  if (userLinks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLinks.toMap());

  // Add any Firestore field values
  userLinks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLinksListFirestoreData(
  List<UserLinksStruct>? userLinkss,
) =>
    userLinkss?.map((e) => getUserLinksFirestoreData(e, true)).toList() ?? [];
