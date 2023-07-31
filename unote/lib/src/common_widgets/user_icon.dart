import 'package:flutter/material.dart';

import '../constants/const.dart';

class UserIcon extends StatelessWidget {
  UserIcon({super.key, required this.color, required this.onTap});
  final Color color;
  
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.grey.shade300,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.person,
          color: primaryColor,
        ),
      ),
    );
  }
}
