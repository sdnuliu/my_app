import 'package:flutter/material.dart';

class AnimationStudy extends StatefulWidget {
  @override
  _AnimationStudyState createState() => _AnimationStudyState();
}

class _AnimationStudyState extends State<AnimationStudy>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画学习'),
        leading: BackButton(),
      ),
      body: Center(
          child: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                animationController.reset();
                animationController.forward();
              },
              child: Text('开始动画'),
            ),
            Text(
              animationStatus.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
              textDirection: TextDirection.ltr,
            ),
            Text(
              animationValue.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
              textDirection: TextDirection.ltr,
            ),
            Container(
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
            )
          ],
        ),
      )),
    );
  }
}
