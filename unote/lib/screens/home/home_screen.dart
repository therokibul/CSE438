import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unote/controller/note_controller.dart';
import 'package:unote/screens/add%20Note/add_note.dart';
import 'package:unote/screens/profile/profile.dart';

import '../widgets/user_icon.dart';
import '../../utils/const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  NoteController noteController = Get.put(NoteController());
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
              Get.to(ProfileScreen());
            },
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: noteController.axisCount.value,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: noteController.notes.length,
        itemBuilder: (context, index) {
          var formattedDate = DateFormat.yMMMd()
              .format(noteController.notes[index].creationDate.toDate());

          return Card(
            child: ListTile(
              title: RichText(
                maxLines: 4,
                text: TextSpan(
                  text: '${noteController.notes[index].title} \n',
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '${noteController.notes[index].body} ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text('$formattedDate \n'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewNote());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
