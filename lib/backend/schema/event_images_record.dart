import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventImagesRecord extends FirestoreRecord {
  EventImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "status" field.
  ImageStatusStruct? _status;
  ImageStatusStruct get status => _status ?? ImageStatusStruct();
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _status = ImageStatusStruct.maybeFromMap(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventImages')
          : FirebaseFirestore.instance.collectionGroup('eventImages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('eventImages').doc(id);

  static Stream<EventImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventImagesRecord.fromSnapshot(s));

  static Future<EventImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventImagesRecord.fromSnapshot(s));

  static EventImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventImagesRecordData({
  String? url,
  int? order,
  ImageStatusStruct? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'order': order,
      'status': ImageStatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addImageStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class EventImagesRecordDocumentEquality implements Equality<EventImagesRecord> {
  const EventImagesRecordDocumentEquality();

  @override
  bool equals(EventImagesRecord? e1, EventImagesRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.order == e2?.order &&
        e1?.status == e2?.status;
  }

  @override
  int hash(EventImagesRecord? e) =>
      const ListEquality().hash([e?.url, e?.order, e?.status]);

  @override
  bool isValidKey(Object? o) => o is EventImagesRecord;
}
