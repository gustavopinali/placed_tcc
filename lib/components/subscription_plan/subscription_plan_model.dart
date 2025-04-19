import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_plan_widget.dart' show SubscriptionPlanWidget;
import 'package:flutter/material.dart';

class SubscriptionPlanModel extends FlutterFlowModel<SubscriptionPlanWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CheckoutRecord? placedCheckout;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StripeCustomersRecord? stripeCustomer;
  // Stores action output result for [Backend Call - API (Create Checkout Session Subscription)] action in Button widget.
  ApiCallResponse? apiStripeNewCheckout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
