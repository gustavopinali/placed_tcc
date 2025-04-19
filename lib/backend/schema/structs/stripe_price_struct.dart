// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripePriceStruct extends FFFirebaseStruct {
  StripePriceStruct({
    String? id,
    bool? active,
    String? currency,
    String? product,
    int? unitAmount,
    String? unitAmountDecimal,
    StripeMetaDataStruct? metadata,
    int? created,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _active = active,
        _currency = currency,
        _product = product,
        _unitAmount = unitAmount,
        _unitAmountDecimal = unitAmountDecimal,
        _metadata = metadata,
        _created = created,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  // "unit_amount" field.
  int? _unitAmount;
  int get unitAmount => _unitAmount ?? 0;
  set unitAmount(int? val) => _unitAmount = val;

  void incrementUnitAmount(int amount) => unitAmount = unitAmount + amount;

  bool hasUnitAmount() => _unitAmount != null;

  // "unit_amount_decimal" field.
  String? _unitAmountDecimal;
  String get unitAmountDecimal => _unitAmountDecimal ?? '';
  set unitAmountDecimal(String? val) => _unitAmountDecimal = val;

  bool hasUnitAmountDecimal() => _unitAmountDecimal != null;

  // "metadata" field.
  StripeMetaDataStruct? _metadata;
  StripeMetaDataStruct get metadata => _metadata ?? StripeMetaDataStruct();
  set metadata(StripeMetaDataStruct? val) => _metadata = val;

  void updateMetadata(Function(StripeMetaDataStruct) updateFn) {
    updateFn(_metadata ??= StripeMetaDataStruct());
  }

  bool hasMetadata() => _metadata != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  static StripePriceStruct fromMap(Map<String, dynamic> data) =>
      StripePriceStruct(
        id: data['id'] as String?,
        active: data['active'] as bool?,
        currency: data['currency'] as String?,
        product: data['product'] as String?,
        unitAmount: castToType<int>(data['unit_amount']),
        unitAmountDecimal: data['unit_amount_decimal'] as String?,
        metadata: StripeMetaDataStruct.maybeFromMap(data['metadata']),
        created: castToType<int>(data['created']),
      );

  static StripePriceStruct? maybeFromMap(dynamic data) => data is Map
      ? StripePriceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'active': _active,
        'currency': _currency,
        'product': _product,
        'unit_amount': _unitAmount,
        'unit_amount_decimal': _unitAmountDecimal,
        'metadata': _metadata?.toMap(),
        'created': _created,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'unit_amount': serializeParam(
          _unitAmount,
          ParamType.int,
        ),
        'unit_amount_decimal': serializeParam(
          _unitAmountDecimal,
          ParamType.String,
        ),
        'metadata': serializeParam(
          _metadata,
          ParamType.DataStruct,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
      }.withoutNulls;

  static StripePriceStruct fromSerializableMap(Map<String, dynamic> data) =>
      StripePriceStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        unitAmount: deserializeParam(
          data['unit_amount'],
          ParamType.int,
          false,
        ),
        unitAmountDecimal: deserializeParam(
          data['unit_amount_decimal'],
          ParamType.String,
          false,
        ),
        metadata: deserializeStructParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: StripeMetaDataStruct.fromSerializableMap,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
      );

  static StripePriceStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StripePriceStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        currency: convertAlgoliaParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        product: convertAlgoliaParam(
          data['product'],
          ParamType.String,
          false,
        ),
        unitAmount: convertAlgoliaParam(
          data['unit_amount'],
          ParamType.int,
          false,
        ),
        unitAmountDecimal: convertAlgoliaParam(
          data['unit_amount_decimal'],
          ParamType.String,
          false,
        ),
        metadata: convertAlgoliaParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: StripeMetaDataStruct.fromAlgoliaData,
        ),
        created: convertAlgoliaParam(
          data['created'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripePriceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripePriceStruct &&
        id == other.id &&
        active == other.active &&
        currency == other.currency &&
        product == other.product &&
        unitAmount == other.unitAmount &&
        unitAmountDecimal == other.unitAmountDecimal &&
        metadata == other.metadata &&
        created == other.created;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        active,
        currency,
        product,
        unitAmount,
        unitAmountDecimal,
        metadata,
        created
      ]);
}

StripePriceStruct createStripePriceStruct({
  String? id,
  bool? active,
  String? currency,
  String? product,
  int? unitAmount,
  String? unitAmountDecimal,
  StripeMetaDataStruct? metadata,
  int? created,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripePriceStruct(
      id: id,
      active: active,
      currency: currency,
      product: product,
      unitAmount: unitAmount,
      unitAmountDecimal: unitAmountDecimal,
      metadata: metadata ?? (clearUnsetFields ? StripeMetaDataStruct() : null),
      created: created,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripePriceStruct? updateStripePriceStruct(
  StripePriceStruct? stripePrice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripePrice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripePriceStructData(
  Map<String, dynamic> firestoreData,
  StripePriceStruct? stripePrice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripePrice == null) {
    return;
  }
  if (stripePrice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripePrice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripePriceData =
      getStripePriceFirestoreData(stripePrice, forFieldValue);
  final nestedData =
      stripePriceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripePrice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripePriceFirestoreData(
  StripePriceStruct? stripePrice, [
  bool forFieldValue = false,
]) {
  if (stripePrice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripePrice.toMap());

  // Handle nested data for "metadata" field.
  addStripeMetaDataStructData(
    firestoreData,
    stripePrice.hasMetadata() ? stripePrice.metadata : null,
    'metadata',
    forFieldValue,
  );

  // Add any Firestore field values
  stripePrice.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripePriceListFirestoreData(
  List<StripePriceStruct>? stripePrices,
) =>
    stripePrices?.map((e) => getStripePriceFirestoreData(e, true)).toList() ??
    [];
