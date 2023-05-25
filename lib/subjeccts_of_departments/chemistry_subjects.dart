import 'package:flutter/material.dart';
import 'package:students_app/Departments/ChemistryPage.dart';

class SubjectsOfChemistery extends StatelessWidget {
  const SubjectsOfChemistery({super.key});

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
                return const ChemistryPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/g1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'General Chemistry',
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
                return const ChemistryPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/A1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Analytical Chemistryt',
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
                return const ChemistryPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/i1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Inorganic Chemistry',
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
                return const ChemistryPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/o1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Organic Chemistry',
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
