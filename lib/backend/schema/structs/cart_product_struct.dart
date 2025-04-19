// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartProductStruct extends FFFirebaseStruct {
  CartProductStruct({
    DocumentReference? stripeProductRef,
    int? quantity,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stripeProductRef = stripeProductRef,
        _quantity = quantity,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "stripeProductRef" field.
  DocumentReference? _stripeProductRef;
  DocumentReference? get stripeProductRef => _stripeProductRef;
  set stripeProductRef(DocumentReference? val) => _stripeProductRef = val;

  bool hasStripeProductRef() => _stripeProductRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static CartProductStruct fromMap(Map<String, dynamic> data) =>
      CartProductStruct(
        stripeProductRef: data['stripeProductRef'] as DocumentReference?,
        quantity: castToType<int>(data['quantity']),
        createdAt: data['createdAt'] as DateTime?,
      );

  static CartProductStruct? maybeFromMap(dynamic data) => data is Map
      ? CartProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stripeProductRef': _stripeProductRef,
        'quantity': _quantity,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stripeProductRef': serializeParam(
          _stripeProductRef,
          ParamType.DocumentReference,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CartProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartProductStruct(
        stripeProductRef: deserializeParam(
          data['stripeProductRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['stripeProducts'],
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  static CartProductStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CartProductStruct(
        stripeProductRef: convertAlgoliaParam(
          data['stripeProductRef'],
          ParamType.DocumentReference,
          false,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CartProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartProductStruct &&
        stripeProductRef == other.stripeProductRef &&
        quantity == other.quantity &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([stripeProductRef, quantity, createdAt]);
}

CartProductStruct createCartProductStruct({
  DocumentReference? stripeProductRef,
  int? quantity,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartProductStruct(
      stripeProductRef: stripeProductRef,
      quantity: quantity,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartProductStruct? updateCartProductStruct(
  CartProductStruct? cartProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartProductStructData(
  Map<String, dynamic> firestoreData,
  CartProductStruct? cartProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartProduct == null) {
    return;
  }
  if (cartProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartProductData =
      getCartProductFirestoreData(cartProduct, forFieldValue);
  final nestedData =
      cartProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartProductFirestoreData(
  CartProductStruct? cartProduct, [
  bool forFieldValue = false,
]) {
  if (cartProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartProduct.toMap());

  // Add any Firestore field values
  cartProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartProductListFirestoreData(
  List<CartProductStruct>? cartProducts,
) =>
    cartProducts?.map((e) => getCartProductFirestoreData(e, true)).toList() ??
    [];
