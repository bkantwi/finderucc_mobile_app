import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This is the root of the app

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override

  bool showSpinner = true;

  void initState(){
    super.initState();
  //  Enable Hybrid composition
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finderucc"),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: WebView(
        initialUrl: "https://finderucc.com",
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finished){
          setState(() {
            showSpinner = false;
            });
          },
        ),
      )
    );
  }
}
