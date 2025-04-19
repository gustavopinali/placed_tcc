import '/backend/backend.dart';
import '/components/place_menu_page/place_menu_page_widget.dart';
import '/components/place_page01_widget.dart';
import '/components/place_page02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'place_page_model.dart';
export 'place_page_model.dart';

class PlacePageWidget extends StatefulWidget {
  const PlacePageWidget({
    super.key,
    required this.placeDoc,
  });

  final PlacesRecord? placeDoc;

  @override
  State<PlacePageWidget> createState() => _PlacePageWidgetState();
}

class _PlacePageWidgetState extends State<PlacePageWidget> {
  late PlacePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: PageView(
        controller: _model.pageViewController ??=
            PageController(initialPage: 0),
        scrollDirection: Axis.horizontal,
        children: [
          wrapWithModel(
            model: _model.placePage01Model,
            updateCallback: () => safeSetState(() {}),
            child: PlacePage01Widget(
              placeDoc: widget.placeDoc!,
              actionGo: () async {},
            ),
          ),
          wrapWithModel(
            model: _model.placePage02Model,
            updateCallback: () => safeSetState(() {}),
            child: PlacePage02Widget(
              placeDoc: widget.placeDoc!,
            ),
          ),
          wrapWithModel(
            model: _model.placeMenuPageModel,
            updateCallback: () => safeSetState(() {}),
            child: PlaceMenuPageWidget(
              placeDoc: widget.placeDoc!,
              actionBack: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
