import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebViewInjectExample(),
    );
  }
}

class WebViewInjectExample extends StatefulWidget {
  const WebViewInjectExample({super.key});

  @override
  State<WebViewInjectExample> createState() => _WebViewInjectExampleState();
}

class _WebViewInjectExampleState extends State<WebViewInjectExample> {
  late final WebViewController _controller;
  String _jsCode = '';

  @override
  void initState() {
    super.initState();
    _loadJSFile();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            if (_jsCode.isNotEmpty) {
              await _controller.runJavaScript(_jsCode);
            }
          },
        ),
      )
      ..loadRequest(Uri.parse('https://example.com'));
  }

  Future<void> _loadJSFile() async {
    _jsCode = await rootBundle.loadString('assets/my_script.js');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView Inject JS')),
      body: SizedBox(
        height: 10,
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
