import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:students_app/Departments/BotanyPage.dart';
import 'package:students_app/Departments/ChemistryPage.dart';
import 'package:students_app/Departments/GeologyPage.dart';
import 'package:students_app/Departments/MathematicsPage.dart';
import 'package:students_app/Departments/PhysicsPage.dart';
import 'package:students_app/Departments/ZoologyPage.dart';

final Color darkBlue = const Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), //.copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: [
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
              return const ChemistryPage();
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
              return const PhysicsPage();
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
              return const MathematicsPage();
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
              return const GeologyPage();
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
              return const ZoologyPage();
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
              return const BotanyPage();
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
