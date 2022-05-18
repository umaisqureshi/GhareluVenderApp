import 'package:flutter/material.dart';
import 'package:garelluapp/Screens/myorders.dart';
import 'package:garelluapp/Screens/processingScreens.dart';

import 'package:google_fonts/google_fonts.dart';

import 'drawar.dart';
import 'maps.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Welcome To Gharelu",
          style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15),
        ),
      ),
      drawer: MainDrawar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: media.height * 0.02,
              ),

              Center(
                child: Container(
                  height: 150,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              // SizedBox(height: media.height*0.05,),
              Text(
                "New Order",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: media.width * 0.9,
                  height: media.height * 0.07,
                  child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "See your Orders",
                        style: GoogleFonts.quicksand(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Orders In Process",
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: media.width * 0.9,
                  height: media.height * 0.07,
                  child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Processing Orders",
                        style: GoogleFonts.quicksand(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProcessingOrders()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.1,
              ),
              Center(
                child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      radius: 50,
                      child: IconButton(
                        icon: Icon(
                          Icons.location_on_outlined,
                          size: 35,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Maps()));
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black87,
                        ))),
              ),
              SizedBox(
                height: media.height * 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
