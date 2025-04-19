import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'posts_widget.dart' show PostsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostsModel extends FlutterFlowModel<PostsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for Post dynamic component.
  late FlutterFlowDynamicModels<PostModel> postModels;

  @override
  void initState(BuildContext context) {
    postModels = FlutterFlowDynamicModels(() => PostModel());
  }

  @override
  void dispose() {
    postModels.dispose();
  }
}
