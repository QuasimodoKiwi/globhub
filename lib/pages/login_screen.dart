import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'group_chat_screen.dart';
import 'signup_screen.dart';
import '../model/accounts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Account> accounts = [];

  final _formKey = GlobalKey<FormState>();
  String checkPassword = "";
  String checkEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('accounts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          accounts = [];
          for (DocumentSnapshot doc in snapshot.data!.docs) {
            accounts.add(Account.fromSnapshot(doc));
          }
          return _loginScreen(accounts);
        });
  }

  _loginScreen(List<Account> accounts) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
              image: AssetImage('assets/astronaut_floating.jpg'),
              fit: BoxFit.fitHeight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "GlobHub",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(fontSize: 50, color: Colors.white)),
              ),
            ),
          ),
          Container(
            height: 450,
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 380,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: "Enter email",
                              hintStyle: TextStyle(color: Colors.white)),
                          onSaved: (value) {
                            checkEmail = value!;
                          },
                          validator: (checkEmail) {
                            if (checkEmail!.isEmpty) {
                              return "Email field is empty.";
                            }
                          },
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              hintText: "Enter password",
                              hintStyle: TextStyle(color: Colors.white)),
                          onSaved: (value) {
                            checkPassword = value!;
                          },
                          validator: (checkPassword) {
                            if (checkPassword!.isEmpty) {
                              return "Password empty.";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      for (Account account in accounts) {
                        if (checkPassword == account.password &&
                            checkEmail == account.email) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAccount(account)));
                        }
                      }
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.volkhov(
                        textStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.black.withOpacity(0.8)),
                    fixedSize: MaterialStateProperty.all(Size(150.0, 50.0)),
                  ),
                ),
                Text(
                  "Sign in for unlimited possibilities!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cabinCondensed(
                      textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
