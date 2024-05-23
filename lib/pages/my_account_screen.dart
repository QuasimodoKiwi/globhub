import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/accounts.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'group_chat_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccount extends StatefulWidget {
  Account account;
  MyAccount(this.account);
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  List<Account> accounts = [];
  String? userNameInput;
  String? statusInput;

  TextEditingController name = TextEditingController();
  TextEditingController status = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _features_visibility = true;
  bool _edit_visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_features_visibility == true) {
                _features_visibility = false;
                _edit_visibility = true;
              } else {
                _features_visibility = true;
                _edit_visibility = false;
              }
            });
          },
          child: Icon(Icons.edit),
          elevation: 10.0,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        appBar: AppBar(title: Text("Welcome, ${widget.account.user_name}!")),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                  leading: Icon(Icons.group),
                  title: Text("Group Chat"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupChat(widget.account)));
                  }),
              ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("My Account"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAccount(widget.account)));
                  }),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log out"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  }),
            ],
          ),
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
          return _myAccount(accounts);
        });
  }

  Widget _myAccount(List<Account> accounts) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/galaxy.jpg'),
        fit: BoxFit.fitHeight,
      )),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://truepic.net/wp-content/uploads/2018/12/Image-Vietnamese-Model-Best-collection-of-beautiful-girls-in-Vietnam-2018%E2%80%93Part-6-TruePic.net_.jpg'),
                        ),
                      ),
                      Text(
                        "${widget.account.user_name}",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "${widget.account.status}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _features_visibility,
                child: SizedBox(
                  width: 300,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "My Profile",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "Favorites",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: _edit_visibility,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              initialValue: "${widget.account.user_name}",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name cannot be blank!";
                                }
                              },
                              onSaved: (value) {
                                userNameInput = value;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "Your Name:",
                                  labelStyle: TextStyle(color: Colors.white)),
                            ),
                            TextFormField(
                              initialValue: "${widget.account.status}",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Can't leave status blank!";
                                }
                              },
                              onSaved: (value) {
                                if (widget.account != null) {
                                  statusInput = value;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "Your Status:",
                                  labelStyle: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    widget.account.setUserName(userNameInput!);
                                    widget.account.setStatus(statusInput!);
                                    setState(() {});
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
                                  fixedSize: MaterialStateProperty.all(
                                      Size(150.0, 50.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Container(
                width: 500,
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 1, color: Colors.white))),
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 100,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.logout, color: Colors.white, size: 35),
                        Text("Logout",
                            style: TextStyle(color: Colors.white, fontSize: 25))
                      ],
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
