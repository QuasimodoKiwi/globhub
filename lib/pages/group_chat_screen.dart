import 'dart:ui';
import 'package:boss_level_challenge_5/pages/my_account_screen.dart';
import 'package:boss_level_challenge_5/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/accounts.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class GroupChat extends StatefulWidget {
  Account account;
  GroupChat(this.account);
  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  TextEditingController _messageController = TextEditingController();
  List user_messages = [];
  @override
  void sendMessage() {
    user_messages.add(_messageController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Group Chat Screen"),
      ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/milky_way.jpg'),
                fit: BoxFit.fitHeight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              margin: EdgeInsets.only(top: 40),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      CircleAvatar(
                        child: Image.asset('assets/smiling_man.jpg'),
                      )
                    ],
                  ),
                ),
                title: Text("Jonathan Ober"),
                subtitle: Text("Online Now"),
                trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.phone, size: 30)),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.video_call,
                            size: 30,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    child: Text(
                      "Mon 4:30 PM",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.pinkAccent],
                                stops: [0, 0.6]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Text(
                          "Hey, what's up?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 80,
                          width: 200,
                          margin: EdgeInsets.only(right: 20, bottom: 20),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )),
                          child: Text(
                            "Nothing much. How about you?",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.pinkAccent],
                                  stops: [0, 0.6]),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                          child: Text(
                            "Eh, you know how it is with classes. Just doing what I can to pass.",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    child: Text(
                      "Mon 4:50 PM",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, bottom: 20),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                            child: Text(
                              "We just finished for the semester, it was getting really busy towards the end. Best of luck to you, though.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.pinkAccent],
                                stops: [0, 0.6]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Text(
                          "Thanks, I appreciate it.",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.pinkAccent],
                                stops: [0, 0.6]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Text(
                          "I'll do my best in these last couple of weeks, I'll need as much luck as I can!!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, bottom: 20),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                            child: Text(
                              "That's the spirit! You got this, you survived every past semester thrown at you, you can endure this!",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                  for (var i = 0; i < user_messages.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 20, bottom: 20),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                              child: Text(
                                user_messages[i],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            //Bottom
            Container(
              color: Colors.white70,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Type your message"),
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.send),
                    onPressed: () => sendMessage(),
                  ),
                  Icon(
                    Icons.attach_file,
                    size: 30,
                  ),
                  Icon(Icons.mic, size: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
