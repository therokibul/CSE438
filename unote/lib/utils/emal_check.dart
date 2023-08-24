import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> checkEmailExists(String email) async {
  try {
    List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    if (signInMethods.isEmpty) {
      // Email does not exist in Firebase Authentication
      Get.snackbar('Email does not exist.', email);
      // print('Email does not exist.');
    } else {
      // Email exists, and signInMethods contains the sign-in methods available for this email
      print('Email exists. Sign-in methods: $signInMethods');
    }
  } catch (error) {
    // Handle any errors that occur
    print('Error checking email existence: $error');
  }
}
