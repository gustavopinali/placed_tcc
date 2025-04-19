import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "visitRef" field.
  DocumentReference? _visitRef;
  DocumentReference? get visitRef => _visitRef;
  bool hasVisitRef() => _visitRef != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "status" field.
  PostStatusStruct? _status;
  PostStatusStruct get status => _status ?? PostStatusStruct();
  bool hasStatus() => _status != null;

  // "usersLiked" field.
  List<DocumentReference>? _usersLiked;
  List<DocumentReference> get usersLiked => _usersLiked ?? const [];
  bool hasUsersLiked() => _usersLiked != null;

  // "postImages" field.
  List<ImageStruct>? _postImages;
  List<ImageStruct> get postImages => _postImages ?? const [];
  bool hasPostImages() => _postImages != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _visitRef = snapshotData['visitRef'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
    _status = PostStatusStruct.maybeFromMap(snapshotData['status']);
    _usersLiked = getDataList(snapshotData['usersLiked']);
    _postImages = getStructList(
      snapshotData['postImages'],
      ImageStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? description,
  DocumentReference? userRef,
  DocumentReference? eventRef,
  DocumentReference? placeRef,
  DocumentReference? visitRef,
  PostStatusStruct? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'userRef': userRef,
      'eventRef': eventRef,
      'placeRef': placeRef,
      'visitRef': visitRef,
      'status': PostStatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addPostStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.description == e2?.description &&
        e1?.userRef == e2?.userRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.placeRef == e2?.placeRef &&
        e1?.visitRef == e2?.visitRef &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.usersLiked, e2?.usersLiked) &&
        listEquality.equals(e1?.postImages, e2?.postImages);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.description,
        e?.userRef,
        e?.eventRef,
        e?.placeRef,
        e?.visitRef,
        e?.images,
        e?.status,
        e?.usersLiked,
        e?.postImages
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
