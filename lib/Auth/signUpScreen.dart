// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:students_app/Auth/buttonOfLogIn&SignUp.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _Auth = FirebaseAuth.instance;

  late String name;
  late String email;
  late String password;
  late String confirmPassword;

  bool signLoading = false;
  bool _obscureAction = true;
  bool _obscureActionConfirm = true;
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late var _passwordError = null;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: signLoading,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(35),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/FacultyOfScience.png"),
                fit: BoxFit.cover,
                opacity: 0.2),
          ),
          child: ListView(children: [
            const SizedBox(height: 220),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          name = value;
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: 'name',
                          labelText: 'name',
                          labelStyle: TextStyle(color: Colors.white70),
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.person, color: Colors.white70),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.black38,
                          filled: false,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.white70, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'email',
                          labelText: 'email',
                          labelStyle: TextStyle(color: Colors.white70),
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.email, color: Colors.white70),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.black38,
                          filled: false,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.white54, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: _obscureAction,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'password',
                          labelText: 'password',
                          labelStyle: const TextStyle(color: Colors.white70),
                          hintStyle: const TextStyle(color: Colors.white70),
                          errorText: _passwordError,
                          prefixIcon:
                              const Icon(Icons.password, color: Colors.white70),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureAction = !_obscureAction;
                              });
                            },
                            icon: const Icon(Icons.visibility,
                                color: Colors.white70),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.black38,
                          filled: false,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.white54, width: 1.5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        obscureText: _obscureActionConfirm,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'confirm password',
                          labelText: 'confirm password',
                          labelStyle: const TextStyle(color: Colors.white70),
                          hintStyle: const TextStyle(color: Colors.white70),
                          prefixIcon:
                              const Icon(Icons.password, color: Colors.white70),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureActionConfirm = !_obscureActionConfirm;
                              });
                            },
                            icon: const Icon(Icons.visibility,
                                color: Colors.white70),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.black38,
                          filled: false,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.white54, width: 1.5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  const SizedBox(width: 10),
                  const Text(
                    "Do have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('logInScreen');
                    },
                    child: const Text(
                      'LogIn',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ]),
                ButtonOfLogInSignUp(
                  title: 'Sign up',
                  onPressed: () async {
                    try {
                      setState(() {
                        signLoading = true;
                      });
                      if (password == confirmPassword) {
                        await _Auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        setState(() {
                          signLoading = false;
                        });
                        var snackBar = const SnackBar(
                          content: Text(
                            textAlign: TextAlign.center,
                            'Signup successfully!',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.black54,
                          width: 200,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context)
                            .pushReplacementNamed('logInScreen');
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                'signUpScreen');
                                        signLoading = false;
                                      });
                                    },
                                    child: const Text("Cancel")),
                              ],
                              title: const Text("Error"),
                              content: const Text(
                                'Confirm Password is incorrect',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } catch (e) {
                      setState(() {
                        signLoading = false;
                      });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            title: const Text("Try again"),
                            content: Text(
                              '$e',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                            backgroundColor: Colors.white70,
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
