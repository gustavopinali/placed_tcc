import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_user_image_model.dart';
export 'edit_user_image_model.dart';

class EditUserImageWidget extends StatefulWidget {
  const EditUserImageWidget({
    super.key,
    required this.userImageDoc,
    required this.index,
  });

  final UserImagesRecord? userImageDoc;
  final int? index;

  @override
  State<EditUserImageWidget> createState() => _EditUserImageWidgetState();
}

class _EditUserImageWidgetState extends State<EditUserImageWidget> {
  late EditUserImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditUserImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
      child: Container(
        width: 120.0,
        height: 160.0,
        decoration: const BoxDecoration(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).placedBlack,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      getCORSProxyUrl(
                        widget.userImageDoc!.url,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).placedAlt,
                    borderRadius: 15.0,
                    borderWidth: 1.0,
                    buttonSize: 30.0,
                    fillColor: FlutterFlowTheme.of(context).placedWhite,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).placedBlack,
                      size: 12.0,
                    ),
                    onPressed: () async {
                      await widget.userImageDoc!.reference
                          .update(createUserImagesRecordData(
                        status: createImageStatusStruct(
                          active: false,
                          clearUnsetFields: false,
                        ),
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
