import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'not_have_acount_text_model.dart';
export 'not_have_acount_text_model.dart';

class NotHaveAcountTextWidget extends StatefulWidget {
  const NotHaveAcountTextWidget({super.key});

  @override
  State<NotHaveAcountTextWidget> createState() =>
      _NotHaveAcountTextWidgetState();
}

class _NotHaveAcountTextWidgetState extends State<NotHaveAcountTextWidget> {
  late NotHaveAcountTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotHaveAcountTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed('SignUp');
      },
      child: RichText(
        textScaler: MediaQuery.of(context).textScaler,
        text: TextSpan(
          children: [
            TextSpan(
              text: FFLocalizations.of(context).getText(
                'q5y8mq2e' /* Não possui conta?  */,
              ),
              style: const TextStyle(),
            ),
            TextSpan(
              text: FFLocalizations.of(context).getText(
                'yvrao9f8' /* Cadastrar */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            )
          ],
          style: FlutterFlowTheme.of(context).labelLarge.override(
                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
              ),
        ),
      ),
    );
  }
}
