import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'placed_ad_banner_model.dart';
export 'placed_ad_banner_model.dart';

class PlacedAdBannerWidget extends StatefulWidget {
  const PlacedAdBannerWidget({super.key});

  @override
  State<PlacedAdBannerWidget> createState() => _PlacedAdBannerWidgetState();
}

class _PlacedAdBannerWidgetState extends State<PlacedAdBannerWidget> {
  late PlacedAdBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacedAdBannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Builder(
          builder: (context) {
            if (isWeb) {
              return Html(
                data:
                    '<script async src=\"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6421100303643528\"\n     crossorigin=\"anonymous\"></script>\n<!-- Placed -->\n<ins class=\"adsbygoogle\"\n     style=\"display:block\"\n     data-ad-client=\"ca-pub-6421100303643528\"\n     data-ad-slot=\"8567312623\"\n     data-ad-format=\"auto\"\n     data-full-width-responsive=\"true\"></ins>\n<script>\n     (adsbygoogle = window.adsbygoogle || []).push({});\n</script>',
                onLinkTap: (url, _, __) => launchURL(url!),
              );
            } else {
              return const FlutterFlowAdBanner(
                showsTestAd: true,
                iOSAdUnitID: 'ca-app-pub-6421100303643528/1330592027',
                androidAdUnitID: 'ca-app-pub-6421100303643528/7481067408',
              );
            }
          },
        ),
      ),
    );
  }
}
