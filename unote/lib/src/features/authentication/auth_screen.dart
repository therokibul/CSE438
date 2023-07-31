import 'package:flutter/material.dart';
import 'package:unote/src/constants/const.dart';
import 'package:unote/src/features/home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'UNote',
              style: TextStyle(
                color: primaryColor,
                fontFamily: 'JejuHallasan',
                fontSize: 80,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Container(
                width: double.infinity,
                // height: 45,
                margin: const EdgeInsets.all(40),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(
                      width: 2,
                      color: primaryColor,
                    )),
                child: Row(
                  children: [
                    Image.asset('assets/images/google.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Login With Google',
                      textScaleFactor: 2.1,
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
