import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserImagesRecord extends FirestoreRecord {
  UserImagesRecord._(
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

  // "blur" field.
  String? _blur;
  String get blur => _blur ?? '';
  bool hasBlur() => _blur != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _status = ImageStatusStruct.maybeFromMap(snapshotData['status']);
    _blur = snapshotData['blur'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userImages')
          : FirebaseFirestore.instance.collectionGroup('userImages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userImages').doc(id);

  static Stream<UserImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserImagesRecord.fromSnapshot(s));

  static Future<UserImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserImagesRecord.fromSnapshot(s));

  static UserImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserImagesRecordData({
  String? url,
  int? order,
  ImageStatusStruct? status,
  String? blur,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'order': order,
      'status': ImageStatusStruct().toMap(),
      'blur': blur,
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addImageStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class UserImagesRecordDocumentEquality implements Equality<UserImagesRecord> {
  const UserImagesRecordDocumentEquality();

  @override
  bool equals(UserImagesRecord? e1, UserImagesRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.order == e2?.order &&
        e1?.status == e2?.status &&
        e1?.blur == e2?.blur;
  }

  @override
  int hash(UserImagesRecord? e) =>
      const ListEquality().hash([e?.url, e?.order, e?.status, e?.blur]);

  @override
  bool isValidKey(Object? o) => o is UserImagesRecord;
}
