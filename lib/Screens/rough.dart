import 'package:flutter/material.dart';
class Dishes extends StatefulWidget {
  @override
  _DishesState createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  final dishname = new TextEditingController();
  final dishdis = new TextEditingController();
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
          "Add Dishes",style: TextStyle(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: dishname,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                          ),
                          hintText: 'Dish Name'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height*0.02,),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: dishdis,
                      maxLength: 50,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width: 0.1)
                        ),
                        hintText: 'Dish Discription',

                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.02),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_sharp, color: Colors.blueAccent,size: 30,),
                      onPressed: null,

                    ),
                  ),
                ),Text("Dish Image"),
                SizedBox(height: media.height * 0.02),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 105),
                    color: Colors.blueAccent,
                    child: FlatButton(
                        child: Text(
                          "ADD DISH",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: (){

                        }
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
