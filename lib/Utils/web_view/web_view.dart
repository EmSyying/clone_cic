import 'dart:async';
import 'dart:io';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helper/custom_appbar.dart';

class ViewWebsite extends StatefulWidget {
  final String? url;
  final String? title;
  final bool? isfromReport;
  const ViewWebsite({Key? key, this.url, this.title, this.isfromReport = false})
      : super(key: key);

  @override
  State<ViewWebsite> createState() => _ViewWebsiteState();
}

class _ViewWebsiteState extends State<ViewWebsite> {
  @override
  void initState() {
    if (!kIsWeb) {
      if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }

    super.initState();
  }

  String selectedUrl = 'https://flutter.io';

// ignore: prefer_collection_literals
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print', onMessageReceived: (JavascriptMessage message) {}),
  ].toSet();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return widget.isfromReport == true
        ? Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  WebView(
                    initialUrl: widget.url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onProgress: (int progress) {},
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith('https://www.youtube.com/')) {
                        return NavigationDecision.prevent;
                      }

                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      debugPrint("star view web");
                    },
                    onPageFinished: (String url) {
                      setState(() {
                        isLoading = false;
                      });
                      debugPrint("star view web finished");
                    },
                    gestureNavigationEnabled: true,
                  ),
                  isLoading ? const LinearProgressIndicator() : Stack(),
                ],
              );
            },
          )
        : DefaultSizeWeb(
            child: Scaffold(
              appBar: CustomAppBar(
                isLogo: false,
                isLeading: true,
                context: context,
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 1.0,
                title: widget.title,
              ),
              body: Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      WebView(
                        initialUrl: widget.url,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _controller.complete(webViewController);
                        },
                        onProgress: (int progress) {},
                        navigationDelegate: (NavigationRequest request) {
                          if (request.url
                              .startsWith('https://www.youtube.com/')) {
                            return NavigationDecision.prevent;
                          }

                          return NavigationDecision.navigate;
                        },
                        onPageStarted: (String url) {
                          debugPrint("star view web1");
                        },
                        onPageFinished: (String url) {
                          setState(() {
                            isLoading = false;
                          });
                          debugPrint("star view web finished 1");
                        },
                        gestureNavigationEnabled: true,
                      ),
                      isLoading ? const LinearProgressIndicator() : Stack(),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
