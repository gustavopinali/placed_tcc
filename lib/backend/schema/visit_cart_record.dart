import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitCartRecord extends FirestoreRecord {
  VisitCartRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "products" field.
  List<CartProductStruct>? _products;
  List<CartProductStruct> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _active = snapshotData['active'] as bool?;
    _products = getStructList(
      snapshotData['products'],
      CartProductStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitCart')
          : FirebaseFirestore.instance.collectionGroup('visitCart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitCart').doc(id);

  static Stream<VisitCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitCartRecord.fromSnapshot(s));

  static Future<VisitCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitCartRecord.fromSnapshot(s));

  static VisitCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitCartRecordData({
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitCartRecordDocumentEquality implements Equality<VisitCartRecord> {
  const VisitCartRecordDocumentEquality();

  @override
  bool equals(VisitCartRecord? e1, VisitCartRecord? e2) {
    const listEquality = ListEquality();
    return e1?.active == e2?.active &&
        listEquality.equals(e1?.products, e2?.products);
  }

  @override
  int hash(VisitCartRecord? e) =>
      const ListEquality().hash([e?.active, e?.products]);

  @override
  bool isValidKey(Object? o) => o is VisitCartRecord;
}
