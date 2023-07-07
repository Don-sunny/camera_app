import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model.dart';

ValueNotifier<List<ImageModel>> ImageListNotifier = ValueNotifier([]);

Future<void> addImage(ImageModel value) async {
  // print(StudentListNotifier.value);
  final DB = await Hive.openBox<ImageModel>('box');
  await DB.add(value);
  ImageListNotifier.value.add(value);
  ImageListNotifier.notifyListeners();
}

Future<void> getAllImages() async {
  final DB = await Hive.openBox<ImageModel>('box');
  ImageListNotifier.value.clear();
  ImageListNotifier.value.addAll(DB.values);
  ImageListNotifier.notifyListeners();
}

Future<void> delete(int id) async {
  final DB = await Hive.openBox<ImageModel>('box');
  await DB.delete(id);
  getAllImages();
}
