import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/src/features/new%20note/new_note.dart';
import 'package:unote/src/features/note%20screen/note_screen.dart';

import '../../common_widgets/user_icon.dart';
import '../../constants/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'UNote',
          style: TextStyle(
            color: primaryColor,
            fontFamily: 'JejuHallasan',
            fontSize: 40,
          ),
        ),
        actions: [
          UserIcon(
            color: primaryColor,
            onTap: () {},
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        children: [
          noteContainer(() {
            Get.to(const NoteScreen());
          }),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
          noteContainer(() {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const NewNote());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  InkWell noteContainer(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 200,
        // width: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reading Notes',
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
              ),
            ),
            Text(
              '01.08.2023',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
