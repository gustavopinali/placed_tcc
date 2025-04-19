// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventConfigStruct extends FFFirebaseStruct {
  EventConfigStruct({
    bool? allowLinkedLocation,
    bool? allowDistantUsersVisits,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _allowLinkedLocation = allowLinkedLocation,
        _allowDistantUsersVisits = allowDistantUsersVisits,
        super(firestoreUtilData);

  // "allowLinkedLocation" field.
  bool? _allowLinkedLocation;
  bool get allowLinkedLocation => _allowLinkedLocation ?? false;
  set allowLinkedLocation(bool? val) => _allowLinkedLocation = val;

  bool hasAllowLinkedLocation() => _allowLinkedLocation != null;

  // "allowDistantUsersVisits" field.
  bool? _allowDistantUsersVisits;
  bool get allowDistantUsersVisits => _allowDistantUsersVisits ?? false;
  set allowDistantUsersVisits(bool? val) => _allowDistantUsersVisits = val;

  bool hasAllowDistantUsersVisits() => _allowDistantUsersVisits != null;

  static EventConfigStruct fromMap(Map<String, dynamic> data) =>
      EventConfigStruct(
        allowLinkedLocation: data['allowLinkedLocation'] as bool?,
        allowDistantUsersVisits: data['allowDistantUsersVisits'] as bool?,
      );

  static EventConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? EventConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'allowLinkedLocation': _allowLinkedLocation,
        'allowDistantUsersVisits': _allowDistantUsersVisits,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'allowLinkedLocation': serializeParam(
          _allowLinkedLocation,
          ParamType.bool,
        ),
        'allowDistantUsersVisits': serializeParam(
          _allowDistantUsersVisits,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventConfigStruct(
        allowLinkedLocation: deserializeParam(
          data['allowLinkedLocation'],
          ParamType.bool,
          false,
        ),
        allowDistantUsersVisits: deserializeParam(
          data['allowDistantUsersVisits'],
          ParamType.bool,
          false,
        ),
      );

  static EventConfigStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventConfigStruct(
        allowLinkedLocation: convertAlgoliaParam(
          data['allowLinkedLocation'],
          ParamType.bool,
          false,
        ),
        allowDistantUsersVisits: convertAlgoliaParam(
          data['allowDistantUsersVisits'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventConfigStruct &&
        allowLinkedLocation == other.allowLinkedLocation &&
        allowDistantUsersVisits == other.allowDistantUsersVisits;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([allowLinkedLocation, allowDistantUsersVisits]);
}

EventConfigStruct createEventConfigStruct({
  bool? allowLinkedLocation,
  bool? allowDistantUsersVisits,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventConfigStruct(
      allowLinkedLocation: allowLinkedLocation,
      allowDistantUsersVisits: allowDistantUsersVisits,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventConfigStruct? updateEventConfigStruct(
  EventConfigStruct? eventConfig, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventConfig
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventConfigStructData(
  Map<String, dynamic> firestoreData,
  EventConfigStruct? eventConfig,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventConfig == null) {
    return;
  }
  if (eventConfig.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventConfig.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventConfigData =
      getEventConfigFirestoreData(eventConfig, forFieldValue);
  final nestedData =
      eventConfigData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventConfig.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventConfigFirestoreData(
  EventConfigStruct? eventConfig, [
  bool forFieldValue = false,
]) {
  if (eventConfig == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventConfig.toMap());

  // Add any Firestore field values
  eventConfig.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventConfigListFirestoreData(
  List<EventConfigStruct>? eventConfigs,
) =>
    eventConfigs?.map((e) => getEventConfigFirestoreData(e, true)).toList() ??
    [];
