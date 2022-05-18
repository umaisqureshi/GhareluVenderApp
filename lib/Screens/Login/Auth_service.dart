import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


import '../Mainscreen.dart';
import '../Register.dart';






class Authentication {


  // Future phoneverification(String phone, BuildContext context) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential);
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => Myprofile()));
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String verificationId, int resendToken) async {
  //       String smsCode = '123456789';
  // PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //     verificationId: verificationId, smsCode: smsCode);
  // await _auth.signInWithCredential(phoneAuthCredential);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // Future signout() async {
  //   try {
  //     return await _auth.signOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future signUp(String email, String password, String name, int cNic,
  //     String address) async {
  //   try {
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  // User userDetails = userCredential.user;
  // await DatabaseService(userDetails.uid)
  //     .updateUserData(name, cNic, address);

  //     return _userModelUID(userDetails);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future signIn(String email, String password) async {
  //   try {
  //     // ignore: unused_local_variable
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  final _codeController = TextEditingController();
  Future loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        UserCredential result = await _auth.signInWithCredential(credential);

        User user = result.user;
        print(user);

        if (user != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUp(
                         user: user,
                         phone: phone,
                      )));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Center(
                        child: CircleAvatar(
                          child: Image.asset(
                            'assets/logo.png',
                            scale: 18,
                          ),
                          radius: 80,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "6-digit code",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              labelText: 'OTP code',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 15)),
                          controller: _codeController,
                          validator: (value) {
                            if (value.length == 6) {
                              return "Please enter a valid OTP code.";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: RaisedButton(
                              onPressed: () async {
                                final code = _codeController.text.trim();
                                AuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: code);

                                UserCredential result = await _auth
                                    .signInWithCredential(credential);

                                User user = result.user;
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                        SignUp(
                                        user: user,
                                        phone: phone,
                                      )


                                      ));
                                } else {
                                  print("Error");
                                }
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
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
