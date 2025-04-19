// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TextStruct extends FFFirebaseStruct {
  TextStruct({
    String? portuguese,
    String? english,
    String? spanish,
    int? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _portuguese = portuguese,
        _english = english,
        _spanish = spanish,
        _order = order,
        super(firestoreUtilData);

  // "portuguese" field.
  String? _portuguese;
  String get portuguese => _portuguese ?? '';
  set portuguese(String? val) => _portuguese = val;

  bool hasPortuguese() => _portuguese != null;

  // "english" field.
  String? _english;
  String get english => _english ?? '';
  set english(String? val) => _english = val;

  bool hasEnglish() => _english != null;

  // "spanish" field.
  String? _spanish;
  String get spanish => _spanish ?? '';
  set spanish(String? val) => _spanish = val;

  bool hasSpanish() => _spanish != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  static TextStruct fromMap(Map<String, dynamic> data) => TextStruct(
        portuguese: data['portuguese'] as String?,
        english: data['english'] as String?,
        spanish: data['spanish'] as String?,
        order: castToType<int>(data['order']),
      );

  static TextStruct? maybeFromMap(dynamic data) =>
      data is Map ? TextStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'portuguese': _portuguese,
        'english': _english,
        'spanish': _spanish,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'portuguese': serializeParam(
          _portuguese,
          ParamType.String,
        ),
        'english': serializeParam(
          _english,
          ParamType.String,
        ),
        'spanish': serializeParam(
          _spanish,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
      }.withoutNulls;

  static TextStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextStruct(
        portuguese: deserializeParam(
          data['portuguese'],
          ParamType.String,
          false,
        ),
        english: deserializeParam(
          data['english'],
          ParamType.String,
          false,
        ),
        spanish: deserializeParam(
          data['spanish'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
      );

  static TextStruct fromAlgoliaData(Map<String, dynamic> data) => TextStruct(
        portuguese: convertAlgoliaParam(
          data['portuguese'],
          ParamType.String,
          false,
        ),
        english: convertAlgoliaParam(
          data['english'],
          ParamType.String,
          false,
        ),
        spanish: convertAlgoliaParam(
          data['spanish'],
          ParamType.String,
          false,
        ),
        order: convertAlgoliaParam(
          data['order'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextStruct &&
        portuguese == other.portuguese &&
        english == other.english &&
        spanish == other.spanish &&
        order == other.order;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([portuguese, english, spanish, order]);
}

TextStruct createTextStruct({
  String? portuguese,
  String? english,
  String? spanish,
  int? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TextStruct(
      portuguese: portuguese,
      english: english,
      spanish: spanish,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TextStruct? updateTextStruct(
  TextStruct? text, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    text
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTextStructData(
  Map<String, dynamic> firestoreData,
  TextStruct? text,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (text == null) {
    return;
  }
  if (text.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && text.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final textData = getTextFirestoreData(text, forFieldValue);
  final nestedData = textData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = text.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTextFirestoreData(
  TextStruct? text, [
  bool forFieldValue = false,
]) {
  if (text == null) {
    return {};
  }
  final firestoreData = mapToFirestore(text.toMap());

  // Add any Firestore field values
  text.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTextListFirestoreData(
  List<TextStruct>? texts,
) =>
    texts?.map((e) => getTextFirestoreData(e, true)).toList() ?? [];
