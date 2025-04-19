import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_posts_model.dart';
export 'place_posts_model.dart';

class PlacePostsWidget extends StatefulWidget {
  const PlacePostsWidget({super.key});

  @override
  State<PlacePostsWidget> createState() => _PlacePostsWidgetState();
}

class _PlacePostsWidgetState extends State<PlacePostsWidget> {
  late PlacePostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacePostsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: StreamBuilder<List<PlacesRecord>>(
          stream: queryPlacesRecord(),
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
            List<PlacesRecord> gridViewPlacesRecordList = snapshot.data!;

            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: gridViewPlacesRecordList.length,
              itemBuilder: (context, gridViewIndex) {
                final gridViewPlacesRecord =
                    gridViewPlacesRecordList[gridViewIndex];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    getCORSProxyUrl(
                      'https://picsum.photos/seed/441/600',
                    ),
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
