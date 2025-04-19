import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostViewsRecord extends FirestoreRecord {
  PostViewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _status = StatusStruct.maybeFromMap(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postViews')
          : FirebaseFirestore.instance.collectionGroup('postViews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postViews').doc(id);

  static Stream<PostViewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostViewsRecord.fromSnapshot(s));

  static Future<PostViewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostViewsRecord.fromSnapshot(s));

  static PostViewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostViewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostViewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostViewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostViewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostViewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostViewsRecordData({
  DocumentReference? userRef,
  StatusStruct? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'status': StatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class PostViewsRecordDocumentEquality implements Equality<PostViewsRecord> {
  const PostViewsRecordDocumentEquality();

  @override
  bool equals(PostViewsRecord? e1, PostViewsRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.status == e2?.status;
  }

  @override
  int hash(PostViewsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.status]);

  @override
  bool isValidKey(Object? o) => o is PostViewsRecord;
}
