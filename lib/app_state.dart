import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _customLocation = prefs.getBool('ff_customLocation') ?? _customLocation;
    });
    _safeInit(() {
      _customLocationLatLng =
          latLngFromString(prefs.getString('ff_customLocationLatLng')) ??
              _customLocationLatLng;
    });
    _safeInit(() {
      _customLocationText =
          prefs.getString('ff_customLocationText') ?? _customLocationText;
    });
    _safeInit(() {
      _searchDistance = prefs.getInt('ff_searchDistance') ?? _searchDistance;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _customLocation = false;
  bool get customLocation => _customLocation;
  set customLocation(bool value) {
    _customLocation = value;
    prefs.setBool('ff_customLocation', value);
  }

  LatLng? _customLocationLatLng = const LatLng(-23.5557714, -46.6395571);
  LatLng? get customLocationLatLng => _customLocationLatLng;
  set customLocationLatLng(LatLng? value) {
    _customLocationLatLng = value;
    value != null
        ? prefs.setString('ff_customLocationLatLng', value.serialize())
        : prefs.remove('ff_customLocationLatLng');
  }

  String _customLocationText = 'Endereço';
  String get customLocationText => _customLocationText;
  set customLocationText(String value) {
    _customLocationText = value;
    prefs.setString('ff_customLocationText', value);
  }

  int _searchDistance = 50;
  int get searchDistance => _searchDistance;
  set searchDistance(int value) {
    _searchDistance = value;
    prefs.setInt('ff_searchDistance', value);
  }

  final _placeCategoriesManager =
      StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> placeCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _placeCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlaceCategoriesCache() => _placeCategoriesManager.clear();
  void clearPlaceCategoriesCacheKey(String? uniqueKey) =>
      _placeCategoriesManager.clearRequest(uniqueKey);

  final _placedPlacesManager = FutureRequestManager<List<PlacesRecord>>();
  Future<List<PlacesRecord>> placedPlaces({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PlacesRecord>> Function() requestFn,
  }) =>
      _placedPlacesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlacedPlacesCache() => _placedPlacesManager.clear();
  void clearPlacedPlacesCacheKey(String? uniqueKey) =>
      _placedPlacesManager.clearRequest(uniqueKey);

  final _placedEventsManager = FutureRequestManager<List<EventsRecord>>();
  Future<List<EventsRecord>> placedEvents({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventsRecord>> Function() requestFn,
  }) =>
      _placedEventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlacedEventsCache() => _placedEventsManager.clear();
  void clearPlacedEventsCacheKey(String? uniqueKey) =>
      _placedEventsManager.clearRequest(uniqueKey);

  final _userImagesManager = StreamRequestManager<List<UserImagesRecord>>();
  Stream<List<UserImagesRecord>> userImages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserImagesRecord>> Function() requestFn,
  }) =>
      _userImagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserImagesCache() => _userImagesManager.clear();
  void clearUserImagesCacheKey(String? uniqueKey) =>
      _userImagesManager.clearRequest(uniqueKey);

  final _eventImageManager = StreamRequestManager<List<EventImagesRecord>>();
  Stream<List<EventImagesRecord>> eventImage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventImagesRecord>> Function() requestFn,
  }) =>
      _eventImageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventImageCache() => _eventImageManager.clear();
  void clearEventImageCacheKey(String? uniqueKey) =>
      _eventImageManager.clearRequest(uniqueKey);

  final _placedUsersManager = FutureRequestManager<List<UsersRecord>>();
  Future<List<UsersRecord>> placedUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRecord>> Function() requestFn,
  }) =>
      _placedUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlacedUsersCache() => _placedUsersManager.clear();
  void clearPlacedUsersCacheKey(String? uniqueKey) =>
      _placedUsersManager.clearRequest(uniqueKey);

  final _userImagesCountManager = FutureRequestManager<int>();
  Future<int> userImagesCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _userImagesCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserImagesCountCache() => _userImagesCountManager.clear();
  void clearUserImagesCountCacheKey(String? uniqueKey) =>
      _userImagesCountManager.clearRequest(uniqueKey);

  final _eventDocManager = StreamRequestManager<EventsRecord>();
  Stream<EventsRecord> eventDoc({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<EventsRecord> Function() requestFn,
  }) =>
      _eventDocManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventDocCache() => _eventDocManager.clear();
  void clearEventDocCacheKey(String? uniqueKey) =>
      _eventDocManager.clearRequest(uniqueKey);

  final _placeDocManager = StreamRequestManager<PlacesRecord>();
  Stream<PlacesRecord> placeDoc({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<PlacesRecord> Function() requestFn,
  }) =>
      _placeDocManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlaceDocCache() => _placeDocManager.clear();
  void clearPlaceDocCacheKey(String? uniqueKey) =>
      _placeDocManager.clearRequest(uniqueKey);

  final _eventImagesManager = StreamRequestManager<List<EventImagesRecord>>();
  Stream<List<EventImagesRecord>> eventImages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventImagesRecord>> Function() requestFn,
  }) =>
      _eventImagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventImagesCache() => _eventImagesManager.clear();
  void clearEventImagesCacheKey(String? uniqueKey) =>
      _eventImagesManager.clearRequest(uniqueKey);

  final _productCategoriesManager =
      StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> productCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _productCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductCategoriesCache() => _productCategoriesManager.clear();
  void clearProductCategoriesCacheKey(String? uniqueKey) =>
      _productCategoriesManager.clearRequest(uniqueKey);

  final _userVisitsCountManager = FutureRequestManager<int>();
  Future<int> userVisitsCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _userVisitsCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserVisitsCountCache() => _userVisitsCountManager.clear();
  void clearUserVisitsCountCacheKey(String? uniqueKey) =>
      _userVisitsCountManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
