import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNews extends StatefulWidget {
  final String url;
  const DetailNews({Key key, this.url}) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromRGBO(1, 30, 41, 1),
        child: Icon(Icons.clear),
      ),
      body: SafeArea(
        child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.url),
      ),
    );
  }
}
