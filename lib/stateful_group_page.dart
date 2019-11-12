import 'package:flutter/material.dart';

class StateFullGroup extends StatefulWidget {
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}

class _StateFullGroupState extends State<StateFullGroup> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.amber, fontSize: 20);
    return  Scaffold(
        appBar: AppBar(
          title: Text('Statefulwidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                title: Text('拍照'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                title: Text('拍照2'),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('按钮'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'http://docs.jiguang.cn/img/doc_cn.png',
                            width: 200,
                            height: 32,
                          ),
                          Container(
                            height: 100,
                            child: PageView(
                              children: <Widget>[
                                _item('page1', Colors.blue),
                                _item('page2', Colors.red),
                                _item('page3', Colors.lightGreen),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Text('第二个页面'),
      );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 1000));
    return null;
  }

  _item(String s, MaterialColor blue) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: blue),
      child: Text(
        s,
        style: TextStyle(color: Colors.black, fontSize: 22),
      ),
    );
  }
}
