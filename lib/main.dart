import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<File> pickImage() async {
      final PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
      final File file = File(pickedFile.path);
      return file;
    }

    Future<File> pickGalleryImage() async {
      final PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      final File file = File(pickedFile.path);
      return file;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Pick an Image from Camera'),
              onPressed: () async {
                final File imageFile = await pickImage();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(imageFile)));
              },
            ),
            ElevatedButton(
              child: Text('Pick an Image from Gallery'),
              onPressed: () async {
                final File imageFile = await pickGalleryImage();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(imageFile)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final File imageFile;
  ImageScreen(this.imageFile);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Picked Image')),
      body: Image.file(imageFile),
    );
  }
}



