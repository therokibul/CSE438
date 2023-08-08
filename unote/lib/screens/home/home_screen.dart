import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unote/screens/new%20note/new_note.dart';
import 'package:unote/screens/profile/profile.dart';

import '../widgets/user_icon.dart';
import '../../utils/const.dart';
import '../note screen/note_screen.dart';

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
            onTap: () {
              Get.to( ProfileScreen());
            },
          )
        ],
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return noteContainer(() {
            Get.to(const NoteScreen());
          });
        },
      ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 10,
      //   padding: const EdgeInsets.all(10),
      //   mainAxisSpacing: 10,
      //   children: [
      //     noteContainer(() {
      //       Get.to(const NoteScreen());
      //     }),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //     noteContainer(() {}),
      //   ],
      // ),
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
