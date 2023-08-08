import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key, required this.color, required this.onTap});
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
        onPressed: onTap,
        icon: Icon(
          Icons.person,
          color: color,
        ),
      ),
    );
  }
}
