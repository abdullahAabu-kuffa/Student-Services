import 'package:flutter/material.dart';
import 'package:students_app/WelcomePages/welPageOfFacultyOfScience.dart';

class MathematicsW extends StatelessWidget {
  const MathematicsW({super.key});

  @override
  Widget build(BuildContext context) {
    return const FacultyOfScience(
      imageName: 'math.png',
      textWelcome: 'Department of Mathematics',
      textAbout:
          '“Mathematics is the queen of sciences” –As said by Carl Friedrich Gauss, the German Mathematician.',
      routeName: 'physics',
    );
  }
}
