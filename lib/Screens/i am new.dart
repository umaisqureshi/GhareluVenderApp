
import 'package:flutter/material.dart';


class Iamnew extends StatefulWidget {
  @override
  _IamnewState createState() => _IamnewState();
}

class _IamnewState extends State<Iamnew> {
  String valueChoose;
  List listitems = ["Lahore", "Islamabad", "Karachi"];
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
          "Create Account",style: TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 3),
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
                          hintText: 'Full Name'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: 'Business Name'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: 'E-mail'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: '03xxxxxxxxx'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                      width: 344,
                      color: Colors.white,
                      child: new DropdownButton(
                        hint: Text("Select City"),
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        value: valueChoose,
                        onChanged: (newValue){
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: listitems.map((cityitem){
                          return DropdownMenuItem(
                            value: cityitem,
                            child: Text(cityitem),

                          );
                        }).toList(),
                      )
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    child: IconButton(
                        icon: Icon(Icons.camera_alt_sharp, color: Colors.blueAccent,size: 30,),
                      onPressed: null,

                    ),
                  ),
                ),

                SizedBox(height: media.height * 0.01),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    color: Colors.blueAccent,
                    child: FlatButton(
                      child: Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.05),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: RichText(
                      text: TextSpan(
                          text: "By registering, you will accept our ",style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions", style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
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
                            ),
                            )

                          ]

                      ),
                    ),
                  ),
                ),




                SizedBox(height: media.height * 0.36),
              ],

            ),
          ),
        ),
      ),

    );
  }
}
