import 'package:flutter/material.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/payment/logic/payment_processing.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  WebView({super.key});
  final url = getIt<PayUsingIfreme>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleApp.indigo,
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.google.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(url.urlIfreme)),
      ),
    );
  }
}
