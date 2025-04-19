// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeProductStruct extends FFFirebaseStruct {
  StripeProductStruct({
    String? id,
    bool? active,
    String? defaultPrice,
    String? description,
    List<String>? images,
    StripeMetaDataStruct? metadata,
    String? name,
    int? created,
    int? updated,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _active = active,
        _defaultPrice = defaultPrice,
        _description = description,
        _images = images,
        _metadata = metadata,
        _name = name,
        _created = created,
        _updated = updated,
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

  // "default_price" field.
  String? _defaultPrice;
  String get defaultPrice => _defaultPrice ?? '';
  set defaultPrice(String? val) => _defaultPrice = val;

  bool hasDefaultPrice() => _defaultPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "metadata" field.
  StripeMetaDataStruct? _metadata;
  StripeMetaDataStruct get metadata => _metadata ?? StripeMetaDataStruct();
  set metadata(StripeMetaDataStruct? val) => _metadata = val;

  void updateMetadata(Function(StripeMetaDataStruct) updateFn) {
    updateFn(_metadata ??= StripeMetaDataStruct());
  }

  bool hasMetadata() => _metadata != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  static StripeProductStruct fromMap(Map<String, dynamic> data) =>
      StripeProductStruct(
        id: data['id'] as String?,
        active: data['active'] as bool?,
        defaultPrice: data['default_price'] as String?,
        description: data['description'] as String?,
        images: getDataList(data['images']),
        metadata: StripeMetaDataStruct.maybeFromMap(data['metadata']),
        name: data['name'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
      );

  static StripeProductStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'active': _active,
        'default_price': _defaultPrice,
        'description': _description,
        'images': _images,
        'metadata': _metadata?.toMap(),
        'name': _name,
        'created': _created,
        'updated': _updated,
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
        'default_price': serializeParam(
          _defaultPrice,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'metadata': serializeParam(
          _metadata,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
      }.withoutNulls;

  static StripeProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      StripeProductStruct(
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
        defaultPrice: deserializeParam(
          data['default_price'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        metadata: deserializeStructParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: StripeMetaDataStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
      );

  static StripeProductStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StripeProductStruct(
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
        defaultPrice: convertAlgoliaParam(
          data['default_price'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        images: convertAlgoliaParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        metadata: convertAlgoliaParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: StripeMetaDataStruct.fromAlgoliaData,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        created: convertAlgoliaParam(
          data['created'],
          ParamType.int,
          false,
        ),
        updated: convertAlgoliaParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripeProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StripeProductStruct &&
        id == other.id &&
        active == other.active &&
        defaultPrice == other.defaultPrice &&
        description == other.description &&
        listEquality.equals(images, other.images) &&
        metadata == other.metadata &&
        name == other.name &&
        created == other.created &&
        updated == other.updated;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        active,
        defaultPrice,
        description,
        images,
        metadata,
        name,
        created,
        updated
      ]);
}

StripeProductStruct createStripeProductStruct({
  String? id,
  bool? active,
  String? defaultPrice,
  String? description,
  StripeMetaDataStruct? metadata,
  String? name,
  int? created,
  int? updated,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeProductStruct(
      id: id,
      active: active,
      defaultPrice: defaultPrice,
      description: description,
      metadata: metadata ?? (clearUnsetFields ? StripeMetaDataStruct() : null),
      name: name,
      created: created,
      updated: updated,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeProductStruct? updateStripeProductStruct(
  StripeProductStruct? stripeProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeProductStructData(
  Map<String, dynamic> firestoreData,
  StripeProductStruct? stripeProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeProduct == null) {
    return;
  }
  if (stripeProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeProductData =
      getStripeProductFirestoreData(stripeProduct, forFieldValue);
  final nestedData =
      stripeProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripeProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeProductFirestoreData(
  StripeProductStruct? stripeProduct, [
  bool forFieldValue = false,
]) {
  if (stripeProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeProduct.toMap());

  // Handle nested data for "metadata" field.
  addStripeMetaDataStructData(
    firestoreData,
    stripeProduct.hasMetadata() ? stripeProduct.metadata : null,
    'metadata',
    forFieldValue,
  );

  // Add any Firestore field values
  stripeProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeProductListFirestoreData(
  List<StripeProductStruct>? stripeProducts,
) =>
    stripeProducts
        ?.map((e) => getStripeProductFirestoreData(e, true))
        .toList() ??
    [];
