import 'package:flutter/material.dart';
import 'package:students_app/Departments/BotanyPage.dart';

class SubjectsOfBotany extends StatelessWidget {
  const SubjectsOfBotany({super.key});

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
                return const BotanyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/b1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Plant Anatomy and Morphology',
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
                return const BotanyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/b2.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Plant Taxonomy',
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
                return const BotanyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/b3.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Plant Genetics',
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
