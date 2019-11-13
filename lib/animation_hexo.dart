import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class AnimationHexo extends StatefulWidget {
  @override
  _AnimationHexoState createState() => _AnimationHexoState();
}

class _AnimationHexoState extends State<AnimationHexo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hexo Animation'),
        leading: BackButton(),
      ),
      body: Center(
        child: Container(
          child: HexoAnimation(),
        ),
      ),
    );
  }
}

class HexoAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Center(
      child: PhotoHero(
        photo:
            'https://www.baidu.com/img/bd_logo1.png',
        width: 200.0,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Next Page'),
                leading: BackButton(),
              ),
              body: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                  photo:'https://www.baidu.com/img/bd_logo1.png',
                  width: 100.0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return new SizedBox(
      width: width,
      child: new Hero(
        tag: photo,
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
