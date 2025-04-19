// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PageTabsStruct extends FFFirebaseStruct {
  PageTabsStruct({
    bool? dashboard,
    bool? products,
    bool? visits,
    bool? posts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dashboard = dashboard,
        _products = products,
        _visits = visits,
        _posts = posts,
        super(firestoreUtilData);

  // "dashboard" field.
  bool? _dashboard;
  bool get dashboard => _dashboard ?? false;
  set dashboard(bool? val) => _dashboard = val;

  bool hasDashboard() => _dashboard != null;

  // "products" field.
  bool? _products;
  bool get products => _products ?? false;
  set products(bool? val) => _products = val;

  bool hasProducts() => _products != null;

  // "visits" field.
  bool? _visits;
  bool get visits => _visits ?? false;
  set visits(bool? val) => _visits = val;

  bool hasVisits() => _visits != null;

  // "posts" field.
  bool? _posts;
  bool get posts => _posts ?? false;
  set posts(bool? val) => _posts = val;

  bool hasPosts() => _posts != null;

  static PageTabsStruct fromMap(Map<String, dynamic> data) => PageTabsStruct(
        dashboard: data['dashboard'] as bool?,
        products: data['products'] as bool?,
        visits: data['visits'] as bool?,
        posts: data['posts'] as bool?,
      );

  static PageTabsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PageTabsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dashboard': _dashboard,
        'products': _products,
        'visits': _visits,
        'posts': _posts,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dashboard': serializeParam(
          _dashboard,
          ParamType.bool,
        ),
        'products': serializeParam(
          _products,
          ParamType.bool,
        ),
        'visits': serializeParam(
          _visits,
          ParamType.bool,
        ),
        'posts': serializeParam(
          _posts,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PageTabsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageTabsStruct(
        dashboard: deserializeParam(
          data['dashboard'],
          ParamType.bool,
          false,
        ),
        products: deserializeParam(
          data['products'],
          ParamType.bool,
          false,
        ),
        visits: deserializeParam(
          data['visits'],
          ParamType.bool,
          false,
        ),
        posts: deserializeParam(
          data['posts'],
          ParamType.bool,
          false,
        ),
      );

  static PageTabsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PageTabsStruct(
        dashboard: convertAlgoliaParam(
          data['dashboard'],
          ParamType.bool,
          false,
        ),
        products: convertAlgoliaParam(
          data['products'],
          ParamType.bool,
          false,
        ),
        visits: convertAlgoliaParam(
          data['visits'],
          ParamType.bool,
          false,
        ),
        posts: convertAlgoliaParam(
          data['posts'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PageTabsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageTabsStruct &&
        dashboard == other.dashboard &&
        products == other.products &&
        visits == other.visits &&
        posts == other.posts;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dashboard, products, visits, posts]);
}

PageTabsStruct createPageTabsStruct({
  bool? dashboard,
  bool? products,
  bool? visits,
  bool? posts,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageTabsStruct(
      dashboard: dashboard,
      products: products,
      visits: visits,
      posts: posts,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageTabsStruct? updatePageTabsStruct(
  PageTabsStruct? pageTabs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageTabs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageTabsStructData(
  Map<String, dynamic> firestoreData,
  PageTabsStruct? pageTabs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageTabs == null) {
    return;
  }
  if (pageTabs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageTabs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageTabsData = getPageTabsFirestoreData(pageTabs, forFieldValue);
  final nestedData = pageTabsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageTabs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageTabsFirestoreData(
  PageTabsStruct? pageTabs, [
  bool forFieldValue = false,
]) {
  if (pageTabs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageTabs.toMap());

  // Add any Firestore field values
  pageTabs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageTabsListFirestoreData(
  List<PageTabsStruct>? pageTabss,
) =>
    pageTabss?.map((e) => getPageTabsFirestoreData(e, true)).toList() ?? [];
