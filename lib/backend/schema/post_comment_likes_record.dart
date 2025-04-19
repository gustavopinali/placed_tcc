import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentLikesRecord extends FirestoreRecord {
  PostCommentLikesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "commentRef" field.
  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  bool hasCommentRef() => _commentRef != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _commentRef = snapshotData['commentRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postCommentLikes')
          : FirebaseFirestore.instance.collectionGroup('postCommentLikes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postCommentLikes').doc(id);

  static Stream<PostCommentLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentLikesRecord.fromSnapshot(s));

  static Future<PostCommentLikesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostCommentLikesRecord.fromSnapshot(s));

  static PostCommentLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostCommentLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostCommentLikesRecordData({
  DocumentReference? userRef,
  DocumentReference? commentRef,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'commentRef': commentRef,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostCommentLikesRecordDocumentEquality
    implements Equality<PostCommentLikesRecord> {
  const PostCommentLikesRecordDocumentEquality();

  @override
  bool equals(PostCommentLikesRecord? e1, PostCommentLikesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.commentRef == e2?.commentRef &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PostCommentLikesRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.commentRef, e?.active, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is PostCommentLikesRecord;
}
