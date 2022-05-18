import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:garelluapp/Provider/UserModel.dart';
import 'package:garelluapp/Screens/Login/Login_screen.dart';
import 'package:garelluapp/Screens/Mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: VenderProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gharelu Vender',
          home: WelcomeScreen()),
    );
  }
}

String finalnumber;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Future getvalidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var getNumber = sharedPreferences.getString('Number');

    setState(() {
      finalnumber = getNumber;
    });
  }

  void initState() {
    super.initState();
    getvalidation().whenComplete(() async {
      Timer(
          Duration(seconds: 4),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalnumber == null ? LoginScreen() : Mainscreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              scale: 18,
            ),
          ),
          SizedBox(height: 80),
          CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}
