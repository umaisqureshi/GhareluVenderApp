import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garelluapp/Database/ProductDatabase.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:shared_preferences/shared_preferences.dart';

String ids, namee;
int phonee;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _formKey = GlobalKey<FormState>();

  String dishname;
  String discription;
  var price;
  String area;
  String foodtype;
  String time;
  String avalability;
  String imgRef;
  firebase_storage.Reference ref;
  bool showbutton = false;

  // String image = "assets/biryani.jpg";
  int currentIndex = 0;

  // var image2= "assets/logo.png" as File;
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

  Future getid() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("venderId");
    var name = sharedPreferences.getString("Name");
    var phone = sharedPreferences.getInt("Phone");
    setState(() {
      ids = id;
      namee = name;
      phonee = phone;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getid();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    // final vender = Provider.of<VenderProvider>(context);
    //final ven = vender.venderId;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 19,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ExploreCards')
              .where("vendorId", isEqualTo: ids)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> docu = snapshot.data.docs;
              return ListView(
                shrinkWrap: true,
                children: docu.map((doc) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: Colors.black38,
                      elevation: 5,
                      shape: RoundedRectangleBorder(),
                      child: ListTile(
                        onTap: () {},
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipOval(
                            child: Image.network(doc['image']),
                          ),
                        ),
                        title: Text(
                          doc['name'],
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          doc['description'],
                          style: GoogleFonts.quicksand(
                              fontSize: 8,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        trailing: Text(
                          doc['price'],
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () {
            adddish(context);
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('ADD DISHES'),
          ),
        ),
      ),
    );
  }

  adddish(BuildContext context) {
    String valueChoose;
    List<String> items = ["Burger", "Pizza", "Deserts", "Salan", "Chinese"];
    Size media = MediaQuery.of(context).size;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext ad) {
          return Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              height: media.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: media.height * 0.04,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 105),
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ),
                                onPressed: getImage,
                              ),
                            ),
                          ),
                          Text(
                            "Upload Image",
                            style: GoogleFonts.quicksand(
                                color: Colors.blue, fontSize: 12),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    color: Colors.blue, fontSize: 10),
                                onChanged: (str) {
                                  dishname = str;
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Dish name";
                                  }
                                  if (value.length < 5) {
                                    return "Please enter dish name with more than 5 digits";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 0.1)),
                                    labelText: 'Dish Name',
                                    labelStyle:
                                        GoogleFonts.quicksand(fontSize: 12)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    color: Colors.blue, fontSize: 10),
                                onChanged: (str) {
                                  area = str;
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Delivery Area";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 0.1)),
                                    labelText: 'Area of Delivery',
                                    labelStyle:
                                        GoogleFonts.quicksand(fontSize: 12)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    color: Colors.blue, fontSize: 10),
                                onChanged: (str) {
                                  discription = str;
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Dish Description";
                                  }
                                  if (value.length < 10) {
                                    return "Description must be more than 10 words";
                                  }
                                },
                                maxLength: 50,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.1)),
                                  labelText: 'Dish Discription',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    color: Colors.blue, fontSize: 10),
                                keyboardType: TextInputType.number,
                                onChanged: (str) {
                                  price = str;
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter the price";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.1)),
                                  labelText: 'Enter Price',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                style: GoogleFonts.quicksand(
                                    color: Colors.blue, fontSize: 10),
                                keyboardType: TextInputType.number,
                                onChanged: (str) {
                                  time = str;
                                },
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter delivery Time";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 0.1)),
                                  labelText: 'Delivery Time',
                                  labelStyle:
                                      GoogleFonts.quicksand(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          SizedBox(height: media.height * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Container(
                                child: DropdownButton(
                                  hint: Text(
                                      'Food Type'), // Not necessary for Option 1
                                  value: valueChoose,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                    });
                                  },
                                  items: items.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(item),
                                      value: item,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: media.height * 0.02),

                      SizedBox(height: media.height * 0.02),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              shape: StadiumBorder(),
                              color: Colors.blueAccent,
                              child: Text(
                                "ADD DISH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    ProductDatabase().CreateProduct(
                                        area,
                                        time,
                                        discription,
                                        valueChoose,
                                        imgRef,
                                        dishname,
                                        price,
                                        ids,
                                        namee,
                                        phonee);

                                    Navigator.of(context).pop();
                                  } else {
                                    print("Error");
                                  }
                                });
                              }),
                        ),
                      ),

                      SizedBox(height: media.height * 0.04),

                      //ListView(children: menuList.map((element) => Text(element.toString())).toList())
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget Deleteitmes() {
    return Container(
      alignment: Alignment.centerRight,
      color: Color(0xffc70000),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
