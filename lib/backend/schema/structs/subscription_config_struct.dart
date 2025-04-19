// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionConfigStruct extends FFFirebaseStruct {
  SubscriptionConfigStruct({
    String? teste,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _teste = teste,
        super(firestoreUtilData);

  // "teste" field.
  String? _teste;
  String get teste => _teste ?? '';
  set teste(String? val) => _teste = val;

  bool hasTeste() => _teste != null;

  static SubscriptionConfigStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionConfigStruct(
        teste: data['teste'] as String?,
      );

  static SubscriptionConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionConfigStruct.fromMap(data.cast<String, dynamic>())
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

  static SubscriptionConfigStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubscriptionConfigStruct(
        teste: deserializeParam(
          data['teste'],
          ParamType.String,
          false,
        ),
      );

  static SubscriptionConfigStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubscriptionConfigStruct(
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
  String toString() => 'SubscriptionConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionConfigStruct && teste == other.teste;
  }

  @override
  int get hashCode => const ListEquality().hash([teste]);
}

SubscriptionConfigStruct createSubscriptionConfigStruct({
  String? teste,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionConfigStruct(
      teste: teste,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionConfigStruct? updateSubscriptionConfigStruct(
  SubscriptionConfigStruct? subscriptionConfig, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscriptionConfig
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionConfigStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionConfigStruct? subscriptionConfig,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptionConfig == null) {
    return;
  }
  if (subscriptionConfig.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscriptionConfig.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionConfigData =
      getSubscriptionConfigFirestoreData(subscriptionConfig, forFieldValue);
  final nestedData =
      subscriptionConfigData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      subscriptionConfig.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionConfigFirestoreData(
  SubscriptionConfigStruct? subscriptionConfig, [
  bool forFieldValue = false,
]) {
  if (subscriptionConfig == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscriptionConfig.toMap());

  // Add any Firestore field values
  subscriptionConfig.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionConfigListFirestoreData(
  List<SubscriptionConfigStruct>? subscriptionConfigs,
) =>
    subscriptionConfigs
        ?.map((e) => getSubscriptionConfigFirestoreData(e, true))
        .toList() ??
    [];
