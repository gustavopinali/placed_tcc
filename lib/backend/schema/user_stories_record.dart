import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStoriesRecord extends FirestoreRecord {
  UserStoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagePath = snapshotData['imagePath'] as String?;
    _videoPath = snapshotData['videoPath'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userStories')
          : FirebaseFirestore.instance.collectionGroup('userStories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userStories').doc(id);

  static Stream<UserStoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserStoriesRecord.fromSnapshot(s));

  static Future<UserStoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserStoriesRecord.fromSnapshot(s));

  static UserStoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserStoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserStoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserStoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserStoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserStoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserStoriesRecordData({
  String? imagePath,
  String? videoPath,
  bool? active,
  DateTime? createdAt,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagePath': imagePath,
      'videoPath': videoPath,
      'active': active,
      'createdAt': createdAt,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserStoriesRecordDocumentEquality implements Equality<UserStoriesRecord> {
  const UserStoriesRecordDocumentEquality();

  @override
  bool equals(UserStoriesRecord? e1, UserStoriesRecord? e2) {
    return e1?.imagePath == e2?.imagePath &&
        e1?.videoPath == e2?.videoPath &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.location == e2?.location;
  }

  @override
  int hash(UserStoriesRecord? e) => const ListEquality()
      .hash([e?.imagePath, e?.videoPath, e?.active, e?.createdAt, e?.location]);

  @override
  bool isValidKey(Object? o) => o is UserStoriesRecord;
}
