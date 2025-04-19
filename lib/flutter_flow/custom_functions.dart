import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkUserVisitActive(VisitsRecord visit) {
  if (visit.checkIn && !visit.checkOut) {
    return true;
  } else {
    return false;
  }
}

String txtDistanceValue(
  LatLng locationTarget,
  LatLng locationBase,
) {
  double lat1 = locationTarget.latitude;
  double lat2 = locationBase.latitude;

  double lon1 = locationTarget.longitude;
  double lon2 = locationBase.longitude;

  double p = 0.017453292519943295;
  double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;
  double distance = 12742 * math.asin(math.sqrt(a));

  if (distance > 100)
    return "+100";
  else
    return distance.toStringAsFixed(1);
}

bool checkUserDistanceToPlace(
  LatLng placeLocation,
  LatLng userLocation,
) {
  double lat1 = placeLocation.latitude;
  double lat2 = userLocation.latitude;
  double lon1 = placeLocation.longitude;
  double lon2 = userLocation.longitude;

  double p = 0.017453292519943295;
  double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;
  num distance = 12742 * math.asin(math.sqrt(a));

  return distance <= 1;
}

double getDistanceValue(
  LatLng locationTarget,
  LatLng locationBase,
) {
  double lat1 = locationTarget.latitude;
  double lat2 = locationBase.latitude;

  double lon1 = locationTarget.longitude;
  double lon2 = locationBase.longitude;

  double p = 0.017453292519943295;
  double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;
  return 12742 * math.asin(math.sqrt(a));
}

bool? searchEventsResult(
  String input,
  EventsRecord event,
) {
  return event.name.toLowerCase().contains(input.toLowerCase());
}

bool compareCategoryList(
  List<DocumentReference> listObjects,
  List<DocumentReference> listCheck,
) {
  if (listCheck.isEmpty) return true;

  for (DocumentReference category in listObjects) {
    if (listCheck.contains(category)) return true;
  }

  return false;
}

DocumentReference convertStringToPlaceRef(String googlePlace) {
  return FirebaseFirestore.instance.collection('places').doc(googlePlace);
}

LatLng createLatLong(
  double latitude,
  double longitude,
) {
  return new LatLng(latitude, longitude);
}

DocumentReference checkUserLikeRef(
  String userRef,
  String userLikeRef,
) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userRef)
      .collection('userLikes')
      .doc(userLikeRef);
}

String? imageStripeFromList(
  List<String> imageList,
  int index,
) {
  if (imageList.length > index) {
    return imageList[index];
  } else
    return null;
}

bool checkLatLongNotNull(LatLng location) {
  try {
    return !(location.latitude == 0 && location.longitude == 0);
  } catch (e) {
    return false;
  }
}

int stringToStripeAmount(String value) {
  double d = double.parse(value.replaceAll(',', '.'));
  String s = d.toStringAsFixed(2).replaceAll('.', '');
  return int.parse(s);
}

double stripeAmountToDouble(int stripeAmount) {
  return (stripeAmount / 100).toDouble();
}

bool comprareString(
  String stringA,
  String stringB,
) {
  return stringA == stringB;
}

String convertToUTF8(String text) {
  List<int> encoded = utf8.encode(text);
  String decoded = utf8.decode(encoded);
  return decoded;
}

DocumentReference? getStripeCustomerByUserRef(DocumentReference userRef) {
  return FirebaseFirestore.instance.collection('events').doc(userRef.id);
}

DocumentReference? qrcodeToEventRef(String qrcode) {
  String placed = qrcode.split('_')[0];

  if (placed != "placed") return null;

  String type = qrcode.split('_')[1];
  String ref = qrcode.split('_')[2];

  if (type == "event") {
    return FirebaseFirestore.instance.collection('events').doc(ref);
  } else {
    return null;
  }
}

bool? comparePlaceInList(
  List<PlacesRecord> list,
  PlacesRecord document,
) {
  return list.contains(document);
}

bool? searchStringInString(
  String stringA,
  String stringB,
) {
  if (stringA == '') return true;

  return (stringB.toLowerCase().contains(stringA.toLowerCase()));
}

List<DocumentReference> listUserRef(
  DocumentReference userA,
  DocumentReference userB,
) {
  List<DocumentReference> list = List.empty();
  list.add(userA);
  list.add(userB);

  return list;
}

DocumentReference? qrcodeToPlaceRef(String qrcode) {
  String placed = qrcode.split('_')[0];

  if (placed != "placed") return null;

  String type = qrcode.split('_')[1];
  String ref = qrcode.split('_')[2];

  if (type == "place") {
    return FirebaseFirestore.instance.collection('places').doc(ref);
  } else {
    return null;
  }
}

DateTime visitRecentTime(DateTime currentTime) {
  return currentTime.subtract(Duration(hours: 6));
}

int getUserAge(DateTime userBirthDate) {
  return (DateTime.now().difference(userBirthDate).inDays / 365).round();
}

String stripeAmountToString(int stripeAmount) {
  String s = (stripeAmount / 100).toStringAsFixed(2);

  return s;
}

int subtractValueNotNegative(
  int valueA,
  int valueB,
) {
  int total = valueA - valueB;
  if (total < 0)
    return 0;
  else
    return total;
}

int doubleToInt(double value) {
  return value.round();
}

String latLongToString(LatLng location) {
  return location.latitude.toString() + "," + location.longitude.toString();
}

bool checkStringInString(
  String stringA,
  String stringB,
) {
  if (stringA.isEmpty) return true;
  if (stringB.isEmpty) return false;

  String comAcentos = "äáâàãéêëèíîïìöóôòõüúûùç";
  String semAcentos = "aaaaaeeeeiiiiooooouuuuc";

  stringA = stringA.toLowerCase();
  stringB = stringB.toLowerCase();

  for (int i = 0; i < comAcentos.length; i++) {
    stringA =
        stringA.replaceAll(comAcentos[i].toString(), semAcentos[i].toString());
    stringB =
        stringB.replaceAll(comAcentos[i].toString(), semAcentos[i].toString());
  }

  return stringB.contains(stringA);
}

int getSliderValueToInt(double sliderValue) {
  return sliderValue.toInt();
}

int getSearchRadius(int? value) {
  return value != null ? value * 1000 : 50000;
}

bool? checkDateToday(DateTime checkDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  DateTime check = DateTime(checkDate.year, checkDate.month, checkDate.day);

  return check == today;
}

double? stripeAddCartTotal(
  int quantity,
  double price,
) {
  return quantity * price;
}

int? countPlaceImages(DocumentReference placeRef) {
  int? count = 0;

  FirebaseFirestore.instance
      .collection('places')
      .doc(placeRef.id)
      .collection("placeImages")
      .where("active", isEqualTo: true)
      .count()
      .get()
      .then((res) => count = res.count);

  return count;
}
