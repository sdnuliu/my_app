import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenOtherAppPage extends StatefulWidget {
  @override
  _OpenOtherAppPageState createState() {
    return _OpenOtherAppPageState();
  }
}

class _OpenOtherAppPageState extends State<OpenOtherAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('跳转其他应用'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => _launchURL(),
                child: Text('打电话'),
              )
            ],
          ),
        ),
      );
  }

  _launchURL() async {
    const url = 'tel:+8619920099642';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
