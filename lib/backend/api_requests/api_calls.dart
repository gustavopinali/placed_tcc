import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'PlacedAPI';

/// Start Stripe Group Code

class StripeGroup {
  static CreateCheckoutSessionSubscriptionCall
      createCheckoutSessionSubscriptionCall =
      CreateCheckoutSessionSubscriptionCall();
  static GetAllPlansCall getAllPlansCall = GetAllPlansCall();
  static GetPlanCall getPlanCall = GetPlanCall();
  static GetProductCall getProductCall = GetProductCall();
  static CreateSubscriptionCall createSubscriptionCall =
      CreateSubscriptionCall();
  static GetSubscriptionCall getSubscriptionCall = GetSubscriptionCall();
  static UpdateSubscriptionCall updateSubscriptionCall =
      UpdateSubscriptionCall();
  static GetCheckoutCall getCheckoutCall = GetCheckoutCall();
}

class CreateCheckoutSessionSubscriptionCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? successUrl = '',
    String? userRef = '',
    String? placeRef = '',
    String? checkoutRef = '',
    String? customer = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateCheckoutSessionSubscriptionCall',
        'variables': {
          'productId': productId,
          'successUrl': successUrl,
          'userRef': userRef,
          'placeRef': placeRef,
          'checkoutRef': checkoutRef,
          'customer': customer,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? checkoutId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? paymentStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_status''',
      ));
  String? checkoutUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  String? customer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer_details.email''',
      ));
  int? expiresAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expires_at''',
      ));
  String? successUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.success_url''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? checkoutRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.checkoutRef''',
      ));
  String? placeRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.placeRef''',
      ));
  String? userRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.userRef''',
      ));
  String? mode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mode''',
      ));
  int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
}

class GetAllPlansCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetAllPlansCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? planIdList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? productIdList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product''',
        true,
      ) as List?;
  List? amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].amount''',
        true,
      ) as List?;
  List? active(dynamic response) => getJsonField(
        response,
        r'''$.data[:].active''',
        true,
      ) as List?;
  List? planType(dynamic response) => getJsonField(
        response,
        r'''$.data[:].object''',
        true,
      ) as List?;
  List? planDataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetPlanCall {
  Future<ApiCallResponse> call({
    String? planId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetPlanCall',
        'variables': {
          'planId': planId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic active(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic value(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
  dynamic producId(dynamic response) => getJsonField(
        response,
        r'''$.product''',
      );
  dynamic interval(dynamic response) => getJsonField(
        response,
        r'''$.interval''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.currency''',
      );
}

class GetProductCall {
  Future<ApiCallResponse> call({
    String? productId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetProductCall',
        'variables': {
          'productId': productId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic active(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  List? images(dynamic response) => getJsonField(
        response,
        r'''$.images''',
        true,
      ) as List?;
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.type''',
      );
}

class CreateSubscriptionCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? price = '',
    String? subRef = '',
    String? subPlaceRef = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateSubscriptionCall',
        'variables': {
          'customer': customer,
          'price': price,
          'subRef': subRef,
          'subPlaceRef': subPlaceRef,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetSubscriptionCall {
  Future<ApiCallResponse> call({
    String? subId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetSubscriptionCall',
        'variables': {
          'subId': subId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? subStripeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? paymentMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.default_payment_method''',
      ));
  int? periodEnd(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current_period_end''',
      ));
  int? periodStart(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current_period_start''',
      ));
  int? created(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  dynamic subRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subRef''',
      );
  dynamic subPlaceRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subPlaceRef''',
      );
  dynamic subCheckoutRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subCheckoutRef''',
      );
}

class UpdateSubscriptionCall {
  Future<ApiCallResponse> call({
    String? subId = '',
    String? subRef = '',
    String? subPlaceRef = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UpdateSubscriptionCall',
        'variables': {
          'subId': subId,
          'subRef': subRef,
          'subPlaceRef': subPlaceRef,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic created(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic stripeSubId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic stripeCustomer(dynamic response) => getJsonField(
        response,
        r'''$.customer''',
      );
  dynamic periodStart(dynamic response) => getJsonField(
        response,
        r'''$.current_period_start''',
      );
  dynamic periodEnd(dynamic response) => getJsonField(
        response,
        r'''$.current_period_end''',
      );
  dynamic paymentMethod(dynamic response) => getJsonField(
        response,
        r'''$.default_payment_method''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic subPlaceRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subPlaceRef''',
      );
  dynamic subRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subRef''',
      );
  dynamic metadata(dynamic response) => getJsonField(
        response,
        r'''$.metadata''',
      );
}

class GetCheckoutCall {
  Future<ApiCallResponse> call({
    String? checkoutId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetCheckoutCall',
        'variables': {
          'checkoutId': checkoutId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount_total''',
      ));
  int? created(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? customer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer''',
      ));
  String? customerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer_details.name''',
      ));
  dynamic customerEmail(dynamic response) => getJsonField(
        response,
        r'''$.customer_email''',
      );
  String? invoice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.invoice''',
      ));
  String? paymentStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_status''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? subscription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.subscription''',
      ));
  String? checkoutRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.checkoutRef''',
      ));
  String? placeRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.placeRef''',
      ));
  String? userRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.userRef''',
      ));
  String? mode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mode''',
      ));
}

/// End Stripe Group Code

/// Start Stripe Products Group Code

class StripeProductsGroup {
  static CreateProductCall createProductCall = CreateProductCall();
  static GetSubProductCall getSubProductCall = GetSubProductCall();
  static UpdateProductCall updateProductCall = UpdateProductCall();
  static DeleteProductCall deleteProductCall = DeleteProductCall();
  static GetProductsSearchCall getProductsSearchCall = GetProductsSearchCall();
}

class CreateProductCall {
  Future<ApiCallResponse> call({
    String? name = '',
    bool? active = true,
    String? description = '',
    String? metadataSubRef = '',
    String? image1 = 'null',
    String? image2 = 'null',
    String? image3 = 'null',
    String? image4 = 'null',
    String? image5 = 'null',
    String? priceCurrency = '',
    int? priceAmount,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateProductCall',
        'variables': {
          'name': name,
          'active': active,
          'description': description,
          'metadataSubRef': metadataSubRef,
          'image1': image1,
          'image2': image2,
          'image3': image3,
          'image4': image4,
          'image5': image5,
          'priceCurrency': priceCurrency,
          'priceAmount': priceAmount,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  bool? active(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.active''',
      ));
  List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$.images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? subRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.subRef''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  int? updatedAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.updated''',
      ));
  int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  String? stripePrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.default_price''',
      ));
}

class GetSubProductCall {
  Future<ApiCallResponse> call({
    String? stripeProduct = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetSubProductCall',
        'variables': {
          'stripeProduct': stripeProduct,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  bool? active(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.active''',
      ));
  String? subRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.metadata.subRef''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.type''',
      ));
  int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  int? updatedAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.updated''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$.images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.default_price''',
      );
}

class UpdateProductCall {
  Future<ApiCallResponse> call({
    String? stripeProduct = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UpdateProductCall',
        'variables': {
          'stripeProduct': stripeProduct,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteProductCall {
  Future<ApiCallResponse> call({
    String? stripeProduct = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteProductCall',
        'variables': {
          'stripeProduct': stripeProduct,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetProductsSearchCall {
  Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetProductsSearchCall',
        'variables': {
          'query': query,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? active(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<int>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? images(dynamic response) => getJsonField(
        response,
        r'''$.data[:].images''',
        true,
      ) as List?;
  List<String>? defaultprice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].default_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? subRef(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].metadata.subRef''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? updated(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].updated''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

/// End Stripe Products Group Code

/// Start Stripe Prices Group Code

class StripePricesGroup {
  static CreatePriceCall createPriceCall = CreatePriceCall();
  static GetPriceCall getPriceCall = GetPriceCall();
  static UpdatePriceCall updatePriceCall = UpdatePriceCall();
  static DeleteProductCopyCall deleteProductCopyCall = DeleteProductCopyCall();
  static GetAllPricesCall getAllPricesCall = GetAllPricesCall();
}

class CreatePriceCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? product = '',
    int? unitAmount,
    bool? active = true,
    String? nickname = '',
    String? subRef = '',
    String? subPlaceRef = '',
    String? subProductRef = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreatePriceCall',
        'variables': {
          'currency': currency,
          'product': product,
          'unitAmount': unitAmount,
          'active': active,
          'nickname': nickname,
          'subRef': subRef,
          'subPlaceRef': subPlaceRef,
          'subProductRef': subProductRef,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic active(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.currency''',
      );
  dynamic subPlaceRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subPlaceRef''',
      );
  dynamic subProductRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subProductRef''',
      );
  dynamic subRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subRef''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.nickname''',
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.product''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.unit_amount''',
      );
}

class GetPriceCall {
  Future<ApiCallResponse> call({
    String? stripePrice = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetPriceCall',
        'variables': {
          'stripePrice': stripePrice,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  bool? active(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.active''',
      ));
  int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  dynamic subPlaceRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subPlaceRef''',
      );
  dynamic subProductRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subProductRef''',
      );
  dynamic subRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subRef''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.nickname''',
      );
  String? stripeProduct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.unit_amount''',
      ));
}

class UpdatePriceCall {
  Future<ApiCallResponse> call({
    String? stripePrice = '',
    bool? active,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UpdatePriceCall',
        'variables': {
          'stripePrice': stripePrice,
          'active': active,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic active(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.currency''',
      );
  dynamic subPlaceRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subPlaceRef''',
      );
  dynamic subProductRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subProductRef''',
      );
  dynamic subRef(dynamic response) => getJsonField(
        response,
        r'''$.metadata.subRef''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.nickname''',
      );
  dynamic stripeProduct(dynamic response) => getJsonField(
        response,
        r'''$.product''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.unit_amount''',
      );
}

class DeleteProductCopyCall {
  Future<ApiCallResponse> call({
    String? stripeProduct = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteProductCopyCall',
        'variables': {
          'stripeProduct': stripeProduct,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetAllPricesCall {
  Future<ApiCallResponse> call({
    bool? active = true,
    String? product = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetAllPricesCall',
        'variables': {
          'active': active,
          'product': product,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List? result(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

/// End Stripe Prices Group Code

/// Start Geocoding API Group Code

class GeocodingAPIGroup {
  static String getBaseUrl() => 'https://maps.googleapis.com/maps/api/geocode';
  static Map<String, String> headers = {};
  static GetByAddressCall getByAddressCall = GetByAddressCall();
  static GetByPlaceIDCall getByPlaceIDCall = GetByPlaceIDCall();
  static GetByLatLongCall getByLatLongCall = GetByLatLongCall();
}

class GetByAddressCall {
  Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    final baseUrl = GeocodingAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get By Address',
      apiUrl: '$baseUrl/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'key': "",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? placeid(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? location(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
}

class GetByPlaceIDCall {
  Future<ApiCallResponse> call({
    String? placeid = '',
  }) async {
    final baseUrl = GeocodingAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get By Place ID',
      apiUrl: '$baseUrl/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'place_id': placeid,
        'key': "",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic addreess(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
      );
  dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      );
  dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      );
  dynamic placeid(dynamic response) => getJsonField(
        response,
        r'''$.results[:].place_id''',
      );
  dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
      );
}

class GetByLatLongCall {
  Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    final baseUrl = GeocodingAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get By LatLong',
      apiUrl: '$baseUrl/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
        'key': "",
        'language': "pt-BR",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[1].short_name''',
      ));
  String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[2].short_name''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[3].short_name''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[4].short_name''',
      ));
}

/// End Geocoding API Group Code

class TesteCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Teste',
      apiUrl:
          'https://places.googleapis.com/v1/places/ChIJ-XxYqwRCJ5URGRmRvZ6TUM8/photos/AcJnMuEYqVAObyXC_QgmPQzWq3tVqU9Z1kzaevEpq-bl0Y0JFsqm90MtKYk6b0Yn3F-QXWWJ5PYQU8B7ljI1aH_s9eJBUenU7-At4uVcoZvR4U5BlA-cTAIXKKMRVW5yO937Ib2rCK5dYL1tIKPAKH3fzmCHjZtSymKd9R-U/media',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "",
        'maxHeightPx': 4000,
        'maxWidthPx': 4000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
