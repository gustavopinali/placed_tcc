// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductDataStruct extends FFFirebaseStruct {
  ProductDataStruct({
    String? name,
    String? description,
    double? price,
    List<DocumentReference>? categories,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _price = price,
        _categories = categories,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  set categories(List<DocumentReference>? val) => _categories = val;

  void updateCategories(Function(List<DocumentReference>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  static ProductDataStruct fromMap(Map<String, dynamic> data) =>
      ProductDataStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
        categories: getDataList(data['categories']),
      );

  static ProductDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'price': _price,
        'categories': _categories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ProductDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        categories: deserializeParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['categories'],
        ),
      );

  static ProductDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductDataStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        categories: convertAlgoliaParam<DocumentReference>(
          data['categories'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductDataStruct &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        listEquality.equals(categories, other.categories);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, description, price, categories]);
}

ProductDataStruct createProductDataStruct({
  String? name,
  String? description,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductDataStruct(
      name: name,
      description: description,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductDataStruct? updateProductDataStruct(
  ProductDataStruct? productData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductDataStructData(
  Map<String, dynamic> firestoreData,
  ProductDataStruct? productData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productData == null) {
    return;
  }
  if (productData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productDataData =
      getProductDataFirestoreData(productData, forFieldValue);
  final nestedData =
      productDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductDataFirestoreData(
  ProductDataStruct? productData, [
  bool forFieldValue = false,
]) {
  if (productData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productData.toMap());

  // Add any Firestore field values
  productData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductDataListFirestoreData(
  List<ProductDataStruct>? productDatas,
) =>
    productDatas?.map((e) => getProductDataFirestoreData(e, true)).toList() ??
    [];
