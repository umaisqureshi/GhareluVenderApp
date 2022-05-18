import 'package:flutter/material.dart';
class Forget extends StatefulWidget {
  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
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
          "Forget Password?",style: TextStyle(
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    color: Colors.blueAccent,
                    child: TextButton(
                      child: Text(
                        "FORGET PASSWORD",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),



              ],

            ),
          ),
        ),
      ),
    );
  }
}
