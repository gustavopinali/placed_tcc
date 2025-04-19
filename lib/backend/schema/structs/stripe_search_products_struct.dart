// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeSearchProductsStruct extends FFFirebaseStruct {
  StripeSearchProductsStruct({
    List<StripeProductStruct>? data,
    bool? hasMore,
    String? nextPage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _hasMore = hasMore,
        _nextPage = nextPage,
        super(firestoreUtilData);

  // "data" field.
  List<StripeProductStruct>? _data;
  List<StripeProductStruct> get data => _data ?? const [];
  set data(List<StripeProductStruct>? val) => _data = val;

  void updateData(Function(List<StripeProductStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  // "has_more" field.
  bool? _hasMore;
  bool get hasMore => _hasMore ?? false;
  set hasMore(bool? val) => _hasMore = val;

  bool hasHasMore() => _hasMore != null;

  // "next_page" field.
  String? _nextPage;
  String get nextPage => _nextPage ?? '';
  set nextPage(String? val) => _nextPage = val;

  bool hasNextPage() => _nextPage != null;

  static StripeSearchProductsStruct fromMap(Map<String, dynamic> data) =>
      StripeSearchProductsStruct(
        data: getStructList(
          data['data'],
          StripeProductStruct.fromMap,
        ),
        hasMore: data['has_more'] as bool?,
        nextPage: data['next_page'] as String?,
      );

  static StripeSearchProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeSearchProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
        'has_more': _hasMore,
        'next_page': _nextPage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
        'has_more': serializeParam(
          _hasMore,
          ParamType.bool,
        ),
        'next_page': serializeParam(
          _nextPage,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeSearchProductsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StripeSearchProductsStruct(
        data: deserializeStructParam<StripeProductStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StripeProductStruct.fromSerializableMap,
        ),
        hasMore: deserializeParam(
          data['has_more'],
          ParamType.bool,
          false,
        ),
        nextPage: deserializeParam(
          data['next_page'],
          ParamType.String,
          false,
        ),
      );

  static StripeSearchProductsStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      StripeSearchProductsStruct(
        data: convertAlgoliaParam<StripeProductStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StripeProductStruct.fromAlgoliaData,
        ),
        hasMore: convertAlgoliaParam(
          data['has_more'],
          ParamType.bool,
          false,
        ),
        nextPage: convertAlgoliaParam(
          data['next_page'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StripeSearchProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StripeSearchProductsStruct &&
        listEquality.equals(data, other.data) &&
        hasMore == other.hasMore &&
        nextPage == other.nextPage;
  }

  @override
  int get hashCode => const ListEquality().hash([data, hasMore, nextPage]);
}

StripeSearchProductsStruct createStripeSearchProductsStruct({
  bool? hasMore,
  String? nextPage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeSearchProductsStruct(
      hasMore: hasMore,
      nextPage: nextPage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeSearchProductsStruct? updateStripeSearchProductsStruct(
  StripeSearchProductsStruct? stripeSearchProducts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeSearchProducts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeSearchProductsStructData(
  Map<String, dynamic> firestoreData,
  StripeSearchProductsStruct? stripeSearchProducts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeSearchProducts == null) {
    return;
  }
  if (stripeSearchProducts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeSearchProducts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeSearchProductsData =
      getStripeSearchProductsFirestoreData(stripeSearchProducts, forFieldValue);
  final nestedData =
      stripeSearchProductsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      stripeSearchProducts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeSearchProductsFirestoreData(
  StripeSearchProductsStruct? stripeSearchProducts, [
  bool forFieldValue = false,
]) {
  if (stripeSearchProducts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeSearchProducts.toMap());

  // Add any Firestore field values
  stripeSearchProducts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeSearchProductsListFirestoreData(
  List<StripeSearchProductsStruct>? stripeSearchProductss,
) =>
    stripeSearchProductss
        ?.map((e) => getStripeSearchProductsFirestoreData(e, true))
        .toList() ??
    [];
