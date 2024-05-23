import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';

import '../model/accounts.dart';
import '../services/firestoreServices.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late List<Account> accounts;
  MyFirestoreService service = new MyFirestoreService();

  String? email;
  String? username;
  String? password;
  String? confirmPassword;

  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/cropped-astronaut_window.jpg'),
                fit: BoxFit.fitHeight)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 150,
                alignment: Alignment.center,
                child: Text(
                  "Sign up to join our community!",
                  style: GoogleFonts.pacifico(
                      textStyle: TextStyle(fontSize: 45, color: Colors.white)),
                ),
              ),
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name.';
                                  }
                                },
                                onSaved: (value) {
                                  username = value!;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.perm_identity,
                                      color: Colors.white,
                                    ),
                                    hintText: "Your Name",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email.';
                                  }
                                },
                                onSaved: (value) {
                                  email = value!;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password.';
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.password,
                                      color: Colors.white,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                                onSaved: (value) {
                                  password = value!;
                                },
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the confirm password.';
                                  }
                                  if (value! != password) {
                                    return 'Passwords do not match.';
                                  }
                                },
                                onSaved: (value) {
                                  confirmPassword = value!;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.password,
                                      color: Colors.white,
                                    ),
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> data = {
                              "email": email,
                              "password": password,
                              "status": "New to this platform.",
                              'user_name': username
                            };
                            service.addDocument(data);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.volkhov(
                              textStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(0.8)),
                          fixedSize:
                              MaterialStateProperty.all(Size(150.0, 50.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
