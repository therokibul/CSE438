import 'package:flutter/material.dart';
import 'package:unote/src/constants/const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'UNote',
          
          style: TextStyle(color: primaryColor,),
        ),
      ),
    );
  }
}
