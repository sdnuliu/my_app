import 'package:flutter/material.dart';

class AnimationStudy2 extends StatefulWidget {
  @override
  _AnimationStudy2State createState() => _AnimationStudy2State();
}

class _AnimationStudy2State extends State<AnimationStudy2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 300).animate(animationController);
    animationController.forward();
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
          child: _AnimationLogo(animation:animation),
        ),
      ),
    );
  }
}

class _AnimationLogo extends AnimatedWidget {
  _AnimationLogo({Key key, @required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
