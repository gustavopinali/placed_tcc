// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventDataStruct extends FFFirebaseStruct {
  EventDataStruct({
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _address = address,
        super(firestoreUtilData);

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static EventDataStruct fromMap(Map<String, dynamic> data) => EventDataStruct(
        address: data['address'] as String?,
      );

  static EventDataStruct? maybeFromMap(dynamic data) => data is Map
      ? EventDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventDataStruct(
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  static EventDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventDataStruct(
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventDataStruct && address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([address]);
}

EventDataStruct createEventDataStruct({
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventDataStruct(
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventDataStruct? updateEventDataStruct(
  EventDataStruct? eventData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventDataStructData(
  Map<String, dynamic> firestoreData,
  EventDataStruct? eventData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventData == null) {
    return;
  }
  if (eventData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventDataData = getEventDataFirestoreData(eventData, forFieldValue);
  final nestedData = eventDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventDataFirestoreData(
  EventDataStruct? eventData, [
  bool forFieldValue = false,
]) {
  if (eventData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventData.toMap());

  // Add any Firestore field values
  eventData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventDataListFirestoreData(
  List<EventDataStruct>? eventDatas,
) =>
    eventDatas?.map((e) => getEventDataFirestoreData(e, true)).toList() ?? [];
