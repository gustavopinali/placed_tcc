// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductStatusStruct extends FFFirebaseStruct {
  ProductStatusStruct({
    bool? active,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static ProductStatusStruct fromMap(Map<String, dynamic> data) =>
      ProductStatusStruct(
        active: data['active'] as bool?,
      );

  static ProductStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProductStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  static ProductStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStatusStruct && active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([active]);
}

ProductStatusStruct createProductStatusStruct({
  bool? active,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStatusStruct(
      active: active,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStatusStruct? updateProductStatusStruct(
  ProductStatusStruct? productStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStatusStructData(
  Map<String, dynamic> firestoreData,
  ProductStatusStruct? productStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productStatus == null) {
    return;
  }
  if (productStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productStatusData =
      getProductStatusFirestoreData(productStatus, forFieldValue);
  final nestedData =
      productStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductStatusFirestoreData(
  ProductStatusStruct? productStatus, [
  bool forFieldValue = false,
]) {
  if (productStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productStatus.toMap());

  // Add any Firestore field values
  productStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductStatusListFirestoreData(
  List<ProductStatusStruct>? productStatuss,
) =>
    productStatuss
        ?.map((e) => getProductStatusFirestoreData(e, true))
        .toList() ??
    [];
