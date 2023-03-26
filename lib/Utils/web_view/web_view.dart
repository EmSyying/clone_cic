import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

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
  late final WebViewController _controller;
  @override
  void initState() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('${widget.url}'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;

    super.initState();
  }

  // String selectedUrl = 'https://flutter.io';

// ignore: prefer_collection_literals
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return widget.isfromReport == true
        ? Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  WebViewWidget(
                    controller: _controller,
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
                      WebViewWidget(
                        controller: _controller,
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
