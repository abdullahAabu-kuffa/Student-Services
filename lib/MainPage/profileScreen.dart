// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _Auth = FirebaseAuth.instance;
  late User signedUser;

  void getCurrentUser() {
    try {
      final user = _Auth.currentUser;
      if (user != null) {
        signedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'dfgsdfg',
        style: TextStyle(color: Color.fromARGB(179, 5, 5, 5), fontSize: 22),
      )),
    );
  }
}
