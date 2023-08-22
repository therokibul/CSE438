import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/screens/home/home_screen.dart';
import 'package:unote/utils/const.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: widget.data['title']);
    TextEditingController bodyController =
        TextEditingController(text: widget.data['body']);
    if (isloading) {
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor.withOpacity(0.1),
          title: const Text('Update Note'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TextField(
                  controller: bodyController,
                  decoration: const InputDecoration(
                    // labelText: 'Title',
                    hintText: "Start Writing here...",
                  ),
                  scrollPadding: const EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  maxLines: 99999,
                  autofocus: true,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {
              isloading = true;
            });
            if (titleController.text.isEmpty && bodyController.text.isEmpty) {
              showEmptyTitleDialog(context);
              setState(() {
                isloading = false;
              });
            } else {
              try {
                await firestore
                    .collection('users')
                    .doc(uid)
                    .collection('notes')
                    .doc(widget.data['id'])
                    .update({
                  'title': titleController.text,
                  'body': bodyController.text,
                  'dateTime': Timestamp.now(),
                });
              } catch (e) {
                print(e.toString());
              }
              Get.to(HomeScreen());
              setState(() {
                isloading = false;
              });
            }
          },
          label: const Text('Save'),
          icon: const Icon(Icons.save),
        ),
      );
    }
  }
}
