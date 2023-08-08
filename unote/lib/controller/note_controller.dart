import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/models/note_model.dart';
import 'package:unote/services/database.dart';

import '../utils/const.dart';

class NoteController extends GetxController {
  RxList<NoteModel> noteList = RxList<NoteModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;
  List<NoteModel> get notes => noteList.value;
 Rx<int> axisCount = 2.obs;
  @override
  void onInit() {
    print('Note Controller onit : $uid');
    noteList.bindStream(Database().noteStream(uid));
    super.onInit();
  }
 
  }

