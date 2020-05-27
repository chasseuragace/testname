import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownWrapper extends StatefulWidget {
  @override
  _CustomDropDownWrapperState createState() => _CustomDropDownWrapperState();
}


class _CustomDropDownWrapperState extends State<CustomDropDownWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(15), child: CustomDropDown())),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isOpened = false;
  Size boxSize;

  Offset offset;
  GlobalKey reference = LabeledGlobalKey('location');

  OverlayEntry _createplaceholder() {
    List<Widget> items=[
      Container(width: double.infinity,
        color: Colors.pink,
        height: 50,
        child: Center(child: Text('item')),
      ),Container(width: double.infinity,
        color: Colors.pinkAccent,
        height: 50,
        child: Center(child: Text('item')),
      ),Container(width: double.infinity,
        color: Colors.pink,
        height: 50,
        child: Center(child: Text('item')),
      ),




    ];
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: boxSize.height + offset.dy,
        left: offset.dx,
        width: boxSize.width,
        height: items.length*50.0+50,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(


            child: Stack(children: <Widget>[

              Column(
                children: <Widget>[
                  SizedBox(height: 20,),

                  Material(
                    borderRadius: BorderRadius.circular(9),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Container(
                     //  padding: EdgeInsets.only(top: 25),
                        color: Colors.white ,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: items,
                          )),
                    ),
                  )
                ],
              ),  Positioned(
                  top: -25,
                  child: Icon(Icons.arrow_drop_up,size: 80,color: Colors.pink,)),
            ],),
          ),
        ),
      );
    });
  }

  dropdownLocation() {
    RenderBox renderBox = reference.currentContext.findRenderObject();
    boxSize = renderBox.size;
    offset = renderBox.localToGlobal(Offset.zero);
    print(boxSize.height);
    print(boxSize.width);
    print(offset.dx);
    print(offset.dy);
  }
  OverlayEntry placerholder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: reference,
      onTap: () {
        setState(() {

          dropdownLocation();

          if (!isOpened) {

            placerholder = _createplaceholder();
            Overlay.of(context).insert(placerholder);
          }else placerholder.remove();
          isOpened = !isOpened;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            Text(
              'Press for  List'.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
