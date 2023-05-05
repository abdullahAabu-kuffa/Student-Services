import 'package:flutter/material.dart';

class ButtonOfLogInSignUp extends StatelessWidget {
  const ButtonOfLogInSignUp(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      color: Colors.lightBlue[900],
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 250,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
  }
}
