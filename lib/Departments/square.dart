import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:students_app/Departments/BotanyPage.dart';
// import 'package:students_app/Departments/ChemistryPage.dart';
// import 'package:students_app/Departments/GeologyPage.dart';
// import 'package:students_app/Departments/MathematicsPage.dart';
// import 'package:students_app/Departments/PhysicsPage.dart';
// import 'package:students_app/Departments/ZoologyPage.dart';
import 'package:students_app/Levels_of_departments/levels_of_botany.dart';
import 'package:students_app/Levels_of_departments/levels_of_chem_dep.dart';
import 'package:students_app/Levels_of_departments/levels_of_geoDep.dart';
import 'package:students_app/Levels_of_departments/levels_of_mathematics.dart';
import 'package:students_app/Levels_of_departments/levels_of_phyiscsDep.dart';
import 'package:students_app/Levels_of_departments/levels_of_zoologyDep.dart';

const Color darkBlue = Color.fromARGB(255, 1, 87, 155);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), //.copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: const [
          Chemistry(),
          Physics(),
          Mathematics(),
          Geology(),
          Zoology(),
          Botany(),
        ]),
      ),
    );
  }
}

class Chemistry extends StatelessWidget {
  const Chemistry({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfChemistery();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/chemistry.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Chemistry Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Physics extends StatelessWidget {
  const Physics({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfPhysics();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Physics.jpeg"), fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Physics Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mathematics extends StatelessWidget {
  const Mathematics({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfMathematics();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Mathematics.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Mathematics Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Geology extends StatelessWidget {
  const Geology({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfGeology();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Geology.jpeg"), fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Geology Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Zoology extends StatelessWidget {
  const Zoology({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfZoology();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Zoology.jpeg"), fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Zoology Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Botany extends StatelessWidget {
  const Botany({super.key});

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LevelsOfBotany();
            }));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Botany.jpeg"), fit: BoxFit.cover),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Botany Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
