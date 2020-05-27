import 'dart:math';
import 'package:flutter/material.dart';
import 'package:materialapp/framework_component/testIndivisuals.dart';

import 'hearts.dart';

class Bubbles extends StatefulWidget {
  final Stream<bool> source ;
  final double height;
  /// var showBubbles =false;
  /// triggerBubbles(){
  ///   showBubbles=!showBubbles;
  ///    _controller.sink.add(showBubbles);
  ///  }
  ///  closeSink(){
  ///   _controller.close();
  ///  }
  ///  final _controller = StreamController<bool>.broadcast();//.broadcast();
  ///  Stream<bool> get stream =>_controller.stream;///
  const Bubbles({Key key, @required this.source, this.height}) : super(key: key);


  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> {
final  List<double> radrelative = [
    0.1,
    0.07,
    0.06,
    0.051,
    0.084,
    .064,
    .03,
    .016,
  ];
  final List<double> relativetop = [
    0.009,
    .1851,
    .28888888,
    .33333,
    .4814,
    .6814,
    .85925,
    0.94
  ];
final  List<double> leftrelative = [.3846, 0.08, .5769, 1, .28846, .6153, .230, .6923];

  Random rand = Random();
  @override
   final durationMSeach = 800;



  Widget build(BuildContext context) {

    int durationMSeach = 100;
    double height = widget.height, width = 280 / 600 * height;
// TODO: implement build
    return StreamBuilder(
      stream: widget.source,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if(snapshot.hasData && snapshot.data !=null) hidden= snapshot.data;
        else hidden=true;
        return  Container(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              for (int i = 0; i < 8; i++)
                AnimatedPositioned(
                    duration: hidden
                        ? Duration(milliseconds: 250)
                        : Duration(
                      milliseconds: max(
                          (relativetop.length * durationMSeach -
                              (pow(-1, rand.nextInt(10))) *
                                  i *
                                  durationMSeach),
                          durationMSeach),
                    ),
                    top: hidden
                        ? height * 1.8
                        : relativetop[i] * height * .9,
                    left: hidden
                        ? width * .7 / 2
                        : leftrelative[i] * width * .7,
                    child: numberHolder(
                        radius: radrelative[i] * height, i: i)


                 ),
            ],
          ),
        );
      },
    );
  }

  bool hidden = false;
Widget x
    ({double radius, int i}) {
  return AnimatedContainer(
    duration: Duration(
      milliseconds: max(
          (radrelative.length * durationMSeach - i * durationMSeach),
          durationMSeach),
    ),
    curve: Curves.bounceOut,
    alignment: Alignment.center,
    height: radius * 2,
    width: radius * 2,
    child:Icon(Icons.star,size: radrelative[i],
    ),)
  ;
}
  Widget numberHolder({double radius, int i}) {
    return ClipPath(
      clipper: HeartPath(),
      child: AnimatedContainer(
          duration: Duration(
            milliseconds: max(
                (radrelative.length * durationMSeach - i * durationMSeach),
                durationMSeach),
          ),
          curve: Curves.bounceOut,
          alignment: Alignment.center,
          height: radius * 2,
          width: radius * 2,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: randomcolor()

,begin: Alignment.topLeft,end: Alignment.bottomRight
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-1.365 / 50 * radius, -1.365 / 50 * radius),
                    spreadRadius: 0,
                    blurRadius: 0),
                BoxShadow(
                    color:  Colors.black12,
                    offset: Offset(4 / 50 * radius, 4 / 50 * radius),
                    spreadRadius: 4,
                    blurRadius: 2),
              ])),
    );
  }
}

List<List<Color>> gradient = [
  [
    Color(0xff8360c3),
    Color(0xff2ebf91),
  ],
  [
    Color(0xffeaafc8),
    Color(0xff654ea3),
  ],
  [
    Color(0xffED213A),
    Colors.orange,
  ],
  [
    Color(0xffDA4453),
    Color(0xff2193b0),
  ],
  [
    Color(0xFFF9D423),
    Color(0xff79CBCA),
  ],
  [
    Color(0xff8360c3),
    Color(0xff2ebf91),
  ],
  [
    Color(0xff26a0da),
    Color(0xffFF8F02),
  ],
];

List<Color> randomcolor() {
  Random random = Random();
  var x = random.nextInt(gradient.length);
  return gradient[x];
}
