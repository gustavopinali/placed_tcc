import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "price" field.
  DocumentReference? _price;
  DocumentReference? get price => _price;
  bool hasPrice() => _price != null;

  // "prices" field.
  List<DocumentReference>? _prices;
  List<DocumentReference> get prices => _prices ?? const [];
  bool hasPrices() => _prices != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "stripeLink" field.
  String? _stripeLink;
  String get stripeLink => _stripeLink ?? '';
  bool hasStripeLink() => _stripeLink != null;

  // "cancel_at" field.
  DateTime? _cancelAt;
  DateTime? get cancelAt => _cancelAt;
  bool hasCancelAt() => _cancelAt != null;

  // "cancel_at_period_end" field.
  bool? _cancelAtPeriodEnd;
  bool get cancelAtPeriodEnd => _cancelAtPeriodEnd ?? false;
  bool hasCancelAtPeriodEnd() => _cancelAtPeriodEnd != null;

  // "canceled_at" field.
  DateTime? _canceledAt;
  DateTime? get canceledAt => _canceledAt;
  bool hasCanceledAt() => _canceledAt != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "current_period_start" field.
  DateTime? _currentPeriodStart;
  DateTime? get currentPeriodStart => _currentPeriodStart;
  bool hasCurrentPeriodStart() => _currentPeriodStart != null;

  // "current_period_end" field.
  DateTime? _currentPeriodEnd;
  DateTime? get currentPeriodEnd => _currentPeriodEnd;
  bool hasCurrentPeriodEnd() => _currentPeriodEnd != null;

  // "ended_at" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  bool hasEndedAt() => _endedAt != null;

  // "trial_start" field.
  DateTime? _trialStart;
  DateTime? get trialStart => _trialStart;
  bool hasTrialStart() => _trialStart != null;

  // "trial_end" field.
  DateTime? _trialEnd;
  DateTime? get trialEnd => _trialEnd;
  bool hasTrialEnd() => _trialEnd != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "metadata" field.
  StripeSubscriptionDataStruct? _metadata;
  StripeSubscriptionDataStruct get metadata =>
      _metadata ?? StripeSubscriptionDataStruct();
  bool hasMetadata() => _metadata != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _product = snapshotData['product'] as DocumentReference?;
    _price = snapshotData['price'] as DocumentReference?;
    _prices = getDataList(snapshotData['prices']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _status = snapshotData['status'] as String?;
    _stripeLink = snapshotData['stripeLink'] as String?;
    _cancelAt = snapshotData['cancel_at'] as DateTime?;
    _cancelAtPeriodEnd = snapshotData['cancel_at_period_end'] as bool?;
    _canceledAt = snapshotData['canceled_at'] as DateTime?;
    _created = snapshotData['created'] as DateTime?;
    _currentPeriodStart = snapshotData['current_period_start'] as DateTime?;
    _currentPeriodEnd = snapshotData['current_period_end'] as DateTime?;
    _endedAt = snapshotData['ended_at'] as DateTime?;
    _trialStart = snapshotData['trial_start'] as DateTime?;
    _trialEnd = snapshotData['trial_end'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _metadata =
        StripeSubscriptionDataStruct.maybeFromMap(snapshotData['metadata']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subscriptions')
          : FirebaseFirestore.instance.collectionGroup('subscriptions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('subscriptions').doc(id);

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  DocumentReference? product,
  DocumentReference? price,
  int? quantity,
  String? status,
  String? stripeLink,
  DateTime? cancelAt,
  bool? cancelAtPeriodEnd,
  DateTime? canceledAt,
  DateTime? created,
  DateTime? currentPeriodStart,
  DateTime? currentPeriodEnd,
  DateTime? endedAt,
  DateTime? trialStart,
  DateTime? trialEnd,
  String? role,
  StripeSubscriptionDataStruct? metadata,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product': product,
      'price': price,
      'quantity': quantity,
      'status': status,
      'stripeLink': stripeLink,
      'cancel_at': cancelAt,
      'cancel_at_period_end': cancelAtPeriodEnd,
      'canceled_at': canceledAt,
      'created': created,
      'current_period_start': currentPeriodStart,
      'current_period_end': currentPeriodEnd,
      'ended_at': endedAt,
      'trial_start': trialStart,
      'trial_end': trialEnd,
      'role': role,
      'metadata': StripeSubscriptionDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "metadata" field.
  addStripeSubscriptionDataStructData(firestoreData, metadata, 'metadata');

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.product == e2?.product &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.prices, e2?.prices) &&
        e1?.quantity == e2?.quantity &&
        e1?.status == e2?.status &&
        e1?.stripeLink == e2?.stripeLink &&
        e1?.cancelAt == e2?.cancelAt &&
        e1?.cancelAtPeriodEnd == e2?.cancelAtPeriodEnd &&
        e1?.canceledAt == e2?.canceledAt &&
        e1?.created == e2?.created &&
        e1?.currentPeriodStart == e2?.currentPeriodStart &&
        e1?.currentPeriodEnd == e2?.currentPeriodEnd &&
        e1?.endedAt == e2?.endedAt &&
        e1?.trialStart == e2?.trialStart &&
        e1?.trialEnd == e2?.trialEnd &&
        e1?.role == e2?.role &&
        e1?.metadata == e2?.metadata;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.product,
        e?.price,
        e?.prices,
        e?.quantity,
        e?.status,
        e?.stripeLink,
        e?.cancelAt,
        e?.cancelAtPeriodEnd,
        e?.canceledAt,
        e?.created,
        e?.currentPeriodStart,
        e?.currentPeriodEnd,
        e?.endedAt,
        e?.trialStart,
        e?.trialEnd,
        e?.role,
        e?.metadata
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
