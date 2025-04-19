// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventStatusStruct extends FFFirebaseStruct {
  EventStatusStruct({
    bool? active,
    bool? public,
    bool? draft,
    bool? searchable,
    bool? finished,
    bool? placed,
    DateTime? createdAt,
    DocumentReference? createdBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _public = public,
        _draft = draft,
        _searchable = searchable,
        _finished = finished,
        _placed = placed,
        _createdAt = createdAt,
        _createdBy = createdBy,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  set public(bool? val) => _public = val;

  bool hasPublic() => _public != null;

  // "draft" field.
  bool? _draft;
  bool get draft => _draft ?? true;
  set draft(bool? val) => _draft = val;

  bool hasDraft() => _draft != null;

  // "searchable" field.
  bool? _searchable;
  bool get searchable => _searchable ?? true;
  set searchable(bool? val) => _searchable = val;

  bool hasSearchable() => _searchable != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  set finished(bool? val) => _finished = val;

  bool hasFinished() => _finished != null;

  // "placed" field.
  bool? _placed;
  bool get placed => _placed ?? false;
  set placed(bool? val) => _placed = val;

  bool hasPlaced() => _placed != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  static EventStatusStruct fromMap(Map<String, dynamic> data) =>
      EventStatusStruct(
        active: data['active'] as bool?,
        public: data['public'] as bool?,
        draft: data['draft'] as bool?,
        searchable: data['searchable'] as bool?,
        finished: data['finished'] as bool?,
        placed: data['placed'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
        createdBy: data['createdBy'] as DocumentReference?,
      );

  static EventStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? EventStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'public': _public,
        'draft': _draft,
        'searchable': _searchable,
        'finished': _finished,
        'placed': _placed,
        'createdAt': _createdAt,
        'createdBy': _createdBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'public': serializeParam(
          _public,
          ParamType.bool,
        ),
        'draft': serializeParam(
          _draft,
          ParamType.bool,
        ),
        'searchable': serializeParam(
          _searchable,
          ParamType.bool,
        ),
        'finished': serializeParam(
          _finished,
          ParamType.bool,
        ),
        'placed': serializeParam(
          _placed,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static EventStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStatusStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        public: deserializeParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        draft: deserializeParam(
          data['draft'],
          ParamType.bool,
          false,
        ),
        searchable: deserializeParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        finished: deserializeParam(
          data['finished'],
          ParamType.bool,
          false,
        ),
        placed: deserializeParam(
          data['placed'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static EventStatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventStatusStruct(
        active: convertAlgoliaParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        public: convertAlgoliaParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        draft: convertAlgoliaParam(
          data['draft'],
          ParamType.bool,
          false,
        ),
        searchable: convertAlgoliaParam(
          data['searchable'],
          ParamType.bool,
          false,
        ),
        finished: convertAlgoliaParam(
          data['finished'],
          ParamType.bool,
          false,
        ),
        placed: convertAlgoliaParam(
          data['placed'],
          ParamType.bool,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventStatusStruct &&
        active == other.active &&
        public == other.public &&
        draft == other.draft &&
        searchable == other.searchable &&
        finished == other.finished &&
        placed == other.placed &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        active,
        public,
        draft,
        searchable,
        finished,
        placed,
        createdAt,
        createdBy
      ]);
}

EventStatusStruct createEventStatusStruct({
  bool? active,
  bool? public,
  bool? draft,
  bool? searchable,
  bool? finished,
  bool? placed,
  DateTime? createdAt,
  DocumentReference? createdBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStatusStruct(
      active: active,
      public: public,
      draft: draft,
      searchable: searchable,
      finished: finished,
      placed: placed,
      createdAt: createdAt,
      createdBy: createdBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventStatusStruct? updateEventStatusStruct(
  EventStatusStruct? eventStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventStatusStructData(
  Map<String, dynamic> firestoreData,
  EventStatusStruct? eventStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventStatus == null) {
    return;
  }
  if (eventStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventStatusData =
      getEventStatusFirestoreData(eventStatus, forFieldValue);
  final nestedData =
      eventStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventStatusFirestoreData(
  EventStatusStruct? eventStatus, [
  bool forFieldValue = false,
]) {
  if (eventStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventStatus.toMap());

  // Add any Firestore field values
  eventStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventStatusListFirestoreData(
  List<EventStatusStruct>? eventStatuss,
) =>
    eventStatuss?.map((e) => getEventStatusFirestoreData(e, true)).toList() ??
    [];
