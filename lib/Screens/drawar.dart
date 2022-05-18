import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garelluapp/Screens/Login/Login_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu.dart';

String namee = "", phonee = "", ids = "";

class MainDrawar extends StatefulWidget {
  @override
  _MainDrawarState createState() => _MainDrawarState();
}

class _MainDrawarState extends State<MainDrawar> {
  Future getvender() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var name = sharedPreferences.getString("Name");
    var phone = sharedPreferences.getString("Phone");
    var id = sharedPreferences.getString("venderId");

    setState(() {
      namee = name;
      phonee = phone;
      ids = id;
    });
  }

  @override
  void initState() {
    super.initState();
    getvender();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Container(
                    width: media.width * 0.15,
                    height: media.height * 0.20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Image.asset("assets/logo.png"),
                  ),
                  SizedBox(width: media.width * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namee,
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "0" + phonee.substring(3),
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(
                  Icons.free_breakfast_outlined,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "My Menu",
                  style: GoogleFonts.quicksand(
                      fontSize: 15, color: Colors.black38),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.contact_page_rounded,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Terms and Conditions",
                style:
                    GoogleFonts.quicksand(fontSize: 15, color: Colors.black38),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.blueAccent,
              ),
              title: Text(
                "About Us",
                style:
                    GoogleFonts.quicksand(fontSize: 15, color: Colors.black38),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.blueAccent,
              ),
              onTap: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('Number');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              title: Text(
                "Log Out",
                style: GoogleFonts.quicksand(
                    fontSize: 15, color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
