import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:students_app/MainPage/mainPage.dart';
import 'package:students_app/MainPage/searchPage.dart';

import 'WelcomePages/welPageOfFacultyOfScience.dart';
import 'WelcomePages/welPageOfMathematics.dart';
import 'WelcomePages/welPageOfPhysics.dart';
import 'WelcomePages/welPageOfChemistry.dart';
import 'WelcomePages/welPageOfZoology&Entomology.dart';
import 'WelcomePages/welPageOfBotany&Microbiology.dart';
import 'WelcomePages/welPageOfGeology.dart';

import 'package:students_app/Auth/logInScreen.dart';
import 'package:students_app/Auth/signUpScreen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: 'mainPage',
      routes: {
        'facultyOfScience': (context) => const FacultyOfScience(
              imageName: 'FacultyOfScience.png',
              textAbout:
                  'The University of Assiut was established in October 1957, with only two faculties the faculty of Science and the faculty of Engineering.',
              textWelcome: 'Welcome to',
              routeName: 'mathematics',
            ),
        'mathematics': (context) => const Mathematics(),
        'physics': (context) => const Physics(),
        'chemistry': (context) => const Chemistry(),
        'geology': (context) => const Geology(),
        'botanyAndMicrobiology': (context) => const BotanyAndMicrobiology(),
        'zoologyAndEntomology': (context) => const ZoologyAndEntomology(),
        'logInScreen': (context) => const LogIn(),
        'signUpScreen': (context) => const SignUp(),
        'searchPage': (context) => const SearchPage(),
        'mainPage': (context) => const MainPage()
      },
    );
  }
}
