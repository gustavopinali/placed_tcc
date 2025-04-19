import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLocationsRecord extends FirestoreRecord {
  UserLocationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userLocations')
          : FirebaseFirestore.instance.collectionGroup('userLocations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userLocations').doc(id);

  static Stream<UserLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLocationsRecord.fromSnapshot(s));

  static Future<UserLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLocationsRecord.fromSnapshot(s));

  static UserLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLocationsRecordData({
  LatLng? location,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserLocationsRecordDocumentEquality
    implements Equality<UserLocationsRecord> {
  const UserLocationsRecordDocumentEquality();

  @override
  bool equals(UserLocationsRecord? e1, UserLocationsRecord? e2) {
    return e1?.location == e2?.location && e1?.date == e2?.date;
  }

  @override
  int hash(UserLocationsRecord? e) =>
      const ListEquality().hash([e?.location, e?.date]);

  @override
  bool isValidKey(Object? o) => o is UserLocationsRecord;
}
