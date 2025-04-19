import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userData" field.
  UserDataStruct? _userData;
  UserDataStruct get userData => _userData ?? UserDataStruct();
  bool hasUserData() => _userData != null;

  // "userConfig" field.
  UserConfigStruct? _userConfig;
  UserConfigStruct get userConfig => _userConfig ?? UserConfigStruct();
  bool hasUserConfig() => _userConfig != null;

  // "userStatus" field.
  UserStatusStruct? _userStatus;
  UserStatusStruct get userStatus => _userStatus ?? UserStatusStruct();
  bool hasUserStatus() => _userStatus != null;

  // "userInterests" field.
  UserInterestsStruct? _userInterests;
  UserInterestsStruct get userInterests =>
      _userInterests ?? UserInterestsStruct();
  bool hasUserInterests() => _userInterests != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "dataNasc" field.
  DateTime? _dataNasc;
  DateTime? get dataNasc => _dataNasc;
  bool hasDataNasc() => _dataNasc != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "userLinks" field.
  UserLinksStruct? _userLinks;
  UserLinksStruct get userLinks => _userLinks ?? UserLinksStruct();
  bool hasUserLinks() => _userLinks != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userData = UserDataStruct.maybeFromMap(snapshotData['userData']);
    _userConfig = UserConfigStruct.maybeFromMap(snapshotData['userConfig']);
    _userStatus = UserStatusStruct.maybeFromMap(snapshotData['userStatus']);
    _userInterests =
        UserInterestsStruct.maybeFromMap(snapshotData['userInterests']);
    _location = snapshotData['location'] as LatLng?;
    _active = snapshotData['active'] as bool?;
    _dataNasc = snapshotData['dataNasc'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _userLinks = UserLinksStruct.maybeFromMap(snapshotData['userLinks']);
    _username = snapshotData['username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'userData':
              UserDataStruct.fromAlgoliaData(snapshot.data['userData'] ?? {})
                  .toMap(),
          'userConfig': UserConfigStruct.fromAlgoliaData(
                  snapshot.data['userConfig'] ?? {})
              .toMap(),
          'userStatus': UserStatusStruct.fromAlgoliaData(
                  snapshot.data['userStatus'] ?? {})
              .toMap(),
          'userInterests': UserInterestsStruct.fromAlgoliaData(
                  snapshot.data['userInterests'] ?? {})
              .toMap(),
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'active': snapshot.data['active'],
          'dataNasc': convertAlgoliaParam(
            snapshot.data['dataNasc'],
            ParamType.DateTime,
            false,
          ),
          'shortDescription': snapshot.data['shortDescription'],
          'last_active_time': convertAlgoliaParam(
            snapshot.data['last_active_time'],
            ParamType.DateTime,
            false,
          ),
          'userLinks':
              UserLinksStruct.fromAlgoliaData(snapshot.data['userLinks'] ?? {})
                  .toMap(),
          'username': snapshot.data['username'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  UserDataStruct? userData,
  UserConfigStruct? userConfig,
  UserStatusStruct? userStatus,
  UserInterestsStruct? userInterests,
  LatLng? location,
  bool? active,
  DateTime? dataNasc,
  String? shortDescription,
  DateTime? lastActiveTime,
  UserLinksStruct? userLinks,
  String? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userData': UserDataStruct().toMap(),
      'userConfig': UserConfigStruct().toMap(),
      'userStatus': UserStatusStruct().toMap(),
      'userInterests': UserInterestsStruct().toMap(),
      'location': location,
      'active': active,
      'dataNasc': dataNasc,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'userLinks': UserLinksStruct().toMap(),
      'username': username,
    }.withoutNulls,
  );

  // Handle nested data for "userData" field.
  addUserDataStructData(firestoreData, userData, 'userData');

  // Handle nested data for "userConfig" field.
  addUserConfigStructData(firestoreData, userConfig, 'userConfig');

  // Handle nested data for "userStatus" field.
  addUserStatusStructData(firestoreData, userStatus, 'userStatus');

  // Handle nested data for "userInterests" field.
  addUserInterestsStructData(firestoreData, userInterests, 'userInterests');

  // Handle nested data for "userLinks" field.
  addUserLinksStructData(firestoreData, userLinks, 'userLinks');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userData == e2?.userData &&
        e1?.userConfig == e2?.userConfig &&
        e1?.userStatus == e2?.userStatus &&
        e1?.userInterests == e2?.userInterests &&
        e1?.location == e2?.location &&
        e1?.active == e2?.active &&
        e1?.dataNasc == e2?.dataNasc &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.userLinks == e2?.userLinks &&
        e1?.username == e2?.username;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userData,
        e?.userConfig,
        e?.userStatus,
        e?.userInterests,
        e?.location,
        e?.active,
        e?.dataNasc,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.userLinks,
        e?.username
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
