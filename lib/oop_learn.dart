//Dart里面所有的类都继承Object
class Student extends Person {
  String _school; //通过下划线来标识私有变量
  String city;
  String country;
  String name;

  //{}标识可选参数
  //country 默认参数
  Student(this._school, String name, int age,
      {this.city, this.country = 'China'})
      : name = '$country.$city',
        super(name, age) {
    print('构造方法体不是必须的');
  }

  //命名构造方法[类名.方法名]
  Student.cover(Student stu) : super(stu.name, stu.age);

  //命名工厂构造方法：factory [类名.方法名]
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }
}

class Logger {
  //工厂构造方法
  static Logger _cache;

  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}

class Person {
  String name;
  int age;

  //标准的构造方法
  Person(this.name, this.age);

  @override
  String toString() {
    return 'name:$name,age:$age';
  }
}
