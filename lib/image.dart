import 'dart:io';
import 'package:flutter/material.dart';

import 'function.dart';
import 'home.dart';
import 'model.dart';

class ScreenImage extends StatelessWidget {
  ImageModel images;
  ScreenImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete'),
                      content: Text('Do yo want to Delete'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('DELETE'),
                          onPressed: () {
                            delete(images.key);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScreenHome(),
                                ));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              File(images.imgpath),
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            )
          ],
        ),
      )),
    );
  }
}
