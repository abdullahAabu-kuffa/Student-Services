import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/note_reader.dart';
import '../screens/note_editor.dart';
import '../style/app_style.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Recent Notes",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NoteReaderScreen(note)));
                                }, note))
                            .toList(),
                      );
                    }
                    return Text(
                      "there's no Notes",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoteEditorScreen()));
          },
          label: Text("Add Note"),
          icon: Icon(Icons.add),
        ));
  }
}
