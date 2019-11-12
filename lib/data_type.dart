import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/**
 * 常用数据类型
 */
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(
      child: Text(
        "常用数据类型，查看控制台输出",
        style: TextStyle(color: ColorUtil.color('#F70909')),
      ),
    );
  }

  //数字类型
  void _numType() {
    num num1 = -1.0; //num是数字类型的父类
    num num2 = 2; //既可以接收浮点类型也可以接收整形
    int int1 = 3; //只能接收整数
    double d1 = 3.14; //双精度
    print("num1::$num1 num2::$num2 int::$int1 double::$d1");
    print(num1.abs()); //求绝对值
    print(num2.toDouble()); //转换double
  }

  void _stringType() {
    String str1 = "asd", str2 = "你好"; //字符串可用单引号可用双引号
    String str3 = "str1::$str1 str2::$str2";
    String str4 = str1 + str2;
    print(str3);
    print(str4);
    String str5 = str2.substring(0, 1); //字符串的截取
    print(str5);
    print(str1.indexOf("s")); //位置
  }

  void _boolType() {
    bool bool1 = true, bool2 = false;
    print(bool1);
    print(bool2);
    print(bool1 || bool2); //true
    print(bool1 && bool2); //false
  }

  void _listType() {
    List list = [1, 2, 3, "你好", false]; //初始化一个集合，可以接收任何类型
    print(list);
    List<int> list2 = [1, 2, 3];
    List list3 = [];
    list3.add(1);
    list3.add("Hello Word");
    list3.addAll(list);
    print(list3);
    List list4 = List.generate(3, (index) => index * 2);
    print(list4);
    //遍历集合的方式
//    for(int i=0;i<list.length;i++){
//      print(list[i]);
//    }
//    for(var o in list){
//      print(o);
//    }
    list.forEach((item) => print(item));
  }

  void _mapType() {
    Map names = {"name1": "张三", "name2": "李四"};
    print(names);
    Map names2 = {};
    names2["name3"] = "王五";
    names2["name4"] = "赵六";
    print(names2);
    //map的遍历
    names.forEach((k, v) {
      print("$k,$v");
    });
    Map names3 = names2.map((k, v) {
      //迭代生成一个新的map
      return MapEntry(v, k);
    });
    print(names3);
    for (var key in names2.keys) {
      print("$key ${names2[key]},");
    }
  }

  void _tips() {
    //dynamic var Object的区别
    dynamic x = "abc"; //动态数据类型
    print(x.runtimeType);
    print(x);
    x = 123;
    print(x.runtimeType);
    print(x);
    x = [1, 2, "3"];
    print(x.runtimeType);
    print(x);
    var m = "liu";
    print(m.runtimeType);
    print(m);
    //m=12;  一旦被定义，不能被修改
    Object a = "hello"; //Object与dynamic的不同在于静态类型的检查上
    print(a.runtimeType);
    print(a);
    a = 1234;
    print(a.runtimeType);
    print(a);
  }
}
