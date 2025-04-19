import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_swipe_images_model.dart';
export 'user_swipe_images_model.dart';

class UserSwipeImagesWidget extends StatefulWidget {
  const UserSwipeImagesWidget({
    super.key,
    this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserSwipeImagesWidget> createState() => _UserSwipeImagesWidgetState();
}

class _UserSwipeImagesWidgetState extends State<UserSwipeImagesWidget> {
  late UserSwipeImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSwipeImagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<List<UserImagesRecord>>(
          stream: queryUserImagesRecord(
            parent: widget.userRef,
            queryBuilder: (userImagesRecord) => userImagesRecord
                .where(
                  'status.active',
                  isEqualTo: true,
                )
                .orderBy('order'),
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
            List<UserImagesRecord> pageViewUserImagesRecordList =
                snapshot.data!;

            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _model.pageViewController ??= PageController(
                    initialPage: max(
                        0, min(0, pageViewUserImagesRecordList.length - 1))),
                scrollDirection: Axis.horizontal,
                itemCount: pageViewUserImagesRecordList.length,
                itemBuilder: (context, pageViewIndex) {
                  final pageViewUserImagesRecord =
                      pageViewUserImagesRecordList[pageViewIndex];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      getCORSProxyUrl(
                        pageViewUserImagesRecord.url,
                      ),
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            );
          },
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    FlutterFlowTheme.of(context).placedBlack
                  ],
                  stops: const [0.5, 0.8],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await _model.pageViewController?.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await _model.pageViewController?.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
