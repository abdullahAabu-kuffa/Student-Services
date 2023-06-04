import 'package:flutter/material.dart';
import 'package:students_app/Departments/pdfbutton.dart';

class ZoologyPage extends StatelessWidget {
  const ZoologyPage({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Zoology_data(title: 'Zoology Department');
  }
}

class Zoology_data extends StatelessWidget {
  final String title;
  const Zoology_data({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          Chapter1(),
          Chapter2(),
          Chapter3(),
          Chapter4(),
          Chapter5(),
          Chapter6(),
        ],
      ),
    );
  }
}
