import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewGoogleMap extends StatefulWidget {
  final String? url;

  const ViewGoogleMap({Key? key, this.url}) : super(key: key);

  @override
  State<ViewGoogleMap> createState() => _ViewGoogleMapState();
}

class _ViewGoogleMapState extends State<ViewGoogleMap> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
