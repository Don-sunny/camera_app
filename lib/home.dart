import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'function.dart';
import 'image.dart';
import 'model.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  File? Image1;
  Future<void> picker() async {
    final imageSelected =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      setState(() {
        Image1 = File(imageSelected.path);
        final image = ImageModel(imgpath: Image1?.path ?? 'no-image');
        addImage(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllImages();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'G A L L E R Y',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: ImageListNotifier,
          builder: (context, List<ImageModel> imageList, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  final data = imageList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenImage(images: data),
                          ));
                    },
                    child: Container(
                        width: 160.0,
                        height: 160.0,
                        child: Image.file(
                          File(data.imgpath),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )),
                  );
                },
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          picker();
        },
        child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
