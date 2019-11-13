import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:my_app/animation_hard.dart';
import 'package:my_app/animation_hexo.dart';
import 'package:my_app/animation_study.dart';
import 'package:my_app/animation_study_2.dart';
import 'package:my_app/animation_study_3.dart';
import 'package:my_app/app_lifecycle.dart';
import 'package:my_app/camera_app.dart';
import 'package:my_app/generic_learn.dart';
import 'package:my_app/image_user_study.dart';
import 'package:my_app/stateful_group_page.dart';
import 'package:my_app/widget_lifecycle.dart';

import 'flutter_layout_page.dart';
import 'gesture_learn.dart';
import 'oop_learn.dart';
import 'open_ohter_app.dart';

EventBus eventBus = EventBus();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  var isNight = false;

  @override
  void initState() {
    eventBus.on<ThemeChangeEvent>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      setState(() {
        isNight = event.isNight;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: isNight ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      //配置路由
      routes: <String, WidgetBuilder>{
        'layout': (BuildContext context) => LayoutPage(),
        'stateful': (BuildContext context) => StateFullGroup(),
        'gesture': (BuildContext context) => GestureLean(),
        'openapp': (BuildContext context) => OpenOtherAppPage(),
        'widgetlifecycle': (BuildContext context) => WidgetLifecycle(),
        'applifecycle': (BuildContext context) => AppLifecycle(),
        'cameraapp': (BuildContext context) => CameraApp(),
        'imageuse': (BuildContext context) => ImageUseStudy(),
        'animationstudy': (BuildContext context) => AnimationStudy(),
        'animationstudy2': (BuildContext context) => AnimationStudy2(),
        'animationstudy3': (BuildContext context) => AnimationStudy3(),
        'animationhexo': (BuildContext context) => AnimationHexo(),
        'animationfinal': (BuildContext context) => RadialExpansionDemo(),
      },
      home: HomePage(),
    );
  }

  void _oopLearn() {
    Logger logger1 = Logger();
    Logger logger2 = Logger();
    print('logger1==logger2:${logger1 == logger2}');
  }

  void _genericLearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}

class HomePage extends StatefulWidget {
  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage> {
  bool isByName = false;
  bool isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Flutter Demo'),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SwitchListTile(
                    title: Text('${isByName ? '' : '不'}通过路由跳转'),
                    value: isByName,
                    onChanged: (value) {
                      setState(() {
                        isByName = value;
                      });
                    }),
                SwitchListTile(
                    title: Text('夜间模式'),
                    value: isNight,
                    onChanged: (value) {
                      setState(() {
                        isNight = value;
                      });
                      eventBus.fire(ThemeChangeEvent(value));
                    }),
                _item('布局指南', LayoutPage(), 'layout'),
                _item('Statefulwidget与基础组件', StateFullGroup(), 'stateful'),
                _item('手势监听', GestureLean(), 'gesture'),
                _item("打开其他APP", OpenOtherAppPage(), 'openapp'),
                _item('flutter页面的生命周期', WidgetLifecycle(), 'widgetlifecycle'),
                _item('app的生命周期', AppLifecycle(), 'applifecycle'),
                _item('拍照app', CameraApp(), 'cameraapp'),
                _item('图片使用', ImageUseStudy(), 'imageuse'),
                _item('动画学习', AnimationStudy(), 'animationstudy'),
                _item('动画学习2', AnimationStudy2(), 'animationstudy2'),
                _item('动画学习3', AnimationStudy3(), 'animationstudy3'),
                _item('Hexo动画', AnimationHexo(), 'animationhexo'),
                _item('高级动画', RadialExpansionDemo(), 'animationfinal'),
              ],
            ),
          ),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
//        child: ListView(
//          children: <Widget>[
//            DataType(),
//            Text(
//              '我是文字',
//              style: textStyle,
//              textAlign: TextAlign.center,
//            ),
//            Icon(
//              Icons.android,
//              size: 30,
//            ),
//            CloseButton(),
//            BackButton(
//              color: Colors.amber,
//            ),
//            Chip(
//              avatar: Icon(Icons.print),
//              label: Text('仪器标签'),
//            ),
//            Divider(
//              color: Colors.lightGreen,
//              indent: 10.0,
//              endIndent: 10.0,
//            ),
//            Card(
//              color: Colors.blue,
//              elevation: 5,
//              margin: EdgeInsets.all(10.0),
//              child: Container(
//                padding: EdgeInsets.all(10),
//                child: Text('这是什么啊'),
//              ),
//            ),
//            AlertDialog(
//              title: Text('弹窗的标题'),
//              content: Text('弹窗的内容显示'),
//            ),
//          ],
//        ),
        )));
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print('走到了这里$isByName');
          if (isByName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}

class ThemeChangeEvent {
  bool isNight;

  ThemeChangeEvent(this.isNight);
}
