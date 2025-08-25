import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradingScreen extends StatefulWidget {
  const TradingScreen({super.key});

  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  WebViewController controller = WebViewController();
  String symbol = 'BTCUSDT';
  bool isLoadingWebview = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              isLoadingWebview = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoadingWebview = false;
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://www.tradingview.com/chart/?symbol=BINANCE%3A$symbol'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 400,
            child: isLoadingWebview
                ? const Center(child: CircularProgressIndicator())
                : WebViewWidget(controller: controller),
          ),

          /// Orderbook view
        ],
      ),
    );
  }
}
