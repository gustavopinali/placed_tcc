import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Placed.gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'ChatMain': ParameterData.none(),
  'chatDetails': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'changePassword': (data) async => ParameterData(
        allParams: {
          'userProfile': await getDocumentParameter<UsersRecord>(
              data, 'userProfile', UsersRecord.fromSnapshot),
        },
      ),
  'Notifications': ParameterData.none(),
  'Dashboard': ParameterData.none(),
  'Place': (data) async {
    final allParams = {
      'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
    };
    return ParameterData(
      requiredParams: {
        'placeRef': serializeParam(
          allParams['placeRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'Event': (data) async {
    final allParams = {
      'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
      'tabIndex': getParameter<int>(data, 'tabIndex'),
    };
    return ParameterData(
      requiredParams: {
        'eventRef': serializeParam(
          allParams['eventRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'Checkout': (data) async {
    final allParams = {
      'checkoutRef': getParameter<DocumentReference>(data, 'checkoutRef'),
    };
    return ParameterData(
      requiredParams: {
        'checkoutRef': serializeParam(
          allParams['checkoutRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'User': (data) async {
    final allParams = {
      'userRef': getParameter<DocumentReference>(data, 'userRef'),
    };
    return ParameterData(
      requiredParams: {
        'userRef': serializeParam(
          allParams['userRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'Relationships': ParameterData.none(),
  'EditEvent': (data) async => ParameterData(
        allParams: {
          'eventDoc': await getDocumentParameter<EventsRecord>(
              data, 'eventDoc', EventsRecord.fromSnapshot),
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'SignUp': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'SeviceTerms': ParameterData.none(),
  'DeleteAccount': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'Visit': ParameterData.none(),
  'Profile': ParameterData.none(),
  'ProfileEdit': ParameterData.none(),
  'CreateSubscriptions': ParameterData.none(),
  'Subscription': (data) async => ParameterData(
        allParams: {
          'placeDoc': await getDocumentParameter<PlacesRecord>(
              data, 'placeDoc', PlacesRecord.fromSnapshot),
          'subPlaceDoc': await getDocumentParameter<PlaceSubscriptionRecord>(
              data, 'subPlaceDoc', PlaceSubscriptionRecord.fromSnapshot),
        },
      ),
  'SubscriptionCopy': ParameterData.none(),
  'Posts': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'Cart': (data) async => ParameterData(
        allParams: {
          'visitRef': getParameter<DocumentReference>(data, 'visitRef'),
        },
      ),
  'ProductDetails': (data) async => ParameterData(
        allParams: {
          'stripeProductRef':
              getParameter<DocumentReference>(data, 'stripeProductRef'),
        },
      ),
  'PlaceMenu': (data) async {
    final allParams = {
      'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
    };
    return ParameterData(
      requiredParams: {
        'placeRef': serializeParam(
          allParams['placeRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'CreateProduct': ParameterData.none(),
  'StartPage': ParameterData.none(),
  'LogIn': ParameterData.none(),
  'CreateEvent': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
