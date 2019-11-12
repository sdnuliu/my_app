import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() {
    return _LayoutPageState();
  }
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局指南'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              '下面是圆形ClipOval',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    'https://img1.17img.cn/17img/images/201909/pic/1705992e-c8d9-4816-8706-917107e7725f.jpg'),
              ),
            ),
            Text(
              '下面是圆角矩形ClipRRect',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Opacity(
                  opacity: 0.8,
                  child: Image.network(
                    'https://img1.17img.cn/17img/images/201909/pic/1705992e-c8d9-4816-8706-917107e7725f.jpg',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
            Text(
              '下面是FractionallySizedBox将宽度撑满',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.lightGreenAccent),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text('我是文字'),
                  ),
                )),
            Text(
              '下面是Stack重叠布局',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Stack(
              children: <Widget>[
                Image.network(
                  'https://img1.17img.cn/17img/images/201909/pic/1705992e-c8d9-4816-8706-917107e7725f.jpg',
                  width: 100,
                  height: 100,
                ),
                Positioned(
                    left: 20,
                    top: 40,
                    child: Image.network(
                      'https://img1.17img.cn/17img/images/201512/pic/14a89ecd-816c-47d0-8af7-9ce1b8c6fa40.jpg!w98x33.jpg',
                      width: 50,
                      height: 20,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
