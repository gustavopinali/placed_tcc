import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceImagesRecord extends FirestoreRecord {
  PlaceImagesRecord._(
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

  // "imageGoogle" field.
  String? _imageGoogle;
  String get imageGoogle => _imageGoogle ?? '';
  bool hasImageGoogle() => _imageGoogle != null;

  // "subscription" field.
  bool? _subscription;
  bool get subscription => _subscription ?? false;
  bool hasSubscription() => _subscription != null;

  // "placeSubRef" field.
  DocumentReference? _placeSubRef;
  DocumentReference? get placeSubRef => _placeSubRef;
  bool hasPlaceSubRef() => _placeSubRef != null;

  // "placed" field.
  bool? _placed;
  bool get placed => _placed ?? false;
  bool hasPlaced() => _placed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _status = ImageStatusStruct.maybeFromMap(snapshotData['status']);
    _imageGoogle = snapshotData['imageGoogle'] as String?;
    _subscription = snapshotData['subscription'] as bool?;
    _placeSubRef = snapshotData['placeSubRef'] as DocumentReference?;
    _placed = snapshotData['placed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('placeImages')
          : FirebaseFirestore.instance.collectionGroup('placeImages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('placeImages').doc(id);

  static Stream<PlaceImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceImagesRecord.fromSnapshot(s));

  static Future<PlaceImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceImagesRecord.fromSnapshot(s));

  static PlaceImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceImagesRecordData({
  String? url,
  int? order,
  ImageStatusStruct? status,
  String? imageGoogle,
  bool? subscription,
  DocumentReference? placeSubRef,
  bool? placed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'order': order,
      'status': ImageStatusStruct().toMap(),
      'imageGoogle': imageGoogle,
      'subscription': subscription,
      'placeSubRef': placeSubRef,
      'placed': placed,
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addImageStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class PlaceImagesRecordDocumentEquality implements Equality<PlaceImagesRecord> {
  const PlaceImagesRecordDocumentEquality();

  @override
  bool equals(PlaceImagesRecord? e1, PlaceImagesRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.order == e2?.order &&
        e1?.status == e2?.status &&
        e1?.imageGoogle == e2?.imageGoogle &&
        e1?.subscription == e2?.subscription &&
        e1?.placeSubRef == e2?.placeSubRef &&
        e1?.placed == e2?.placed;
  }

  @override
  int hash(PlaceImagesRecord? e) => const ListEquality().hash([
        e?.url,
        e?.order,
        e?.status,
        e?.imageGoogle,
        e?.subscription,
        e?.placeSubRef,
        e?.placed
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaceImagesRecord;
}
