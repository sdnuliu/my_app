import 'package:flutter/material.dart';

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[Text('app生命周期')],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print('进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('进入前台');
    } else if (state == AppLifecycleState.inactive) {
      print('进入inactive');
    }
    super.didChangeAppLifecycleState(state);
  }
}
