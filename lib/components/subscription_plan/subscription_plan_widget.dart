import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subscription_plan_model.dart';
export 'subscription_plan_model.dart';

class SubscriptionPlanWidget extends StatefulWidget {
  const SubscriptionPlanWidget({
    super.key,
    required this.subscriptionPlanDoc,
    required this.placeRef,
  });

  final SubscriptionPlansRecord? subscriptionPlanDoc;
  final DocumentReference? placeRef;

  @override
  State<SubscriptionPlanWidget> createState() => _SubscriptionPlanWidgetState();
}

class _SubscriptionPlanWidgetState extends State<SubscriptionPlanWidget> {
  late SubscriptionPlanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPlanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          width: 300.0,
          height: 500.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x34111417),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        FFLocalizations.of(context).getVariableText(
                          ptText:
                              widget.subscriptionPlanDoc?.title.portuguese,
                          enText: widget.subscriptionPlanDoc?.title.english,
                          esText: widget.subscriptionPlanDoc?.title.spanish,
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      AutoSizeText(
                        FFLocalizations.of(context).getVariableText(
                          ptText:
                              widget.subscriptionPlanDoc?.subtitle.portuguese,
                          enText:
                              widget.subscriptionPlanDoc?.subtitle.english,
                          esText:
                              widget.subscriptionPlanDoc?.subtitle.spanish,
                        ),
                        maxLines: 3,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ].divide(const SizedBox(height: 6.0)),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: StripePricesGroup.getPriceCall.call(
                            stripePrice:
                                widget.subscriptionPlanDoc?.stripePlanId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final rowGetPriceResponse = snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'rtshu7gc' /* R$ */,
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily),
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: StripePricesGroup.getPriceCall.call(
                                    stripePrice: widget
                                        .subscriptionPlanDoc?.stripePlanId,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final textGetPriceResponse = snapshot.data!;

                                    return AutoSizeText(
                                      formatNumber(
                                        functions.stripeAmountToDouble(
                                            StripePricesGroup.getPriceCall
                                                .amount(
                                          textGetPriceResponse.jsonBody,
                                        )!),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 40.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 1.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'tcddzmpo' /* mensal */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                Expanded(
                  flex: 4,
                  child: Builder(
                    builder: (context) {
                      final feature = widget.subscriptionPlanDoc?.features
                              .sortedList(keyOf: (e) => e.order, desc: false)
                              .toList() ??
                          [];

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: feature.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                        itemBuilder: (context, featureIndex) {
                          final featureItem = feature[featureIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getVariableText(
                                      ptText: featureItem.portuguese,
                                      enText: featureItem.english,
                                      esText: featureItem.spanish,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;

                            var checkoutRecordReference =
                                CheckoutRecord.collection.doc();
                            await checkoutRecordReference
                                .set(createCheckoutRecordData(
                              userRef: currentUserReference,
                            ));
                            _model.placedCheckout =
                                CheckoutRecord.getDocumentFromData(
                                    createCheckoutRecordData(
                                      userRef: currentUserReference,
                                    ),
                                    checkoutRecordReference);
                            shouldSetState = true;
                            _model.stripeCustomer =
                                await queryStripeCustomersRecordOnce(
                              queryBuilder: (stripeCustomersRecord) =>
                                  stripeCustomersRecord.where(
                                'email',
                                isEqualTo: currentUserEmail,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            shouldSetState = true;
                            if (_model.stripeCustomer != null) {
                              _model.apiStripeNewCheckout = await StripeGroup
                                  .createCheckoutSessionSubscriptionCall
                                  .call(
                                productId:
                                    widget.subscriptionPlanDoc?.stripePlanId,
                                successUrl:
                                    'https://placed.com.br/checkout/${_model.placedCheckout?.reference.id}',
                                userRef: currentUserReference?.id,
                                placeRef: widget.placeRef?.id,
                                checkoutRef:
                                    _model.placedCheckout?.reference.id,
                                customer: _model.stripeCustomer?.stripeId,
                              );

                              shouldSetState = true;
                              if ((_model.apiStripeNewCheckout?.succeeded ??
                                  true)) {
                                await _model.placedCheckout!.reference
                                    .update(createCheckoutRecordData(
                                  stripeSessionID: StripeGroup
                                      .createCheckoutSessionSubscriptionCall
                                      .checkoutId(
                                    (_model.apiStripeNewCheckout?.jsonBody ??
                                        ''),
                                  ),
                                  stripe: true,
                                  error: false,
                                ));
                                await launchURL(StripeGroup
                                    .createCheckoutSessionSubscriptionCall
                                    .checkoutUrl(
                                  (_model.apiStripeNewCheckout?.jsonBody ?? ''),
                                )!);
                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                await _model.placedCheckout!.reference
                                    .update(createCheckoutRecordData(
                                  stripe: true,
                                  error: true,
                                ));
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Um problema inesperado ocorreu.'),
                                      content: const Text(
                                          'Aguarde alguns minutos e tente novamente, nossa equipe já foi informada.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (shouldSetState) safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ub68cwoh' /* Assinar */,
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
