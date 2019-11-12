import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() {
    print('----createState------');
    return _WidgetLifecycleState();
  }
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  var _count = 0;

  @override
  void initState() {
    print('-----initState-----');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('----didChangeDependencies----');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('----didUpdateWidget----');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('----dispose----');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('----build-----');
    return  Scaffold(
        appBar: AppBar(
          title: Text('flutter页面的生命周期'),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Text('按钮'),
              ),
              Text(_count.toString())
            ],
          ),
        ),
      );

  }
}
