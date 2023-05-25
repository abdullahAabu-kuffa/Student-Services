import 'package:flutter/material.dart';
import 'package:students_app/Departments/GeologyPage.dart';

class SubjectsOfGeology extends StatelessWidget {
  const SubjectsOfGeology({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "CHOOSE THE SUBJECT: ",
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
          InkWell(
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
                    image: AssetImage("assets/geo1.png"),
                    fit: BoxFit.fill,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'mineralogy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
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
                    image: AssetImage("assets/geo2.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Environmental Geology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
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
                    image: AssetImage("assets/geo4.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Structural Geology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
