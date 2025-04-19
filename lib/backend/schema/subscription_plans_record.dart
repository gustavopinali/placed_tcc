import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionPlansRecord extends FirestoreRecord {
  SubscriptionPlansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  TextStruct? _name;
  TextStruct get name => _name ?? TextStruct();
  bool hasName() => _name != null;

  // "place" field.
  bool? _place;
  bool get place => _place ?? false;
  bool hasPlace() => _place != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "stripe" field.
  bool? _stripe;
  bool get stripe => _stripe ?? false;
  bool hasStripe() => _stripe != null;

  // "stripePlanId" field.
  String? _stripePlanId;
  String get stripePlanId => _stripePlanId ?? '';
  bool hasStripePlanId() => _stripePlanId != null;

  // "stripeProductId" field.
  String? _stripeProductId;
  String get stripeProductId => _stripeProductId ?? '';
  bool hasStripeProductId() => _stripeProductId != null;

  // "features" field.
  List<TextStruct>? _features;
  List<TextStruct> get features => _features ?? const [];
  bool hasFeatures() => _features != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "title" field.
  TextStruct? _title;
  TextStruct get title => _title ?? TextStruct();
  bool hasTitle() => _title != null;

  // "subtitle" field.
  TextStruct? _subtitle;
  TextStruct get subtitle => _subtitle ?? TextStruct();
  bool hasSubtitle() => _subtitle != null;

  void _initializeFields() {
    _name = TextStruct.maybeFromMap(snapshotData['name']);
    _place = snapshotData['place'] as bool?;
    _event = snapshotData['event'] as bool?;
    _active = snapshotData['active'] as bool?;
    _level = castToType<int>(snapshotData['level']);
    _order = castToType<int>(snapshotData['order']);
    _stripe = snapshotData['stripe'] as bool?;
    _stripePlanId = snapshotData['stripePlanId'] as String?;
    _stripeProductId = snapshotData['stripeProductId'] as String?;
    _features = getStructList(
      snapshotData['features'],
      TextStruct.fromMap,
    );
    _value = castToType<double>(snapshotData['value']);
    _title = TextStruct.maybeFromMap(snapshotData['title']);
    _subtitle = TextStruct.maybeFromMap(snapshotData['subtitle']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptionPlans');

  static Stream<SubscriptionPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionPlansRecord.fromSnapshot(s));

  static Future<SubscriptionPlansRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubscriptionPlansRecord.fromSnapshot(s));

  static SubscriptionPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionPlansRecordData({
  TextStruct? name,
  bool? place,
  bool? event,
  bool? active,
  int? level,
  int? order,
  bool? stripe,
  String? stripePlanId,
  String? stripeProductId,
  double? value,
  TextStruct? title,
  TextStruct? subtitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': TextStruct().toMap(),
      'place': place,
      'event': event,
      'active': active,
      'level': level,
      'order': order,
      'stripe': stripe,
      'stripePlanId': stripePlanId,
      'stripeProductId': stripeProductId,
      'value': value,
      'title': TextStruct().toMap(),
      'subtitle': TextStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "name" field.
  addTextStructData(firestoreData, name, 'name');

  // Handle nested data for "title" field.
  addTextStructData(firestoreData, title, 'title');

  // Handle nested data for "subtitle" field.
  addTextStructData(firestoreData, subtitle, 'subtitle');

  return firestoreData;
}

class SubscriptionPlansRecordDocumentEquality
    implements Equality<SubscriptionPlansRecord> {
  const SubscriptionPlansRecordDocumentEquality();

  @override
  bool equals(SubscriptionPlansRecord? e1, SubscriptionPlansRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.place == e2?.place &&
        e1?.event == e2?.event &&
        e1?.active == e2?.active &&
        e1?.level == e2?.level &&
        e1?.order == e2?.order &&
        e1?.stripe == e2?.stripe &&
        e1?.stripePlanId == e2?.stripePlanId &&
        e1?.stripeProductId == e2?.stripeProductId &&
        listEquality.equals(e1?.features, e2?.features) &&
        e1?.value == e2?.value &&
        e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle;
  }

  @override
  int hash(SubscriptionPlansRecord? e) => const ListEquality().hash([
        e?.name,
        e?.place,
        e?.event,
        e?.active,
        e?.level,
        e?.order,
        e?.stripe,
        e?.stripePlanId,
        e?.stripeProductId,
        e?.features,
        e?.value,
        e?.title,
        e?.subtitle
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionPlansRecord;
}
