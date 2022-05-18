import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garelluapp/Screens/Register.dart';


import 'package:google_fonts/google_fonts.dart';



class Otpscreen extends StatefulWidget {
  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otpInputController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,

      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueAccent,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
              ),
              CircleAvatar(
                child: Image.asset(
                  'assets/logo.png',
                  scale: 18,
                ),
                radius: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "6-digit code",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      labelText: 'OTP code',
                      labelStyle: TextStyle(
                          color: Colors.black, letterSpacing: 2, fontSize: 15)),
                  controller: otpInputController,
                  validator: (value) {
                    if (value.length == 6) {
                      return "Please enter a valid OTP code.";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 85,
                    child: RaisedButton(
                        onPressed: () {},
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text("Resend",
                              style: GoogleFonts.quicksand(
                                color: Colors.blue[600],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                  ),
                  // Center(
                  //   child: OtpTimer(),
                  // ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp()));
                      },
                      elevation: 5,
                      color: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("VERIFY",
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
