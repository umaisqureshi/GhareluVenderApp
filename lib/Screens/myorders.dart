import 'package:flutter/material.dart';
import 'package:garelluapp/Model/listorder.dart';
import 'package:google_fonts/google_fonts.dart';



class Orders extends StatefulWidget {
  List<order> myorder;
  Orders({this.myorder});
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
          'My Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Text(
                "Total number of processing Orders are " +
                    widget.myorder.length.toString(),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Container(
              color: Colors.white,
              child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.myorder.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: media.height * 0.15,
                      color: Colors.white,
                      child: Card(
                        color: Colors.blueAccent.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Image.asset(
                                  widget.myorder[index].image,
                                  fit: BoxFit.cover,
                                  width: 45,
                                ),
                                radius: 40,
                                backgroundColor: Colors.white,
                              ),
                              title: Text(
                                widget.myorder[index].title,
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                widget.myorder[index].tax,
                                style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              trailing: Text(
                                  widget.myorder[index].price.toString(),
                                  style: GoogleFonts.quicksand(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: RaisedButton(
                                  onPressed: () {},
                                  elevation: 5,
                                  color: Colors.yellow.shade300,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text("Done!",
                                        style: GoogleFonts.quicksand(
                                          color: Colors.blueAccent,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
