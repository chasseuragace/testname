import 'dart:math';

import 'package:flutter/material.dart';

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  bool showMenu = false;
  AnimationController _animationController;
  Animation _flipanim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _flipanim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,


        curve:  Curves.fastOutSlowIn));

  }
var tweenkey = UniqueKey();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        height: 200,
        //color: Colors.red,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            AnimatedPositioned(
                bottom: showMenu ? 150 : 8,
                right: 0,
                left: 0,

                duration: Duration(milliseconds: 200),
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      Icons.format_paint,
                      color: Colors.black54,
                      key: UniqueKey(),
                    ),
                    transitionBuilder: (Widget child, Animation<double> anim) {
                      return RotationTransition(
                        child: child,
                        turns: anim,
                      );
                    })

                //
                ),
            AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  child: child,
                  scale: animation,
                );
              },
              duration: Duration(milliseconds: 300),
              child: showMenu
                  ? GestureDetector(
                      key: UniqueKey(),
                      onTap: () {
                        setState(() {
                          showMenu = false;
                        });
                      },
                      child: Container(
                        child: Icon(Icons.arrow_back),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                  : GestureDetector(
                      key: UniqueKey(),
                      onTap: () {
                        setState(() {
                          showMenu = true;
                        });
                      },
                      child: Container(
                        child: Icon(Icons.home),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              child: child,
              transform: Matrix4.identity()
                ..setEntry(3,2, .004)
                ..rotateY( pi * _flipanim.value),
            );
          },
          child: GestureDetector(
            onTap: () {
              print('was pressed');
              _animationController.status == AnimationStatus.dismissed
                  ? _animationController.forward()
                  : _animationController.reverse();

              print(_animationController.status);
            },
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              color: Colors.red,
              child: TweenAnimationBuilder(


                  duration: Duration(seconds: 3),
                  tween: Tween<double>(begin: 0,end: 2*pi) , builder: (context,d,child){
                return Transform.rotate(angle: d,
                  child: child,
                );
              },

                  child: Material(elevation:5,child: Text('this flips')),)



            ),
          ),
        ),
      ),
    );

  }
}
