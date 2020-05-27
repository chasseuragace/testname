import 'dart:math';

import 'package:flutter/material.dart';

class AnimationDesigner extends StatefulWidget {
  @override
  _AnimationDesignerState createState() => _AnimationDesignerState();
}

class _AnimationDesignerState extends State<AnimationDesigner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,


          children: <Widget>[


            _initialObject(),
            _animatedObject(),
            FlatButton(child: Text('change'),onPressed: (){
              setState(() {

              });
            },)
          ],
        ),
      ),
    );
  }

  Widget _initialObject() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.orange,
    );
  }

  Widget _animatedObject() {
    Random rand= Random();
    print(rand.nextDouble()/1000);
    return Container(
      transform: Matrix4.identity()..setEntry(3, rand.nextInt(3), rand.nextDouble()/100)..rotateX( 55 * pi/180  )..rotateZ( rand.nextInt(360) * pi/180  ),
      height: 100,
      width: 100,
      color: Colors.pink,
      child: Text('a text'),
    );
  }
}
