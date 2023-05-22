import 'package:flutter/material.dart';
import 'package:students_app/WelcomePages/welPageOfFacultyOfScience.dart';

class PhysicsW extends StatelessWidget {
  const PhysicsW({super.key});

  @override
  Widget build(BuildContext context) {
    return const FacultyOfScience(
      imageName: 'phy.png',
      textWelcome: 'Department of Physics',
      textAbout:
          'Discoveries in physics have formed the foundation of countless technological advances and play an important role in many scientific areas which make it one of the most fundamental scientific disciplines.',
      routeName: 'chemistry',
    );
  }
}
