// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventLinksStruct extends FFFirebaseStruct {
  EventLinksStruct({
    String? website,
    String? instagram,
    String? facebook,
    String? twiter,
    String? whatsapp,
    String? tickets,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _website = website,
        _instagram = instagram,
        _facebook = facebook,
        _twiter = twiter,
        _whatsapp = whatsapp,
        _tickets = tickets,
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

  // "tickets" field.
  String? _tickets;
  String get tickets => _tickets ?? '';
  set tickets(String? val) => _tickets = val;

  bool hasTickets() => _tickets != null;

  static EventLinksStruct fromMap(Map<String, dynamic> data) =>
      EventLinksStruct(
        website: data['website'] as String?,
        instagram: data['instagram'] as String?,
        facebook: data['facebook'] as String?,
        twiter: data['twiter'] as String?,
        whatsapp: data['whatsapp'] as String?,
        tickets: data['tickets'] as String?,
      );

  static EventLinksStruct? maybeFromMap(dynamic data) => data is Map
      ? EventLinksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'website': _website,
        'instagram': _instagram,
        'facebook': _facebook,
        'twiter': _twiter,
        'whatsapp': _whatsapp,
        'tickets': _tickets,
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
        'tickets': serializeParam(
          _tickets,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventLinksStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventLinksStruct(
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
        tickets: deserializeParam(
          data['tickets'],
          ParamType.String,
          false,
        ),
      );

  static EventLinksStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventLinksStruct(
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
        tickets: convertAlgoliaParam(
          data['tickets'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventLinksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventLinksStruct &&
        website == other.website &&
        instagram == other.instagram &&
        facebook == other.facebook &&
        twiter == other.twiter &&
        whatsapp == other.whatsapp &&
        tickets == other.tickets;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([website, instagram, facebook, twiter, whatsapp, tickets]);
}

EventLinksStruct createEventLinksStruct({
  String? website,
  String? instagram,
  String? facebook,
  String? twiter,
  String? whatsapp,
  String? tickets,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventLinksStruct(
      website: website,
      instagram: instagram,
      facebook: facebook,
      twiter: twiter,
      whatsapp: whatsapp,
      tickets: tickets,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventLinksStruct? updateEventLinksStruct(
  EventLinksStruct? eventLinks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventLinks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventLinksStructData(
  Map<String, dynamic> firestoreData,
  EventLinksStruct? eventLinks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventLinks == null) {
    return;
  }
  if (eventLinks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventLinks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventLinksData = getEventLinksFirestoreData(eventLinks, forFieldValue);
  final nestedData = eventLinksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventLinks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventLinksFirestoreData(
  EventLinksStruct? eventLinks, [
  bool forFieldValue = false,
]) {
  if (eventLinks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventLinks.toMap());

  // Add any Firestore field values
  eventLinks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventLinksListFirestoreData(
  List<EventLinksStruct>? eventLinkss,
) =>
    eventLinkss?.map((e) => getEventLinksFirestoreData(e, true)).toList() ?? [];
