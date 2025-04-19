import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "text" field.
  TextStruct? _text;
  TextStruct get text => _text ?? TextStruct();
  bool hasText() => _text != null;

  // "place" field.
  bool? _place;
  bool get place => _place ?? false;
  bool hasPlace() => _place != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  // "product" field.
  bool? _product;
  bool get product => _product ?? false;
  bool hasProduct() => _product != null;

  // "menu" field.
  bool? _menu;
  bool get menu => _menu ?? false;
  bool hasMenu() => _menu != null;

  void _initializeFields() {
    _code = castToType<int>(snapshotData['code']);
    _text = TextStruct.maybeFromMap(snapshotData['text']);
    _place = snapshotData['place'] as bool?;
    _event = snapshotData['event'] as bool?;
    _product = snapshotData['product'] as bool?;
    _menu = snapshotData['menu'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  int? code,
  TextStruct? text,
  bool? place,
  bool? event,
  bool? product,
  bool? menu,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'text': TextStruct().toMap(),
      'place': place,
      'event': event,
      'product': product,
      'menu': menu,
    }.withoutNulls,
  );

  // Handle nested data for "text" field.
  addTextStructData(firestoreData, text, 'text');

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.text == e2?.text &&
        e1?.place == e2?.place &&
        e1?.event == e2?.event &&
        e1?.product == e2?.product &&
        e1?.menu == e2?.menu;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.code, e?.text, e?.place, e?.event, e?.product, e?.menu]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
