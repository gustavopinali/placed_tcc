import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentsRecord extends FirestoreRecord {
  PostCommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "usersLiked" field.
  List<DocumentReference>? _usersLiked;
  List<DocumentReference> get usersLiked => _usersLiked ?? const [];
  bool hasUsersLiked() => _usersLiked != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _active = snapshotData['active'] as bool?;
    _usersLiked = getDataList(snapshotData['usersLiked']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postComments')
          : FirebaseFirestore.instance.collectionGroup('postComments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postComments').doc(id);

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentsRecord.fromSnapshot(s));

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostCommentsRecord.fromSnapshot(s));

  static PostCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostCommentsRecordData({
  String? comment,
  DocumentReference? createdBy,
  DateTime? createdAt,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostCommentsRecordDocumentEquality
    implements Equality<PostCommentsRecord> {
  const PostCommentsRecordDocumentEquality();

  @override
  bool equals(PostCommentsRecord? e1, PostCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.comment == e2?.comment &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.active == e2?.active &&
        listEquality.equals(e1?.usersLiked, e2?.usersLiked);
  }

  @override
  int hash(PostCommentsRecord? e) => const ListEquality()
      .hash([e?.comment, e?.createdBy, e?.createdAt, e?.active, e?.usersLiked]);

  @override
  bool isValidKey(Object? o) => o is PostCommentsRecord;
}
