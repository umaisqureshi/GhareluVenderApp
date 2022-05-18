import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Mainscreen.dart';
import 'forgetpassword.dart';

class Havebeen extends StatefulWidget {
  @override
  _HavebeenState createState() => _HavebeenState();
}

class _HavebeenState extends State<Havebeen> {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()..onTap = (){
    debugPrint("Detected");
  };
  final TapGestureRecognizer _gestureRecognize = TapGestureRecognizer()..onTap = (){
    debugPrint("Detected privacy policy");
  };
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), color: Colors.black,iconSize: 19,
          onPressed: (){
            Navigator.of(context).pop();
          },

        ),
        title: Text(
          "Sign In",style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: media.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: 'Email'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.03),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: 'Password'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.03),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 140),
                    color: Colors.blueAccent,
                    child: FlatButton(
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 100),

                    child: FlatButton(
                      child: Text(
                        "Forget Password?",style: TextStyle(
                        color: Colors.black38
                      ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Forget()));
                      },
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.03),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: RichText(
                      text: TextSpan(
                       text: "By sigining in, you will accept our ",style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions", style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),recognizer: _gestureRecognizer,
                          ),
                          TextSpan(
                            text: " and",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            )
                          ),
                          TextSpan(
                            text: " Privacy Policy", style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),recognizer: _gestureRecognize,
                          )

                        ]

                      ),
                    ),
                  ),
                ),

                SizedBox(height: media.height * 0.37),
                ],

            ),
          ),
        ),
      ),
    );
  }
}
