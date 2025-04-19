// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubPlaceProductStruct extends FFFirebaseStruct {
  SubPlaceProductStruct({
    String? stripePrice,
    bool? active,
    DateTime? createdAt,
    DocumentReference? createdBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stripePrice = stripePrice,
        _active = active,
        _createdAt = createdAt,
        _createdBy = createdBy,
        super(firestoreUtilData);

  // "stripePrice" field.
  String? _stripePrice;
  String get stripePrice => _stripePrice ?? '';
  set stripePrice(String? val) => _stripePrice = val;

  bool hasStripePrice() => _stripePrice != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  static SubPlaceProductStruct fromMap(Map<String, dynamic> data) =>
      SubPlaceProductStruct(
        stripePrice: data['stripePrice'] as String?,
        active: data['active'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
        createdBy: data['createdBy'] as DocumentReference?,
      );

  static SubPlaceProductStruct? maybeFromMap(dynamic data) => data is Map
      ? SubPlaceProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stripePrice': _stripePrice,
        'active': _active,
        'createdAt': _createdAt,
        'createdBy': _createdBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stripePrice': serializeParam(
          _stripePrice,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SubPlaceProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubPlaceProductStruct(
        stripePrice: deserializeParam(
          data['stripePrice'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static SubPlaceProductStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubPlaceProductStruct(
        stripePrice: convertAlgoliaParam(
          data['stripePrice'],
          ParamType.String,
          false,
        ),
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubPlaceProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubPlaceProductStruct &&
        stripePrice == other.stripePrice &&
        active == other.active &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([stripePrice, active, createdAt, createdBy]);
}

SubPlaceProductStruct createSubPlaceProductStruct({
  String? stripePrice,
  bool? active,
  DateTime? createdAt,
  DocumentReference? createdBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubPlaceProductStruct(
      stripePrice: stripePrice,
      active: active,
      createdAt: createdAt,
      createdBy: createdBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubPlaceProductStruct? updateSubPlaceProductStruct(
  SubPlaceProductStruct? subPlaceProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subPlaceProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubPlaceProductStructData(
  Map<String, dynamic> firestoreData,
  SubPlaceProductStruct? subPlaceProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subPlaceProduct == null) {
    return;
  }
  if (subPlaceProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subPlaceProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subPlaceProductData =
      getSubPlaceProductFirestoreData(subPlaceProduct, forFieldValue);
  final nestedData =
      subPlaceProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subPlaceProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubPlaceProductFirestoreData(
  SubPlaceProductStruct? subPlaceProduct, [
  bool forFieldValue = false,
]) {
  if (subPlaceProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subPlaceProduct.toMap());

  // Add any Firestore field values
  subPlaceProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubPlaceProductListFirestoreData(
  List<SubPlaceProductStruct>? subPlaceProducts,
) =>
    subPlaceProducts
        ?.map((e) => getSubPlaceProductFirestoreData(e, true))
        .toList() ??
    [];
