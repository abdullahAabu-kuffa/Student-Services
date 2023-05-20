// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:students_app/Departments/pdf.dart';

class Chapter1 extends StatelessWidget {
  const Chapter1({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 1',
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

class Chapter2 extends StatelessWidget {
  const Chapter2({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 2',
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

class Chapter3 extends StatelessWidget {
  const Chapter3({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 3',
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

class Chapter4 extends StatelessWidget {
  const Chapter4({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 4',
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

class Chapter5 extends StatelessWidget {
  const Chapter5({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 5',
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

class Chapter6 extends StatelessWidget {
  const Chapter6({super.key});

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
              return PDFReaderApp();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100, //MediaQuery.of(context).size.width * .08,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xff052845),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Chapter 6',
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

class PreviousPage extends StatelessWidget {
  const PreviousPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("PDF Reader Example"), actions: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios))
    ]));
  }
}
