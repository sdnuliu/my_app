import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageUseStudy extends StatefulWidget {
  @override
  _ImageUseStudyState createState() => _ImageUseStudyState();
}

class _ImageUseStudyState extends State<ImageUseStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片使用学习'),
        leading: BackButton(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl:
                    'https://img1.17img.cn/17img/images/201910/pic/d66d4fae-1cf0-45b9-99c8-15822fea5e62.jpg!w140x110.jpg',
                placeholder: (context, url) => Container(
                  child: CircularProgressIndicator(),
                  width: 20,
                  height: 20,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://img1.17img.cn/17img/images/201910/pic/d66d4fae-1cf0-45b9-99c8-15822fea5e62.jpg!w140x110.jpg',
            ),
            Icon(Icons.android,size: 60,)
          ],
        ),
      ),
    );
  }
}
