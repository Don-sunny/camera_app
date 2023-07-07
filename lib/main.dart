import 'package:camera_app_project/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ImageModelAdapter().typeId)) {
    Hive.registerAdapter(ImageModelAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camera App',
        theme: ThemeData(
            primarySwatch: Colors.orange, brightness: Brightness.light),
        home: ScreenSplash());
  }
}
