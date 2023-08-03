import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unote/src/constants/const.dart';
import 'package:unote/src/features/authentication/auth_check.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          prefixIconColor: primaryColor,
          filled: true,
          fillColor: const Color(0xffd9d9d9).withOpacity(0.31),
          
        ),
      ),
      home: const AuthCheck(),
      // home: const SplashScreen(),
    );
  }
}
