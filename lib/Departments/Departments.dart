// ignore: file_names
import 'package:flutter/material.dart';
import 'package:students_app/Departments/square.dart';

Color mainColor = const Color.fromARGB(255, 88, 172, 236);

class Departments extends StatelessWidget {
  final String title;
  const Departments({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ListView(
            children:  const [
              Chemistry(),
              Physics(),
              Mathematics(),
              Geology(),
              Zoology(),
              Botany(),
            ],
          ),
        ),
      ),
    );
  }
}
