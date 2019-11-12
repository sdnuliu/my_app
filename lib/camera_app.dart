import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<File> _images=[];

  Future getImage(bool istakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: istakePhoto ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照App'),
        leading: BackButton(),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _imageListShow(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _selectImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 120,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('选取照片', false),
                ],
              ),
            ));
  }

  _item(String showTitle, bool istakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(istakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(showTitle),
      ),
      onTap: () => getImage(istakePhoto),
    );
  }

  _imageListShow() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 110,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(Icons.close,size: 13,color: Colors.white,),
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}
