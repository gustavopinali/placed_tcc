import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostLikesRecord extends FirestoreRecord {
  PostLikesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _active = snapshotData['active'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postLikes')
          : FirebaseFirestore.instance.collectionGroup('postLikes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postLikes').doc(id);

  static Stream<PostLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostLikesRecord.fromSnapshot(s));

  static Future<PostLikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostLikesRecord.fromSnapshot(s));

  static PostLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostLikesRecordData({
  DocumentReference? userRef,
  DateTime? createdAt,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'createdAt': createdAt,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostLikesRecordDocumentEquality implements Equality<PostLikesRecord> {
  const PostLikesRecordDocumentEquality();

  @override
  bool equals(PostLikesRecord? e1, PostLikesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.active == e2?.active;
  }

  @override
  int hash(PostLikesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.createdAt, e?.active]);

  @override
  bool isValidKey(Object? o) => o is PostLikesRecord;
}
