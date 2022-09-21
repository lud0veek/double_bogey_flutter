import 'dart:io';
import 'package:double_bogey_flutter/call/paymentCalls.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VivawalletWebviewWidget extends StatefulWidget {
  final String orderCode;
  const VivawalletWebviewWidget({Key? key, required this.orderCode}) : super(key: key);

  @override
  VivawalletWebviewWidgetState createState() => VivawalletWebviewWidgetState();
}

class VivawalletWebviewWidgetState extends State<VivawalletWebviewWidget> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Payement-${widget.orderCode}", style: TextStyle(color: Colors.blue),),
      ),
      body:
      WebView(
        initialUrl: 'https://demo.vivapayments.com/web2?ref=${widget.orderCode}',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
          navigationDelegate: (navigation){
            //Listen for callback URL
            //Capture the URL and close the WebView
            //Verify the payment and show the result
            var uri = Uri.parse(navigation.url);
            var transactionId = uri.queryParameters["t"];
            updatePayment(transactionId!);
            Navigator.pop(context);
            return NavigationDecision.prevent;
          }

      ),
    );
  }
}