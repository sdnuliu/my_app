import 'package:flutter/material.dart';

class AnimationStudy3 extends StatefulWidget {
  @override
  _AnimationStudy3State createState() => _AnimationStudy3State();
}

class _AnimationStudy3State extends State<AnimationStudy3>
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
    return LogoWidgetTranscation(animation: animation, child: LogoWidget());
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class LogoWidgetTranscation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  LogoWidgetTranscation({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画学习'),
          leading: BackButton(),
        ),
        body: Center(
          child: Container(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
              child: child,
            ),
          ),
        ));
  }
}
