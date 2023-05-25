import 'package:flutter/material.dart';
import 'package:students_app/WelcomePages/welPageOfFacultyOfScience.dart';

class GeologyW extends StatelessWidget {
  const GeologyW({super.key});

  @override
  Widget build(BuildContext context) {
    return const FacultyOfScience(
      imageName: 'geology.jpg',
      textWelcome: 'Department of Geology',
      textAbout:
          'Geoscientists gather and interpret data about the earth and other planets;  they use their knowledge to increase our understanding of the earth processes and to improve the quality of human life. Their work and career paths vary widely because the Geosciences are so broad and diverse.',
      routeName: 'botanyAndMicrobiology',
    );
  }
}
