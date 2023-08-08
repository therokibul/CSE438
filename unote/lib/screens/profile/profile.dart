import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/utils/auth_check.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var user = _auth.currentUser;
    String userPhoto = user!.photoURL ?? "";
    String userName = user.displayName ?? "";
    String userEmail = user.email ?? "";
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
            radius: Get.width * 0.2,
            backgroundImage: NetworkImage(userPhoto),
          ),
          Card(
            child: ListTile(
              title: Text(
                userName,
                textScaleFactor: 1.3,
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                userEmail,
                textScaleFactor: 1.3,
              ),
            ),
          ),
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
