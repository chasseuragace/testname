import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:materialapp/pintrest/white_layout.dart';

class FoodMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGLow(),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Icon(Icons.menu), Icon(Icons.person)],
              ),
            ),
            Container(

              //color: Colors.black12,
              height: 100,
              child: RichText(
                text: TextSpan(
                    text: 'Food',
                    style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: GoogleFonts.aladin().fontFamily,
                    ),
                    children: [TextSpan(text: '\nDelivery',style: TextStyle(fontWeight: FontWeight.normal))]),
              ),
            ),
            Container(

              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.search),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 8,

                    child: TextFormField(
                      decoration:InputDecoration(

                        hintText: 'Search...',


                      ) ,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 150,
            child: ScrollConfiguration(
              behavior: NoGLow(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: 4,
                  itemBuilder: (context,index){
                return _categoryBox(context);
              }),
            ),)
          ],
        ),
      ),
    );
  }

  Widget _categoryBox(context) {
    double visibleAtonce = 3;
    double width= MediaQuery.of(context).size.width/visibleAtonce;
    return Container(
      padding: EdgeInsets.all(5),
      width: width,
      
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(width)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.image),
            ),
            Text('Burger'),
            Text('12'),

          ],
        ),
      ),
    );
  }
}
