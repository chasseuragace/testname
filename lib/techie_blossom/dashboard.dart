import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation slide;
  Animation scale;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    scale = Tween<double>(begin: 1, end: .8).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(.4, 1, curve: Curves.easeInCubic)));
    slide = Tween<double>(begin: 0, end: .5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInQuad));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool forward = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                subtitle: Text('water s hot'),
                title: Text('title 1'),
              ),
              ListTile(
                title: Text('title 1'),
              ),
              ListTile(
                title: Text('title 1'),
              ),
            ],
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.scale(
                  scale: scale.value,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        slide.value * MediaQuery.of(context).size.width, 0, 0),
                    child: Material(
                      color: Colors.grey[300],
                      child: child,
                      borderRadius: BorderRadius.circular(slide.value * 25),
                      elevation: 5,
                    ),
                  ),
                );
              },
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      forward ? _controller.forward() : _controller.reverse();
                      forward = !forward;
                    },
                    child: Text('this is Dashboard' + UniqueKey().toString())),
              )),
        ],
      ),
    );
  }
}

class TestAnim extends StatefulWidget {
  @override
  _TestAnimState createState() => _TestAnimState();
}

class _TestAnimState extends State<TestAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation scale;
  Animation slidex;
  Animation sinewave;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.repeat();
    /*_controller.addListener((){
     if (_controller.status==AnimationStatus.dismissed) _controller.forward();
     else if(_controller.status==AnimationStatus.completed)_controller.reverse();
    });*/
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool move = true;


  @override
  Widget build(BuildContext context) {
      scale = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linear));

    sinewave = Tween<double>(begin: 0.0, end:math.pi).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linear));


    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          builder: (_, child) {
            return GestureDetector(
              onTap: () {
                move ? _controller.forward() : _controller.reverse();
                move = !move;
              },
              child:  Stack(

                children: <Widget>[
                 /* Container(
                    height: 200,
                   width: 200,
                   padding: EdgeInsets.only(top: math.sin(

                     // _controller.drive(Tween<double>(begin: 0.0, end:math.pi)).value
                       sinewave.value

                   )*80),
                    child: child
                  ),*/
                  Transform(
                    alignment:Alignment.center,
                    transform: Matrix4.identity()..rotateX(scale.value*44/7)..setEntry(2, 3, 0.005),
                    child: ClipPath(
                      clipper: ClipThis(),
                      child: Container(color: Colors.pinkAccent,height: 200,width: 200,),
                    ),
                  ),


                ],
              ),
            );
          },
          animation: sinewave,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://toppng.com/public/uploads/preview/hand-drawn-heart-11549459255jz1gvm6cwh.png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }
}

class ClipThis extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.moveTo(0, size.height/2);
    path.quadraticBezierTo(size.width*.25, 0,size.width/2, size.height/2);
    path.quadraticBezierTo(size.width*.75, size.height,size.width, size.height/2);


    path.quadraticBezierTo(size.width*.75, size.height+28,size.width/2, size.height/2);
    path.quadraticBezierTo(size.width*.25, 28,0, size.height/2);

    // TODO: implement getClip
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }
}
