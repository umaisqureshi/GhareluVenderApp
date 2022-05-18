import 'package:flutter/material.dart';
class Cpass extends StatefulWidget {
  @override
  _CpassState createState() => _CpassState();
}

class _CpassState extends State<Cpass> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Change Password",style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: media.height*0.08,),
            Center(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: IconButton(
                    icon: Icon(Icons.account_circle,size: 35,color: Colors.blueAccent,),
                    onPressed: null
                  ),
                ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent,
                      )
                  )
              ),
            ),
            SizedBox(height: media.height*0.04,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                ),
                hintText: 'Old Password'
            ),
          ),
        ),
            SizedBox(height: media.height*0.02,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                    ),
                    hintText: 'New Password'
                ),
              ),
            ),
            SizedBox(height: media.height*0.03,),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 110),
                color: Colors.blueAccent,
                child: TextButton(
                  child: Text(
                    "CHANGE PASSWORD",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: null
                ),
              ),
            ),

          ],
        ),
      ),
      
    );
  }
}
