import 'package:flutter/material.dart';

class ImageUseStudy extends StatefulWidget {
  @override
  _ImageUseStudyState createState() => _ImageUseStudyState();
}

class _ImageUseStudyState extends State<ImageUseStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片使用学习的'),
        leading: BackButton(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}
