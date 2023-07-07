import 'package:flutter/material.dart';

import 'home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt_rounded,
              size: 70,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'My Camera',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      )),
    );
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => ScreenHome())));
  }
}
