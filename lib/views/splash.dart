import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Get.toNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text("Splash"),
    ));
  }
}
