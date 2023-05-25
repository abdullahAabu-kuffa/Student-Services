import 'package:flutter/material.dart';
import 'package:students_app/Departments/Departments.dart';

class DepartementsPage extends StatefulWidget {
  const DepartementsPage({super.key});

  @override
  State<DepartementsPage> createState() => _DepartementsPageState();
}

class _DepartementsPageState extends State<DepartementsPage> {
  @override
  Widget build(BuildContext context) {
    return const Departments(title: 'sdfa');
  }
}
