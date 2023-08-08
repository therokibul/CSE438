import 'package:flutter/material.dart';
import 'package:unote/screens/widgets/user_icon.dart';
import 'package:unote/utils/const.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Where does it come from?',
              textScaleFactor: 2,
              style: TextStyle(
                color: primaryColor,
              ),
            ),
            Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
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
