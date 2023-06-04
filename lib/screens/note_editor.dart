import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String color_id = (Random().nextInt(AppStyle.cardsColor.length)).toString();
  // int color_id = int.parse(color_ids);
  String date = DateTime.now().toString();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[int.parse(color_id)],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": int.parse(color_id),
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("failed to add new note due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
