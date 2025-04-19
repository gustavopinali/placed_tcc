import '/backend/backend.dart';
import '/components/list_h_place/list_h_place_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_favorite_places_model.dart';
export 'user_favorite_places_model.dart';

class UserFavoritePlacesWidget extends StatefulWidget {
  const UserFavoritePlacesWidget({
    super.key,
    this.placeDocs,
  });

  final List<UserFollowedPlacesRecord>? placeDocs;

  @override
  State<UserFavoritePlacesWidget> createState() =>
      _UserFavoritePlacesWidgetState();
}

class _UserFavoritePlacesWidgetState extends State<UserFavoritePlacesWidget> {
  late UserFavoritePlacesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserFavoritePlacesModel());

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'kwxdwxli' /* Locais favoritos */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ),
        Builder(
          builder: (context) {
            final favoritePlace = widget.placeDocs?.toList() ?? [];

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(favoritePlace.length, (favoritePlaceIndex) {
                  final favoritePlaceItem = favoritePlace[favoritePlaceIndex];
                  return StreamBuilder<PlacesRecord>(
                    stream:
                        PlacesRecord.getDocument(favoritePlaceItem.placeRef!),
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

                      final containerPlacesRecord = snapshot.data!;

                      return Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: wrapWithModel(
                            model: _model.listHPlaceModels.getModel(
                              containerPlacesRecord.reference.id,
                              favoritePlaceIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ListHPlaceWidget(
                              key: Key(
                                'Keyquf_${containerPlacesRecord.reference.id}',
                              ),
                              placeDoc: containerPlacesRecord,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).divide(const SizedBox(width: 10.0)),
              ),
            );
          },
        ),
      ],
    );
  }
}
