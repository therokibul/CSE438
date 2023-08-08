import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xff009494);
const lightColor = Color(0xff585555);
  final FirebaseAuth auth = FirebaseAuth.instance;
    final  String uid = auth.currentUser!.uid;

