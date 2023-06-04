import 'package:flutter/material.dart';
import 'package:students_app/Departments/ZoologyPage.dart';

class SubjectsOfZoology extends StatelessWidget {
  const SubjectsOfZoology({super.key});

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
                return const ZoologyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/zo1.png"),
                    fit: BoxFit.fill,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Physiology',
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
                return const ZoologyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ZO2.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Physiology',
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
                return const ZoologyPage();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/zo3.png"),
                    fit: BoxFit.cover,
                    opacity: 0.8),
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Cell and Molecular Biology',
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
