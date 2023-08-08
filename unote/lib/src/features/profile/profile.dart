import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unote/src/features/authentication/auth_check.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () {
                _auth.signOut().whenComplete(() => Get.to(const AuthCheck()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
