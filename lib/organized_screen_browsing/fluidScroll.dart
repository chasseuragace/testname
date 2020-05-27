import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FluidSwipeScroll extends StatefulWidget {
  @override
  _FluidSwipeScrollState createState() => _FluidSwipeScrollState();
}

class _FluidSwipeScrollState extends State<FluidSwipeScroll> {
  double width;
  double height;
  double topPadding;
  double swipeVelocityFactor=0.0;

  Widget suffix;
  ScrollController _sc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sc= ScrollController()..addListener(listner);
  }
 listner() {
  double y=  ((_sc.offset/height));
  print('working with listner');
   if(y <0)
   setState(() {
      swipeVelocityFactor=-y*0.06;
    });
   else if(y<0)
     {
       setState(() {
         swipeVelocityFactor=0;
       });
     }
 }

  @override
  Widget build(BuildContext context) {

  width=MediaQuery.of(context).size.width;
  height=85;
  topPadding=.05;
    return Scaffold(
      body: SafeArea(

        child: Material(
          color: Colors.grey,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails d){
              print('working with gestures');
              double y = d.delta.dy;
            //  print(y*0.04);
              if(y>3 && y <6)
              setState(() {

                swipeVelocityFactor=y*0.0294  ;

              });
            },
            onPanEnd: (DragEndDetails d){
                 setState(() {
           swipeVelocityFactor=0  ;

              });
            },
            child: ListView.builder(
              controller: _sc ,
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (

                  BuildContext context, int index) {
                return  AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),

                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  height: height + height*(swipeVelocityFactor??0),
                  width:width,
                  child: Stack(
                    children: <Widget>[
                      _title(),
                      _content(),
                      if(suffix!=null) _suffix()

                    ],
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }




 Widget _title() {

    return Padding(
      padding: EdgeInsets.only(top: height*topPadding,left: width*.03,),
      child:Container(

        //color:Colors.red,
        width: width,
        height: height*.20,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('Title a long title, long more longer'),
        ),
      ),

    );
 }

  Widget _content() {



      return Positioned(
        width: suffix!=null? width*.75: width,
           bottom: 0,

        child: Padding(
          padding: EdgeInsets.only(left: width*.03),
          child: Container(
          
            height: height*(1-( topPadding+.20)),
          //  color: Colors.pink,
            child: FittedBox(
                fit:BoxFit.contain,child:
            Text('helo mang mang, lasjd lkasj , asdj klaj \n klasjd aklsjdl ')
            ),
          ),
        ),
      );
  }

  Widget _prefix() {
  }

  Widget _suffix() {
    return Positioned(
      top: height*.5 ,

      right: width*0.06,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.red,
      ),
    );

  }
}
