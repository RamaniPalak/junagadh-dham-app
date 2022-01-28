import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonationWebViewScreen extends StatefulWidget {

   String? url;

   DonationWebViewScreen({Key? key,this.url}) : super(key: key);

  @override
  _DonationWebViewScreenState createState() => _DonationWebViewScreenState();
}

class _DonationWebViewScreenState extends State<DonationWebViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
            '',
            style: kAuthTitleStyle
        ),
      ),
      body: SafeArea(
        child: Container(
            child:  WebView(
              allowsInlineMediaPlayback: true,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            )
        ),
      ),

    );
  }
}
