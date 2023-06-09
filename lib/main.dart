import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:students_app/MainPage/home_page.dart';
import 'package:students_app/MainPage/searchPage.dart';
import 'package:students_app/database/table.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: 'facultyOfScience',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'homePage':
            {
              return MaterialPageRoute(builder: (context) {
                return const HomePage();
              });
            }
          case 'tableScreen':
            {
              return MaterialPageRoute(builder: (context) {
                return const TableData();
              });
            }
        }
        return null;
      },
      routes: {
        'facultyOfScience': (context) => const FacultyOfScience(
              imageName: 'FacultyOfScience.png',
              textAbout:
                  'The University of Assiut was established in October 1957, with only two faculties the faculty of Science and the faculty of Engineering.',
              textWelcome: 'Welcome to',
              routeName: 'mathematics',
            ),
        'mathematics': (context) => const MathematicsW(),
        'physics': (context) => const PhysicsW(),
        'chemistry': (context) => const ChemistryW(),
        'geology': (context) => const GeologyW(),
        'botanyAndMicrobiology': (context) => const BotanyAndMicrobiology(),
        'zoologyAndEntomology': (context) => const ZoologyAndEntomology(),
        'logInScreen': (context) => const LogIn(),
        'signUpScreen': (context) => const SignUp(),
        'searchPage': (context) => const SearchPage(),
        'homePage': (context) => const HomePage(),
        'tableScreen': (context) => const TableData(),
      },
    );
  }
}
