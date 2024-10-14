import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String appUrl;

  const WebViewScreen({super.key, required this.appUrl});

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..loadRequest(Uri.parse(widget.appUrl));
    //
    // controller.onPageFinished.listen((_) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            isLoading = true; // Start loading
          });
        },
        onPageFinished: (String url) {
          setState(() {
            isLoading = false; // Finish loading
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.appUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller),
    );
  }
}

