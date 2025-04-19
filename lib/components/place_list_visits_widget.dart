import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_list_visits_model.dart';
export 'place_list_visits_model.dart';

class PlaceListVisitsWidget extends StatefulWidget {
  const PlaceListVisitsWidget({
    super.key,
    this.visitList,
  });

  final List<VisitsRecord>? visitList;

  @override
  State<PlaceListVisitsWidget> createState() => _PlaceListVisitsWidgetState();
}

class _PlaceListVisitsWidgetState extends State<PlaceListVisitsWidget> {
  late PlaceListVisitsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceListVisitsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final visit = (widget.visitList?.toList() ?? []).take(3).toList();

        return SizedBox(
          width: 200.0,
          child: Stack(
            children: List.generate(visit.length, (visitIndex) {
              final visitItem = visit[visitIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      visitIndex * 15,
                      0.0,
                    ),
                    0.0,
                    0.0,
                    0.0),
                child: SafeArea(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/pexels-elle-hughes-1680172.jpg',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
