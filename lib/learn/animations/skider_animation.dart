import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  @override
  _SliderAnimationState createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: -1, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.addListener(_listner);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.translationValues(
                    size.width * _animation.value, 0, 0),
                child: Center(child: Text('animate this')),
              );
            },
          ),
          FlatButton(
            child: Text('click'),
            onPressed: () {
              _controller.forward();
            },
          )
        ],
      ),
    );
  }

  void _listner() async {
    /* print( _controller.status.toString());
    if(_controller.status==AnimationStatus.completed) {
      await Future.delayed(Duration(seconds: 2));
      _controller.reverse();}
    if(_controller.status==AnimationStatus.dismissed) {


      _controller.forward();}*/
  }
}

class MoveUpAnimation extends StatefulWidget {
  @override
  _MoveUpAnimationState createState() => _MoveUpAnimationState();
}

class _MoveUpAnimationState extends State<MoveUpAnimation> {
  bool   show=false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        color: Colors.grey,
        width: double.infinity,
        child: Stack(


          children: <Widget>[
            SizedBox(height: 250,),

            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  SizedBox(height: 25,),
                  Container(child: Text('menu item 1',style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),height: 30,),
                  Container(child: Text('menu item 1',style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),height: 30,),
                  Container(child: Text('menu item 1',style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),height: 30,),

                ],
              ),
            ),


            AnimatedPositioned(
                curve: Curves.bounceOut,
                top: show?(30*3+25.0):25,
                duration: Duration(milliseconds: 400),

                child: Container(
                  height: 500,
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[




                      IconButton(
                        onPressed: (){
                          setState(() {
                            show=!show;
                          });
                        },
                        icon: Icon(Icons.menu),
                      )
                    ],),
                )
            ),

            Container(

              height: 50,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    show=false;
                  });
                },
                child: Text('buy'),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.elasticOut  ,
              duration: Duration(seconds: 1),
              bottom: show?50:0,
              child: GestureDetector(
                onTap: (){setState(() {
                  show=!show;
                });},
                child: AnimatedContainer(
                  curve: Interval(0,.2,curve: Curves.ease),
                  onEnd: (){},
                  duration: Duration(seconds: 1) ,
                  decoration: BoxDecoration(
                      boxShadow: show?[BoxShadow(
                          color: Colors.black45,spreadRadius: 1,offset: Offset(5,0),blurRadius: 9
                      )]:[],
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: 200,
                  width: 250,

                ),
              ),


            ),

          ],
        ),
      ),
    );
  }
}

