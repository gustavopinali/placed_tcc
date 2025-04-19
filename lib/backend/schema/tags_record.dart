import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  TextStruct? _text;
  TextStruct get text => _text ?? TextStruct();
  bool hasText() => _text != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "user" field.
  bool? _user;
  bool get user => _user ?? false;
  bool hasUser() => _user != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  // "place" field.
  bool? _place;
  bool get place => _place ?? false;
  bool hasPlace() => _place != null;

  // "product" field.
  bool? _product;
  bool get product => _product ?? false;
  bool hasProduct() => _product != null;

  void _initializeFields() {
    _text = TextStruct.maybeFromMap(snapshotData['text']);
    _code = castToType<int>(snapshotData['code']);
    _user = snapshotData['user'] as bool?;
    _event = snapshotData['event'] as bool?;
    _place = snapshotData['place'] as bool?;
    _product = snapshotData['product'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  TextStruct? text,
  int? code,
  bool? user,
  bool? event,
  bool? place,
  bool? product,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': TextStruct().toMap(),
      'code': code,
      'user': user,
      'event': event,
      'place': place,
      'product': product,
    }.withoutNulls,
  );

  // Handle nested data for "text" field.
  addTextStructData(firestoreData, text, 'text');

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.code == e2?.code &&
        e1?.user == e2?.user &&
        e1?.event == e2?.event &&
        e1?.place == e2?.place &&
        e1?.product == e2?.product;
  }

  @override
  int hash(TagsRecord? e) => const ListEquality()
      .hash([e?.text, e?.code, e?.user, e?.event, e?.place, e?.product]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
