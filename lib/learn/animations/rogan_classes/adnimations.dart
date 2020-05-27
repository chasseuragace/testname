import 'package:flutter/material.dart';

class AnimationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliderAnimation();
  }
}

class SliderAnimation extends StatefulWidget {
  @override
  _SliderAnimationState createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;

  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context,Widget childx) {
            return Transform(
              child: childx,
              transform:
                  Matrix4.translationValues(size.width * animation.value, 0, 0),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Center(child: Text('flying text',style: TextStyle(fontSize: 25,color: Colors.red),)),
              ),
              Container(
                child: Center(child: Text('flying text 2',style: TextStyle(fontSize: 25,color: Colors.red),)),
              ),
              Container(
                child: Center(child: Text('flying text 3',style: TextStyle(fontSize: 25,color: Colors.red),)),
              ),
            ],
          )),
    );
  }
}
