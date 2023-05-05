import 'package:flutter/material.dart';
import 'package:students_app/WelcomePages/welPageOfFacultyOfScience.dart';

class BotanyAndMicrobiology extends StatelessWidget {
  const BotanyAndMicrobiology({super.key});

  @override
  Widget build(BuildContext context) {
    return const FacultyOfScience(
      imageName: 'Botany.jpg',
      textWelcome: 'Botany and Microbiology Department',
      textAbout:
          'We play an essential role in solving the environmental problems and in community services through cooperating with other scientific faculties and organizations through preparing a distinguished generation of scientists for the scientific, educational and industrial fields.',
      routeName: 'zoologyAndEntomology',
    );
  }
}
