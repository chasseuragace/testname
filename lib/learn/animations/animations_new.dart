import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class LearningSthNew extends StatefulWidget {
  @override
  _LearningSthNewState createState() => _LearningSthNewState();
}

class _LearningSthNewState extends State<LearningSthNew> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.grey.withOpacity(.0902),
        child: Row(
          children: <Widget>[
            NavigationRail(
              leading: Icon(Icons.search),
              backgroundColor: Colors.white,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Column(
                children: <Widget>[
                  Text('selectedIndex: $_selectedIndex'),
                  FlatButton(
                    child: Text('show'),
                    onPressed: diplaySheet,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void diplaySheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white, image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.contain, alignment: Alignment.topCenter, repeat: ImageRepeat.repeatX)),
          );
        });
  }

  Widget closed(BuildContext context, action) {
    return CircleAvatar(
      child: Center(child: Text('closed element')),
    );
  }

  Widget open(BuildContext context, action) {
    return Center(
      child: Container(
        color: Colors.red,
        constraints: BoxConstraints(
          maxHeight: 300,
          minWidth: 200,
        ),
        height: 500,
        width: 500,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Text('open element'),
        ),
      ),
    );
  }
}

class QuatraticImageTocurve extends StatefulWidget {
  @override
  _QuatraticImageTocurveState createState() => _QuatraticImageTocurveState();
}

class _QuatraticImageTocurveState extends State<QuatraticImageTocurve> {
  int selector = 0;
  Offset start = Offset(0, 0);
  Offset end = Offset(150, 0);
  Offset control = Offset(25, 80);

  Offset end2 = Offset(150, 0);
  Offset control2 = Offset(25, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails d) {
                if (selector == 0) start = d.localPosition;
                if (selector == 1) end = d.localPosition;
                if (selector == 2) control = d.localPosition;
                if (selector == 4) end2 = d.localPosition;
                if (selector == 5) control2 = d.localPosition;
                setState(() {});
              },
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: start.dy,
                      left: start.dx,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selector = 0;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: selector == 0 ? 6 : 4,
                            ),
                            Text('start')
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: end.dy,
                      left: end.dx,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selector = 1;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: selector == 1 ? 6 : 4,
                            ),
                            Text('end')
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: control.dy,
                      left: control.dx,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selector = 2;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: selector == 2 ? 6 : 4,
                            ),
                            Text('ctrl')
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: end2.dy,
                      left: end2.dx,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selector = 4;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: selector == 4 ? 6 : 4,
                            ),
                            Text('en2')
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: control2.dy,
                      left: control2.dx,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selector = 5;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: selector == 5 ? 6 : 4,
                            ),
                            Text('ctrl2')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: MyClipper(start: start, end: end, control: control, end2: end2, control2: control2),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
                color: Colors.green,
              ),
            ),
            /*   Text('start $start'),
            Text('end $end'),
            Text('control $control'),

            Text('end2 $end2'),
            Text('control2 $control2'),*/
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final Offset start;
  final Offset end;
  final Offset control;

  final Offset end2;
  final Offset control2;

  MyClipper({
    this.start,
    this.end,
    this.control,
    this.end2,
    this.control2,
  });

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();

    path.moveTo(start.dx, start.dy);

    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    path.quadraticBezierTo(control2.dx, control2.dy, end2.dx, end2.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Butterfly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(6.49, 3.51),
              child: Transform.scale(
                scale: .87,
                child: SvgPicture.string(
                  _shapeSVG_8c745170bfe94596a0fb6ade3a587487,
                  allowDrawingOutsideViewBox: true,
                  color: Colors.black12,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0.49, 0.51),
              child: Transform.scale(
                scale: .87,
                child: SvgPicture.string(
                  _shapeSVG_8c745170bfe94596a0fb6ade3a587487,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _shapeSVG_8c745170bfe94596a0fb6ade3a587487 =
    '<svg viewBox="44.3 6.5 250.2 374.2" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffe41616"  /><stop offset="1.0" stop-color="#e0c375d5" stop-opacity="0.88" /></linearGradient></defs><path transform="translate(462.0, 44.0)" d="M -318.3222961425781 264.9125061035156 C -316.1859130859375 194.4115905761719 -188.7145690917969 118.38232421875 -188.7145690917969 171.0799713134766 C -188.7145690917969 231.1062774658203 -178.4944915771484 310.182861328125 -188.7145690917969 310.4888610839844 C -198.9346466064453 310.7948608398438 -318.5096740722656 365.4761657714844 -318.5096740722656 315.8906860351563 C -318.5096740722656 266.3052062988281 -318.1534729003906 264.7954406738281 -318.3222961425781 264.9125061035156 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><path transform="translate(462.0, 44.0)" d="M -348.9437255859375 123.8010635375977" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><g transform=""><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.301137" y1="0.062117" x2="0.960397" y2="0.732385"><stop offset="0.0" stop-color="#ff17ee6d"  /><stop offset="1.0" stop-color="#ff093119"  /></linearGradient></defs><path transform="translate(547.0, 18.0)" d="M -348.9437255859375 124.3488616943359 C -348.9437255859375 124.3488616943359 -347.9324340820313 72.94503784179688 -323.7452697753906 44.37117767333984 C -305.5406494140625 22.86478424072266 -273.1072998046875 4.557294845581055 -260.4019775390625 15.34379959106445 C -247.6966552734375 26.13030433654785 -249.505859375 61.49706268310547 -272.9239807128906 87.51719665527344 C -296.3421020507813 113.5373306274414 -348.9437255859375 124.3488616943359 -348.9437255859375 124.3488616943359 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><defs><filter id="shadow"><feDropShadow dx="3" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.301137" y1="0.062117" x2="0.960397" y2="0.732385"><stop offset="0.0" stop-color="#ff17ee6d"  /><stop offset="1.0" stop-color="#ff093119"  /></linearGradient></defs><path transform="matrix(0.406737, -0.913545, 0.913545, 0.406737, 223.15, -229.22)" d="M -348.9437255859375 124.3488616943359 C -348.9437255859375 124.3488616943359 -347.9324340820313 72.94503784179688 -323.7452697753906 44.37117767333984 C -305.5406494140625 22.86478424072266 -273.1072998046875 4.557294845581055 -260.4019775390625 15.34379959106445 C -247.6966552734375 26.13030433654785 -249.505859375 61.49706268310547 -272.9239807128906 87.51719665527344 C -296.3421020507813 113.5373306274414 -348.9437255859375 124.3488616943359 -348.9437255859375 124.3488616943359 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.301137" y1="0.062117" x2="0.960397" y2="0.732385"><stop offset="0.0" stop-color="#ff17ee6d"  /><stop offset="1.0" stop-color="#ff093119"  /></linearGradient></defs><path transform="matrix(-0.62932, -0.777146, 0.777146, -0.62932, -124.14, -50.46)" d="M -348.9437255859375 124.3488616943359 C -348.9437255859375 124.3488616943359 -347.9324340820313 72.94503784179688 -323.7452697753906 44.37117767333984 C -305.5406494140625 22.86478424072266 -273.1072998046875 4.557294845581055 -260.4019775390625 15.34379959106445 C -247.6966552734375 26.13030433654785 -249.505859375 61.49706268310547 -272.9239807128906 87.51719665527344 C -296.3421020507813 113.5373306274414 -348.9437255859375 124.3488616943359 -348.9437255859375 124.3488616943359 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><path transform="matrix(0.406737, -0.913545, 0.913545, 0.406737, 223.15, -229.22)" d="M -348.9437255859375 123.8010635375977" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(-0.62932, -0.777146, 0.777146, -0.62932, -124.14, -50.46)" d="M -348.9437255859375 123.8010635375977" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(198.5, 32.5)" d="M 86 0 L 0 110" fill="none" stroke="#5b945d" stroke-width="0.5199999809265137" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.406737, -0.913545, 0.913545, 0.406737, 94.65, 95.05)" d="M 86 0 L 0 110" fill="none" stroke="#5b945d" stroke-width="0.5199999809265137" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(-0.62932, -0.777146, 0.777146, -0.62932, 106.45, 211.25)" d="M 86 0 L 0 110" fill="none" stroke="#5b945d" stroke-width="0.5199999809265137" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';

class ElasticDrawer extends StatefulWidget {
  @override
  _ElasticDrawerState createState() => _ElasticDrawerState();
}

class _ElasticDrawerState extends State<ElasticDrawer> {
  bool isShowing = false;
  Offset _recordedOffset = Offset(0, 0);
  bool coolCat = false;

  @override
  Widget build(BuildContext context) {
    // bool isShowing =false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: size.height,
            width: size.width,
            child: Center(
              child: Text('Body Content'),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.bounceOut,
            duration: Duration(milliseconds: 600),
            left: isShowing ? 0 : -size.width * .435,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails d) {
                if (d.localPosition.dx - size.width * .6 > size.width * .125 && !isShowing) isShowing = true;
                if (d.localPosition.dx - size.width * .6 <= size.width * .125 && !isShowing && !coolCat)
                  setState(() {
                    coolCat = true;
                  });

                setState(() {
                  _recordedOffset = d.localPosition.dx < size.width * .435 + 35 ? d.localPosition : _recordedOffset;
                });
              },
              onHorizontalDragEnd: (DragEndDetails) {
                setState(() {
                  _recordedOffset = Offset(0, 0);
                  coolCat = false;
                });
              },
              child: ClipPath(
                clipper: ElasticClipper(_recordedOffset),
                child: Container(
                  color: Colors.red,
                  height: size.height,
                  width: size.width * .6,
                  child: Center(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowing = false;
                          });
                        },
                        child: Text('Drawer Content')),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: coolCat ? Curves.easeInQuad : Curves.ease,
            duration: Duration(milliseconds: 200),

            // left: size.width*.2-40,
            //right: _recordedOffset.dy*.5,
            left: 70 + _recordedOffset.dx * .25,
            top: coolCat ? min(_recordedOffset.dy * 1.15, size.height - 50) : -150,
            height: 50,
            width: 80,
            child: Transform(
                transform: Matrix4.identity()..rotateY(22 / 7),
                child: Image.asset(
                  'assets/b2.gif',
                  fit: BoxFit.fitHeight,
                )),
          )
        ],
      ),
    );
  }
}

class ElasticClipper extends CustomClipper<Path> {
  final Offset cp;

  ElasticClipper(this.cp);

  @override
  Path getClip(Size size) {
    // print("incomming"+cp.toString());
    Offset cpModified = cp == Offset(0.0, 0.0) ? Offset(size.width * .8, 0) : Offset(size.width + 1, cp.dy);

    Path path = Path();
    path.lineTo(size.width * .8, 0);
    path.quadraticBezierTo(cpModified.dx, cpModified.dy, size.width * .8, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    // TODO: implement getClip
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class CustomPaintLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: MyPainter(),
          child: Container(
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * .98);
    path.lineTo(0, size.height * .98);

    canvas.drawShadow(path, Colors.black, 8, true);
    canvas.drawPath(path, paint);

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class DartServer extends StatefulWidget {
  @override
  _DartServerState createState() => _DartServerState();
}

class _DartServerState extends State<DartServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        FlatButton(
          child: Text('listen'),
          onPressed: listen,
        ),
        FlatButton(
          child: Text('getData'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('terminate'),
          onPressed: () {},
        ),
        Text('output:'),
      ],
    ));
  }

  listen() async {
    HttpServer server = await HttpServer.bind('127.0.0.1', 8085);
    print('listening');
    server.listen((HttpRequest event) {
      event.response
        ..write('some reply ${UniqueKey()}')
        ..close();
    });
  }
}

class Drawings extends StatefulWidget {
  @override
  _DrawingsState createState() => _DrawingsState();
}

class _DrawingsState extends State<Drawings> {
  List<Map<int, List<Offset>>> points = [
    {
      0: [Offset(0, 0)]
    }
  ]; // name then initial value
  updatepoints({bool update = false, Map<int, List<Offset>> map, bool firstpoint = false}) {
    // datatype

    if (!update) {
      ///Todo : manipulation
      if (firstpoint) {
        if (points.length == 0)
          points.add(map);
        else
          points[0] = map;
      } else
        points.add(map);
    }
    _controller.sink.add(points);
  }

  undo() {
    points.removeLast();
    _controller.sink.add(points);
  }

  closeSink() {
    _controller.close();
  }

  final _controller = StreamController<List<Map<int, List<Offset>>>>.broadcast();

  Stream<List<Map<int, List<Offset>>>> get stream => _controller.stream;
  List<Offset> quadpoins = [Offset(0, 0), Offset(0, 0)];
  String currentSelection = 'NONE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
            children: <Widget>[
          DrawingCanvas(stream: stream),
          SafeArea(
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails d) {
                if (currentSelection == 'QCTR') {
                  points.last.values.first[1] = d.localPosition;

                  updatepoints(update: true);
                }
              },
              onPanStart: (DragStartDetails d) {
                if (currentSelection == 'STRT')
                  updatepoints(map: {
                    0: [d.localPosition]
                  }, firstpoint: true);
                else if (currentSelection == 'LINE')
                  updatepoints(map: {
                    points.length: [d.localPosition]
                  });
                else if (currentSelection == 'QUST') {
                  // quadpoins[0] = d.localPosition;
                  updatepoints(map: {
                    points.length: [d.localPosition, d.localPosition],
                  });
                  currentSelection = 'QCTR';
                }
              },
              child: Container(
                color: Colors.white12,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
            ),
          )
        ]),
        Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            FlatButton(
                child: Text('StartPoint'),
                onPressed: () {
                  currentSelection = 'STRT';
                  //updatepoints(map:{0:[Offset(0,0)]},firstpoint: true);
                }),
            FlatButton(
                child: Text('AddLineto'),
                onPressed: () {
                  currentSelection = 'LINE';
                  /*   updatepoints(map: {
                    points.length: [Offset(55, 0)]
                  });*/
                }),
            FlatButton(
                child: Text('curveTo_using_'),
                onPressed: () {
                  currentSelection = 'QUST';
                  /*  updatepoints(map: {
                    points.length: [Offset(55, 99), Offset(80, 99)]
                  });*/
                }),
            FlatButton(
                child: Text('undo'),
                onPressed: () {
                  undo();
                }),
          ],
        )
      ],
    ));
  }
}

class DrawingCanvas extends StatelessWidget {
  final Stream<List<Map<int, List<Offset>>>> stream;

  const DrawingCanvas({Key key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<Map<int, List<Offset>>>> snapshot) {
        return snapshot.hasData
            ? SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ClipPath(
                          clipper: ClipDemo(snapshot.data),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.red,Colors.orange])
                            ),
                          )),
                      color: Colors.green,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    FlatButton(child: Text('update'), onPressed: () {})
                  ],
                ),
              )
            : SizedBox(
                height: 200,
              );
      },
    );
  }
}

class ClipDemo extends CustomClipper<Path> {
  final List<Map<int, List<Offset>>> points;

  ClipDemo(this.points);

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    print(points);
    for (var map in points) {
      print(map);
      if (map.keys.first == 0) {
        path.moveTo(map.values.first[0].dx, map.values.first[0].dy);
        print('moved to ${map.values.first[0]}');
      } else if (map.values.first.length == 1) {
        path.lineTo(map.values.first[0].dx, map.values.first[0].dy);
        print('drawn to ${map.values.first[0]}');
      } else if (map.values.first.length == 2) {
        path.quadraticBezierTo(map.values.first.last.dx, map.values.first.last.dy, map.values.first.first.dx, map.values.first.first.dy);
        print('bez to ${map.values.first[1]}');
      }
    }

    /* path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);*/

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class WavesTrial extends StatefulWidget {
  @override
  _WavesTrialState createState() => _WavesTrialState();
}

class _WavesTrialState extends State<WavesTrial> {
  bool _enabled = true;

  /*  TweenAnimationBuilder(
            onEnd: (){
setState(() {

});
            },
            duration: Duration(seconds: 2),
            tween: Tween<double>(end: 0,begin: 22/7),
            builder: (BuildContext context, double value, Widget child) {
           return  Center(

                  child: ClipPath(
                    clipper: WaveClip(
                   value:value
                    ),
child: child,
                  ));
            },
             child: Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Colors.pink,Colors.blue,Colors.red]
             )
           ),
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
          ),*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.wh,

        body: Center(child: FlippingCard()));
  }
}

class FlippingCard extends StatefulWidget {
  @override
  _FlippingCardState createState() => _FlippingCardState();
}


class _FlippingCardState extends State<FlippingCard> with SingleTickerProviderStateMixin{

  AnimationController _controller ;
  Animation _flip;


  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    _flip = Tween<double>(begin: 0,end: 22/7).animate(CurvedAnimation(curve: Curves.easeOutQuad,parent: _controller));
  }

  double height=150, width = 150;
var children = <Widget>[
  Container(

    alignment: Alignment.center,
    color: Colors.blue,
    child: Text('help'),
  ),
  Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..rotateX(22/7),child: Container(

    alignment: Alignment.center,
    color: Colors.red,
    child: Text('help'),
  ),
  ),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(6),
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedBuilder(
            animation: _flip,
            builder: (BuildContext context, Widget child) {

              return GestureDetector(
              onTap: (){
                if(_controller.status==AnimationStatus.completed) _controller.reverse();
               else if(_controller.status==AnimationStatus.dismissed)_controller.forward();
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateX(_flip.value),
                child:IndexedStack(
                  index: sin(_flip.value/2).round(),
                  children:children
                ),
              ),
            );},

          )
        ],
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  final double value;

  WaveClip({this.value});

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, size.height * .5);
    path.quadraticBezierTo(size.width * .25, size.height / 2 + sin(2 * value) * 50, size.width * .5 + sin(2 * value) * 20, size.height * .5);
    path.quadraticBezierTo(size.width * .75 + sin(2 * value) * 20, size.height / 2 - sin(2 * value) * 50, size.width, size.height * .5);
    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}

class SlideToUnlockPage extends StatelessWidget {
  final List<String> days = <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final int hour = time.hour;
    final int minute = time.minute;
    final int day = time.weekday;
    final int month = time.month;
    final int dayInMonth = time.day;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide To Unlock'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 24.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Shimmer.fromColors(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/chevron_right.png',
                          height: 20.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                        ),
                        const Text(
                          'Slide to unlock',
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        )
                      ],
                    ),
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    loop: 3,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
