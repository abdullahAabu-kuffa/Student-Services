import 'package:flutter/material.dart';

class DepartementsPage extends StatefulWidget {
  const DepartementsPage({super.key});

  @override
  State<DepartementsPage> createState() => _DepartementsPageState();
}

class _DepartementsPageState extends State<DepartementsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('departements'),
      ),
    );
  }
}
