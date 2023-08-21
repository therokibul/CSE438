import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unote/screens/add%20Note/add_note.dart';
import 'package:unote/screens/note%20screen/note_screen.dart';
import 'package:unote/screens/profile/profile.dart';

import '../widgets/user_icon.dart';
import '../../utils/const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Stream<QuerySnapshot<Map<String, dynamic>>> _stream =
      firestore.collection('users').doc(uid).collection('notes').snapshots();
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
      body: StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Something went wrong',
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.red,
              ),
            ));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var formattedDate =
                    DateFormat.yMMMd().format(data['dateTime'].toDate());
                return Card(
                  child: ListTile(
                    title: RichText(
                      maxLines: 4,
                      text: TextSpan(
                        text: '${data['title']} \n',
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '${data['body']} ',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff585555),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      '$formattedDate \n',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteScreen(
                                  noteId: data['id'],
                                  data: data,
                                )),
                      );
                    },
                  ),
                );

                // ListTile(
                //   title: Text(data['title']),
                //   subtitle: Text(data['body']),
                // );
              }).toList(),
            ),
          );
        },
      ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: noteController.axisCount.value,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //   ),
      //   itemCount: noteController.notes.length,
      //   itemBuilder: (context, index) {
      //     var formattedDate = DateFormat.yMMMd()
      //         .format(noteController.notes[index].creationDate.toDate());

      //     return Card(
      //       child: ListTile(
      //         title: RichText(
      //           maxLines: 4,
      //           text: TextSpan(
      //             text: '${noteController.notes[index].title} \n',
      //             style: const TextStyle(
      //               color: primaryColor,
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //             children: [
      //               TextSpan(
      //                 text: '${noteController.notes[index].body} ',
      //                 style: const TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 16,
      //                   fontStyle: FontStyle.italic,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         subtitle: Text(
      //           '$formattedDate \n',
      //           style: const TextStyle(
      //             fontStyle: FontStyle.italic,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewNote());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
