// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceConfigStruct extends FFFirebaseStruct {
  PlaceConfigStruct({
    PageTabsStruct? pageTabs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pageTabs = pageTabs,
        super(firestoreUtilData);

  // "pageTabs" field.
  PageTabsStruct? _pageTabs;
  PageTabsStruct get pageTabs => _pageTabs ?? PageTabsStruct();
  set pageTabs(PageTabsStruct? val) => _pageTabs = val;

  void updatePageTabs(Function(PageTabsStruct) updateFn) {
    updateFn(_pageTabs ??= PageTabsStruct());
  }

  bool hasPageTabs() => _pageTabs != null;

  static PlaceConfigStruct fromMap(Map<String, dynamic> data) =>
      PlaceConfigStruct(
        pageTabs: PageTabsStruct.maybeFromMap(data['pageTabs']),
      );

  static PlaceConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pageTabs': _pageTabs?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pageTabs': serializeParam(
          _pageTabs,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PlaceConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceConfigStruct(
        pageTabs: deserializeStructParam(
          data['pageTabs'],
          ParamType.DataStruct,
          false,
          structBuilder: PageTabsStruct.fromSerializableMap,
        ),
      );

  static PlaceConfigStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceConfigStruct(
        pageTabs: convertAlgoliaParam(
          data['pageTabs'],
          ParamType.DataStruct,
          false,
          structBuilder: PageTabsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceConfigStruct && pageTabs == other.pageTabs;
  }

  @override
  int get hashCode => const ListEquality().hash([pageTabs]);
}

PlaceConfigStruct createPlaceConfigStruct({
  PageTabsStruct? pageTabs,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceConfigStruct(
      pageTabs: pageTabs ?? (clearUnsetFields ? PageTabsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceConfigStruct? updatePlaceConfigStruct(
  PlaceConfigStruct? placeConfig, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeConfig
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceConfigStructData(
  Map<String, dynamic> firestoreData,
  PlaceConfigStruct? placeConfig,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeConfig == null) {
    return;
  }
  if (placeConfig.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeConfig.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeConfigData =
      getPlaceConfigFirestoreData(placeConfig, forFieldValue);
  final nestedData =
      placeConfigData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeConfig.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceConfigFirestoreData(
  PlaceConfigStruct? placeConfig, [
  bool forFieldValue = false,
]) {
  if (placeConfig == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeConfig.toMap());

  // Handle nested data for "pageTabs" field.
  addPageTabsStructData(
    firestoreData,
    placeConfig.hasPageTabs() ? placeConfig.pageTabs : null,
    'pageTabs',
    forFieldValue,
  );

  // Add any Firestore field values
  placeConfig.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceConfigListFirestoreData(
  List<PlaceConfigStruct>? placeConfigs,
) =>
    placeConfigs?.map((e) => getPlaceConfigFirestoreData(e, true)).toList() ??
    [];
