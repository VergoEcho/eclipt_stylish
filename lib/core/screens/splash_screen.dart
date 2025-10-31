import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          height: 285,
          width: 285,
          Assets.images.app.logo.path,
        ),
      ),
    );
  }
}
