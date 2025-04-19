// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LinkStruct extends FFFirebaseStruct {
  LinkStruct({
    String? text,
    String? url,
    int? order,
    LinkType? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _url = url,
        _order = order,
        _type = type,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "type" field.
  LinkType? _type;
  LinkType? get type => _type;
  set type(LinkType? val) => _type = val;

  bool hasType() => _type != null;

  static LinkStruct fromMap(Map<String, dynamic> data) => LinkStruct(
        text: data['text'] as String?,
        url: data['url'] as String?,
        order: castToType<int>(data['order']),
        type: deserializeEnum<LinkType>(data['type']),
      );

  static LinkStruct? maybeFromMap(dynamic data) =>
      data is Map ? LinkStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'url': _url,
        'order': _order,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static LinkStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinkStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        type: deserializeParam<LinkType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  static LinkStruct fromAlgoliaData(Map<String, dynamic> data) => LinkStruct(
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        order: convertAlgoliaParam(
          data['order'],
          ParamType.int,
          false,
        ),
        type: convertAlgoliaParam<LinkType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LinkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkStruct &&
        text == other.text &&
        url == other.url &&
        order == other.order &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([text, url, order, type]);
}

LinkStruct createLinkStruct({
  String? text,
  String? url,
  int? order,
  LinkType? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkStruct(
      text: text,
      url: url,
      order: order,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkStruct? updateLinkStruct(
  LinkStruct? link, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    link
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkStructData(
  Map<String, dynamic> firestoreData,
  LinkStruct? link,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (link == null) {
    return;
  }
  if (link.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && link.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkData = getLinkFirestoreData(link, forFieldValue);
  final nestedData = linkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = link.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkFirestoreData(
  LinkStruct? link, [
  bool forFieldValue = false,
]) {
  if (link == null) {
    return {};
  }
  final firestoreData = mapToFirestore(link.toMap());

  // Add any Firestore field values
  link.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkListFirestoreData(
  List<LinkStruct>? links,
) =>
    links?.map((e) => getLinkFirestoreData(e, true)).toList() ?? [];
