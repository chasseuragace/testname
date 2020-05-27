import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlippingAwesomeText extends StatefulWidget {
  @override
  _FlippingAwesomeTextState createState() => _FlippingAwesomeTextState();
}

class _FlippingAwesomeTextState extends State<FlippingAwesomeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Positioned(
                left: 25,
                top: MediaQuery.of(context).size.height / 2,
                child: TweenAnimationBuilder(
                  onEnd: () {
                    setState(() {});
                  },
                  curve: Interval(.1, .5, curve: Curves.ease),
                  key: UniqueKey(),
                  duration: Duration(seconds: 2),
                  builder: (BuildContext context, double value, Widget child) {
                    return Transform.scale(
                      scale: (max(cos(value).abs(), .45)),
                      // 1,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..rotateX(2 * value)
                          ..translate(
                              MediaQuery.of(context).size.width *
                                  .6 *
                                  sin(value / 2).abs(),
                              sin(value / 2).abs() * 44),
                        child: Container(
                          /* height: 85,
                          width: 150,*/
                          //color: Colors.green,
                          child: Text(
                            'Awesome',
                            style: TextStyle(
                                fontSize: 24,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 9,
                                      offset: Offset(14, 6))
                                ],
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    );
                  },
                  tween: Tween<double>(begin: 0.0, end: 22 / 7),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .31,
                top: MediaQuery.of(context).size.height * .4756,
                child: Container(
                  /* height: 85,
                  width: 150,*/
                  //  color: Colors.yellow.withOpacity(.4),
                  child: Text(
                    'Flip',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.white,
                              blurRadius: 9,
                              offset: Offset(4, -6))
                        ],
                        fontSize: 85,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
