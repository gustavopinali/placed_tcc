// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VisitDataStruct extends FFFirebaseStruct {
  VisitDataStruct({
    String? teste,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _teste = teste,
        super(firestoreUtilData);

  // "teste" field.
  String? _teste;
  String get teste => _teste ?? '';
  set teste(String? val) => _teste = val;

  bool hasTeste() => _teste != null;

  static VisitDataStruct fromMap(Map<String, dynamic> data) => VisitDataStruct(
        teste: data['teste'] as String?,
      );

  static VisitDataStruct? maybeFromMap(dynamic data) => data is Map
      ? VisitDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'teste': _teste,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'teste': serializeParam(
          _teste,
          ParamType.String,
        ),
      }.withoutNulls;

  static VisitDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      VisitDataStruct(
        teste: deserializeParam(
          data['teste'],
          ParamType.String,
          false,
        ),
      );

  static VisitDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VisitDataStruct(
        teste: convertAlgoliaParam(
          data['teste'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VisitDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VisitDataStruct && teste == other.teste;
  }

  @override
  int get hashCode => const ListEquality().hash([teste]);
}

VisitDataStruct createVisitDataStruct({
  String? teste,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VisitDataStruct(
      teste: teste,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VisitDataStruct? updateVisitDataStruct(
  VisitDataStruct? visitData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    visitData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVisitDataStructData(
  Map<String, dynamic> firestoreData,
  VisitDataStruct? visitData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (visitData == null) {
    return;
  }
  if (visitData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && visitData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final visitDataData = getVisitDataFirestoreData(visitData, forFieldValue);
  final nestedData = visitDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = visitData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVisitDataFirestoreData(
  VisitDataStruct? visitData, [
  bool forFieldValue = false,
]) {
  if (visitData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(visitData.toMap());

  // Add any Firestore field values
  visitData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVisitDataListFirestoreData(
  List<VisitDataStruct>? visitDatas,
) =>
    visitDatas?.map((e) => getVisitDataFirestoreData(e, true)).toList() ?? [];
