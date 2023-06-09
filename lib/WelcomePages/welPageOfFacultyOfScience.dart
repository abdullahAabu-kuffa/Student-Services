import 'package:flutter/material.dart';

class FacultyOfScience extends StatelessWidget {
  const FacultyOfScience(
      {super.key,
      required this.imageName,
      required this.textWelcome,
      required this.textAbout,
      required this.routeName});
  final String imageName;
  final String textWelcome;
  final String textAbout;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/$imageName"),
                  fit: BoxFit.cover,
                  opacity: 0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 160),
                Column(children: [
                  Text(
                    textWelcome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Assiut University',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    'Overview                                       ',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    textAbout,
                    style: const TextStyle(color: Colors.white60, fontSize: 22),
                  ),
                ]),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Skip',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
