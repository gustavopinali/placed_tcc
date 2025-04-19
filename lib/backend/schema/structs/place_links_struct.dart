// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlaceLinksStruct extends FFFirebaseStruct {
  PlaceLinksStruct({
    String? website,
    String? instagram,
    String? whatsapp,
    String? facebook,
    String? twitter,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _website = website,
        _instagram = instagram,
        _whatsapp = whatsapp,
        _facebook = facebook,
        _twitter = twitter,
        super(firestoreUtilData);

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  set website(String? val) => _website = val;

  bool hasWebsite() => _website != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  set whatsapp(String? val) => _whatsapp = val;

  bool hasWhatsapp() => _whatsapp != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  set facebook(String? val) => _facebook = val;

  bool hasFacebook() => _facebook != null;

  // "twitter" field.
  String? _twitter;
  String get twitter => _twitter ?? '';
  set twitter(String? val) => _twitter = val;

  bool hasTwitter() => _twitter != null;

  static PlaceLinksStruct fromMap(Map<String, dynamic> data) =>
      PlaceLinksStruct(
        website: data['website'] as String?,
        instagram: data['instagram'] as String?,
        whatsapp: data['whatsapp'] as String?,
        facebook: data['facebook'] as String?,
        twitter: data['twitter'] as String?,
      );

  static PlaceLinksStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceLinksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'website': _website,
        'instagram': _instagram,
        'whatsapp': _whatsapp,
        'facebook': _facebook,
        'twitter': _twitter,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'website': serializeParam(
          _website,
          ParamType.String,
        ),
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.String,
        ),
        'facebook': serializeParam(
          _facebook,
          ParamType.String,
        ),
        'twitter': serializeParam(
          _twitter,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaceLinksStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceLinksStruct(
        website: deserializeParam(
          data['website'],
          ParamType.String,
          false,
        ),
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        facebook: deserializeParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        twitter: deserializeParam(
          data['twitter'],
          ParamType.String,
          false,
        ),
      );

  static PlaceLinksStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceLinksStruct(
        website: convertAlgoliaParam(
          data['website'],
          ParamType.String,
          false,
        ),
        instagram: convertAlgoliaParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        whatsapp: convertAlgoliaParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        facebook: convertAlgoliaParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        twitter: convertAlgoliaParam(
          data['twitter'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceLinksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceLinksStruct &&
        website == other.website &&
        instagram == other.instagram &&
        whatsapp == other.whatsapp &&
        facebook == other.facebook &&
        twitter == other.twitter;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([website, instagram, whatsapp, facebook, twitter]);
}

PlaceLinksStruct createPlaceLinksStruct({
  String? website,
  String? instagram,
  String? whatsapp,
  String? facebook,
  String? twitter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceLinksStruct(
      website: website,
      instagram: instagram,
      whatsapp: whatsapp,
      facebook: facebook,
      twitter: twitter,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceLinksStruct? updatePlaceLinksStruct(
  PlaceLinksStruct? placeLinks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeLinks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceLinksStructData(
  Map<String, dynamic> firestoreData,
  PlaceLinksStruct? placeLinks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeLinks == null) {
    return;
  }
  if (placeLinks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeLinks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeLinksData = getPlaceLinksFirestoreData(placeLinks, forFieldValue);
  final nestedData = placeLinksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeLinks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceLinksFirestoreData(
  PlaceLinksStruct? placeLinks, [
  bool forFieldValue = false,
]) {
  if (placeLinks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeLinks.toMap());

  // Add any Firestore field values
  placeLinks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceLinksListFirestoreData(
  List<PlaceLinksStruct>? placeLinkss,
) =>
    placeLinkss?.map((e) => getPlaceLinksFirestoreData(e, true)).toList() ?? [];
