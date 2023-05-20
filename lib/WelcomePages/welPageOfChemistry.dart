import 'package:flutter/material.dart';
import 'package:students_app/WelcomePages/welPageOfFacultyOfScience.dart';

class ChemistryW extends StatelessWidget {
  const ChemistryW({super.key});

  @override
  Widget build(BuildContext context) {
    return const FacultyOfScience(
      imageName: 'chemistry.jpg',
      textWelcome: 'Department of Chemistry',
      textAbout:
          'The Department of Chemistry is one of the oldest scientific departments in the university. The department has witnessed a great development since its establishment in 1957 with the establishment of the university.',
      routeName: 'geology',
    );
  }
}
