import 'package:flutter/material.dart';
import 'package:students_app/Departments/Departments.dart';

import '../subjeccts_of_departments/chemistry_subjects.dart';
import '../subjeccts_of_departments/physics_subject.dart';

class LevelsOfPhysics extends StatelessWidget {
  const LevelsOfPhysics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "CHOOSE THE YEAR YOU WANT TO SEE IT'S SUBJECTS: ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.blue),
          ),
          const SizedBox(
            height: 30,
          ),
          MenuItemButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubjectOfPhysics()));
            },
            trailingIcon: Icon(Icons.arrow_circle_right, size: 40),
            child: const Text(
              "First Level",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MenuItemButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubjectOfPhysics()));
            },
            trailingIcon: Icon(Icons.arrow_circle_right, size: 40),
            child: const Text(
              "Second Level",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MenuItemButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubjectOfPhysics()));
            },
            trailingIcon: Icon(Icons.arrow_circle_right, size: 40),
            child: const Text(
              "Third Level",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MenuItemButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubjectOfPhysics()));
            },
            trailingIcon: Icon(Icons.arrow_circle_right, size: 40),
            child: const Text(
              "Fourth Level",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
