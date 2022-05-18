import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garelluapp/Database/user%20registration.dart';
import 'package:garelluapp/Provider/UserModel.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Mainscreen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

String imgRef;
firebase_storage.Reference ref;

class SignUp extends StatefulWidget {
  User user;

  final String phone;

  SignUp({this.user, this.phone});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name, _address, _CNIC, _addresspicker, _days, _time;

  final GlobalKey<FormState> _signup = GlobalKey<FormState>();

  Future getImage() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("Images" + DateTime.now().toString());
    await ref.putFile(images).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        setState(() {
          imgRef = value;

          print(imgRef);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final vender = Provider.of<VenderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.04,
              ),
              Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
                      child: Text('Create an Account',
                          style: GoogleFonts.quicksand(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    margin: EdgeInsets.only(left: 40),
                    width: size.width * 0.85,
                    height: size.height * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 63, top: 55),
                    child: Form(
                      key: _signup,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              onChanged: (value) {
                                _name = value;
                              },
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter Your Name";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.4)),
                                  labelText: 'Name',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12)),
                              style: GoogleFonts.quicksand(color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              style: GoogleFonts.quicksand(color: Colors.blue),
                              onChanged: (value) {
                                _days = value;
                              },
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return " PLease give Opening Days";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.4)),
                                  hintText: "Mon - Fri",
                                  labelText: 'Opening Days',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12)),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              style: GoogleFonts.quicksand(color: Colors.blue),
                              onChanged: (value) {
                                _time = value;
                              },
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return " PLease give Opening & Closing time";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.lock_clock,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.4)),
                                  hintText: "12 am  -  12 pm",
                                  labelText: 'Timing',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12)),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.add_location,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.5)),
                                  labelText: 'Address',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12)),
                              style: GoogleFonts.quicksand(color: Colors.blue),
                              onChanged: (value) {
                                _address = value;
                              },
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter Your Address";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.5)),
                                  labelText: 'CNIC',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12),
                                  hintText: "12345-1234567-7"),
                              style: GoogleFonts.quicksand(color: Colors.blue),
                              onChanged: (value) {
                                _CNIC = value;
                              },
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter Your CNIC";
                                }
                                if (value.length < 13) {
                                  return "Invalid CNIC";
                                }
                                if (value.length > 14) {
                                  return "Invalid CNIC";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: Colors.blueAccent,
                                    ), // icon is 48px widget.
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.5)),
                                  labelText: 'Area of delivery',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12)),
                              style: GoogleFonts.quicksand(color: Colors.blue),
                              onChanged: (value) {
                                _addresspicker = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter your area of delivery";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 15),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                      )),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_sharp,
                                        color: Colors.blueAccent,
                                        size: 25,
                                      ),
                                      onPressed: getImage,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Menu Image",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 10,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                            width: size.width * 0.4,
                            child: RaisedButton(
                                onPressed: () async {
                                  if (_signup.currentState.validate()) {
                                    await DatabaseService(widget.user.uid)
                                        .CreateUserData(
                                            _name,
                                            widget.phone,
                                            _address,
                                            _CNIC,
                                            _addresspicker,
                                            _days,
                                            _time,
                                            imgRef);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Mainscreen()));

                                    vender.AddVender(widget.user.uid, _name);

                                    final SharedPreferences sharedPreferences =
                                        await SharedPreferences.getInstance();
                                    sharedPreferences.setString('Name', _name);
                                    sharedPreferences.setString(
                                        "Phone", widget.phone);
                                    sharedPreferences.setString(
                                        "venderId", widget.user.uid);
                                  }
                                },
                                elevation: 5,
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text("Register",
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
