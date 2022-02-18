import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String url;

   WebviewScreen({Key? key,required this.url}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final controller = await _controller.future;
      final iframe =
          "<iframe width=\"100%\" height=\"100%\" src=\"${widget.url}\" title=\"YouTube video player\" frameborder=\"0\"></iframe>";

      // final iframe = "<iframe src=\"${value}\" title=\"W3Schools Free Online Web Tutorials\" width=\"100%\" height=\"600\" > </iframe>";

      controller.loadHtmlString(iframe);
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.black,

          )
      ),
      body: Stack(
        children: [
          WebView(
            initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.always_allow,
            allowsInlineMediaPlayback: true,
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller.complete(controller);
              }
          ),
        ],
      ),
    );
  }
}
