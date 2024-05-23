import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../model/accounts.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/moon.jpg'),
          fit: BoxFit.fitHeight,
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "GlobHub",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(fontSize: 50, color: Colors.white)),
              ),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\"a community that's out of this world. - Jeff Bezos\"",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cutive(
                          textStyle:
                              TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.volkhov(
                            textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.8)),
                        fixedSize: MaterialStateProperty.all(Size(150.0, 50.0)),
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
