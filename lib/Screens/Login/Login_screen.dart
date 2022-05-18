import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Mainscreen.dart';
import 'Auth_service.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _phonelogin = GlobalKey<FormState>();
  String _numbercontroller;
  String phonenumber;
  final String countrycode = '+92';
  Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.15,
              ),
              CircleAvatar(
                child: Image.asset(
                  'assets/logo.png',
                  scale: 18,
                ),
                radius: 80,
              ),
              SizedBox(height: size.height * 0.12),
              SizedBox(
                width: size.width * 0.7,
                child: Form(
                  key: _phonelogin,
                  child: TextFormField(
                    style: GoogleFonts.quicksand(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.white)),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _numbercontroller = value.substring(1);

                      phonenumber = '$countrycode$_numbercontroller';
                      // print(phonenumber);
                    },
                    validator: (value) {
                      print(value);
                      if (value.length == 11) {
                        return null;
                      }
                      return 'Please Enter Valid Phone Number';
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              //    RounderpasswordTextField(
              ////     hint: 'Password',
              //    icon: Icons.lock,
              //  ),
              //  SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(
                      onPressed: () async {
                        if (_phonelogin.currentState.validate()) {
                          dynamic user = _auth.loginUser(phonenumber, context);

                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              'Number', _numbercontroller);

                          if (user == null) {
                            print('NULL is Returneddd!!!!!!!!!!');
                          }
                        }
                      },
                      elevation: 5,
                      color: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("Login",
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                      )),
                ),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
