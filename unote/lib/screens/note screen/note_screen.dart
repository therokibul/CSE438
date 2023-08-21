import 'package:flutter/material.dart';
import 'package:unote/screens/widgets/user_icon.dart';
import 'package:unote/utils/const.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, required this.noteId, required this.data});
  final String noteId;
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            'Collaborate with',
                            textScaleFactor: 2,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: primaryColor,
                            child: const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.share,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              data['title'],
              textScaleFactor: 2,
              style: const TextStyle(
                color: primaryColor,
              ),
            ),
            Text(data['body']),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            UserIcon(
              color: Colors.teal,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            UserIcon(
              color: Colors.cyan,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
