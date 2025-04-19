import '/backend/backend.dart';
import '/components/post_in_grid/post_in_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'user_tab_posts_model.dart';
export 'user_tab_posts_model.dart';

class UserTabPostsWidget extends StatefulWidget {
  const UserTabPostsWidget({
    super.key,
    required this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<UserTabPostsWidget> createState() => _UserTabPostsWidgetState();
}

class _UserTabPostsWidgetState extends State<UserTabPostsWidget> {
  late UserTabPostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserTabPostsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostsRecord>>(
      stream: queryPostsRecord(
        queryBuilder: (postsRecord) => postsRecord.where(
          'userRef',
          isEqualTo: widget.userDoc?.reference,
        ),
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
        List<PostsRecord> staggeredViewPostsRecordList = snapshot.data!;

        return MasonryGridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          itemCount: staggeredViewPostsRecordList.length,
          itemBuilder: (context, staggeredViewIndex) {
            final staggeredViewPostsRecord =
                staggeredViewPostsRecordList[staggeredViewIndex];
            return wrapWithModel(
              model: _model.postInGridModels.getModel(
                staggeredViewPostsRecord.reference.id,
                staggeredViewIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              child: PostInGridWidget(
                key: Key(
                  'Key4tr_${staggeredViewPostsRecord.reference.id}',
                ),
                postDoc: staggeredViewPostsRecord,
              ),
            );
          },
        );
      },
    );
  }
}
