import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivatePolicy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PrivatePolicyState();
  }
}

class _PrivatePolicyState extends State<PrivatePolicy> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          '隐私政策',
          style: TextStyle(color: Colors.black),
        ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
//        actions: <Widget>[
//          NavigationControls(_controller.future),
//          SampleMenu(_controller.future),
//        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            WebView(
              initialUrl:
                  'https://f3dt.com/arbody/%E9%9A%90%E7%A7%81%E5%8D%8F%E8%AE%AE.html',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
//              navigationDelegate: (NavigationRequest request) {
//                if (request.url.startsWith('https://www.youtube.com/')) {
//                  print('blocking navigation to $request}');
//                  return NavigationDecision.prevent;
//                }
//                print('allowing navigation to $request');
//                return NavigationDecision.navigate;
//              },
              onPageStarted: (String url) {
                setState(() {
                  _loading = true;
                });
//                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                setState(() {
                  _loading = false;
                });
//                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            ),
            Visibility(
                visible: _loading,
                child: Positioned(child: CircularProgressIndicator()))
          ],
        );
      }),
    );
  }
}
