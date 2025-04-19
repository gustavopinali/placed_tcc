import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'color_change_min_model.dart';
export 'color_change_min_model.dart';

class ColorChangeMinWidget extends StatefulWidget {
  const ColorChangeMinWidget({super.key});

  @override
  State<ColorChangeMinWidget> createState() => _ColorChangeMinWidgetState();
}

class _ColorChangeMinWidgetState extends State<ColorChangeMinWidget>
    with TickerProviderStateMixin {
  late ColorChangeMinModel _model;

  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorChangeMinModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: const Offset(-40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (Theme.of(context).brightness == Brightness.light)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setDarkModeSetting(context, ThemeMode.dark);
              if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
                safeSetState(() => hasContainerTriggered2 = true);
                SchedulerBinding.instance.addPostFrameCallback((_) async =>
                    await animationsMap['containerOnActionTriggerAnimation2']!
                        .controller
                        .forward(from: 0.0));
              }
            },
            child: Container(
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.95, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        Icons.nights_stay,
                        color: Color(0xFF95A1AC),
                        size: 20.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.85, 0.0),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x430B0D0F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                        hasBeenTriggered: hasContainerTriggered1),
                  ),
                ],
              ),
            ),
          ),
        if (Theme.of(context).brightness == Brightness.dark)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setDarkModeSetting(context, ThemeMode.light);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                safeSetState(() => hasContainerTriggered1 = true);
                SchedulerBinding.instance.addPostFrameCallback((_) async =>
                    await animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .forward(from: 0.0));
              }
            },
            child: Container(
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.9, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 0.0, 0.0),
                      child: Icon(
                        Icons.wb_sunny_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.9, 0.0),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x430B0D0F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                        hasBeenTriggered: hasContainerTriggered2),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
