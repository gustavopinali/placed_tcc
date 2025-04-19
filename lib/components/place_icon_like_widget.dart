import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_icon_like_model.dart';
export 'place_icon_like_model.dart';

class PlaceIconLikeWidget extends StatefulWidget {
  const PlaceIconLikeWidget({
    super.key,
    this.placeRef,
  });

  final DocumentReference? placeRef;

  @override
  State<PlaceIconLikeWidget> createState() => _PlaceIconLikeWidgetState();
}

class _PlaceIconLikeWidgetState extends State<PlaceIconLikeWidget> {
  late PlaceIconLikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceIconLikeModel());

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
        if (loggedIn) {
          return Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).placedWhite,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: StreamBuilder<List<UserFollowedPlacesRecord>>(
              stream: queryUserFollowedPlacesRecord(
                parent: currentUserReference,
                queryBuilder: (userFollowedPlacesRecord) =>
                    userFollowedPlacesRecord
                        .where(
                          'placeRef',
                          isEqualTo: widget.placeRef,
                        )
                        .where(
                          'active',
                          isEqualTo: true,
                        ),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 10.0,
                      height: 10.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UserFollowedPlacesRecord>
                    conditionalBuilderUserFollowedPlacesRecordList =
                    snapshot.data!;
                final conditionalBuilderUserFollowedPlacesRecord =
                    conditionalBuilderUserFollowedPlacesRecordList.isNotEmpty
                        ? conditionalBuilderUserFollowedPlacesRecordList.first
                        : null;

                return Builder(
                  builder: (context) {
                    if (conditionalBuilderUserFollowedPlacesRecord != null) {
                      return FlutterFlowIconButton(
                        borderRadius: 40.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await conditionalBuilderUserFollowedPlacesRecord
                              .reference
                              .update(createUserFollowedPlacesRecordData(
                            active: false,
                          ));
                        },
                      );
                    } else {
                      return FlutterFlowIconButton(
                        borderRadius: 40.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await UserFollowedPlacesRecord.createDoc(
                                  currentUserReference!)
                              .set({
                            ...createUserFollowedPlacesRecordData(
                              placeRef: widget.placeRef,
                              active: true,
                            ),
                            ...mapToFirestore(
                              {
                                'createdAt': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        },
                      );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return const Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          );
        }
      },
    );
  }
}
