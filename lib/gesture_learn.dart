import 'package:flutter/material.dart';

class GestureLean extends StatefulWidget {
  @override
  _GestureLeanState createState() {
    return _GestureLeanState();
  }
}

class _GestureLeanState extends State<GestureLean> {
  String printlog = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('手势监听'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => _printMsg('被点击了'),
                      onDoubleTap: () => _printMsg('被双击了'),
                      onLongPress: () => _printMsg('被长按了'),
                      onTapCancel: () => _printMsg('取消了'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration:
                            BoxDecoration(color: Colors.lightGreenAccent),
                        child: Text('点我'),
                      )),
                  Text(
                    printlog,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
              Positioned(
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                left: moveX,
                top: moveY,
              )
            ],
          ),
        ),
      );
  }

  _printMsg(String msg) {
    setState(() {
      printlog += ' ,$msg,||';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
