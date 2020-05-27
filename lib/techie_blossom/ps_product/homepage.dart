import 'dart:async';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Color backgroundColor = Colors.black38;

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomepageScreen();
  }
}

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar:  _BottomBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(
              height: size.height * .69,
              width: size.width * .4,
              color: backgroundColor),
          SafeArea(
            child: ListView(
             //   mainAxisAlignment: MainAxisAlignment.start,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _AppBar(),
                SizedBox(
                  height: 10,
                ),
                _Title(text: 'Featured Products'),
                SizedBox(
                  height: 25,
                ),
                _SettingsAndOptions(),

                _TabViews(),


                //SizedBox(height: 14,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.all(6),
      child: ClayContainer(
        curveType: CurveType.concave,
        depth: 24,
        borderRadius: 25,
        child: StreamBuilder(
          stream: BottomNavigation.currentSelectionStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            snapshot.hasData ? null : BottomNavigation.updateSelected(-1);
            return Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        BottomNavigation.updateSelected(0);
                      },
                      child: ClayButton(
                          name: 'Home',
                          icon: Icons.home,
                          selected: snapshot.data == 0)),
                  GestureDetector(
                      onTap: () {
                        BottomNavigation.updateSelected(1);
                      },
                      child: ClayButton(
                          name: 'Account',
                          icon: Icons.person,
                          selected: snapshot.data == 1)),
                  GestureDetector(
                      onTap: () {
                        BottomNavigation.updateSelected(2);
                      },
                      child: ClayButton(
                          name: 'Setting',
                          icon: Icons.settings,
                          selected: snapshot.data == 2)),
                  GestureDetector(
                      onTap: () {
                        BottomNavigation.updateSelected(3);
                      },
                      child: ClayButton(
                          name: 'Wishes',
                          icon: Icons.bookmark,
                          selected: snapshot.data == 3)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget ClayButton({
    IconData icon,
    String name,
    bool selected,
  }) {
    return

        AnimatedContainer(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: <Widget>[
              Icon(icon),
              if (selected)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width: .3,
                  height: 35,
                  color: Colors.white12,
                ),
              if (selected)
                Text(
                  name,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,color: Colors.black),
                ),
            ],
          )),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected ? backgroundColor : Colors.transparent,
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, -2),
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(2, 2))
                ]
              : []),
    );
  }
}

class BottomNavigation {
  static int _selected = 0;

  static updateSelected(int index) {
    if (index >= 0) _selected = index;
    _controller.sink.add(_selected);
  }

  closeSink() {
    _controller.close();
  }

  static final _controller = StreamController<int>.broadcast(); //.broadcast();

  static Stream<int> get currentSelectionStream => _controller.stream;
}

class _TabViews extends StatelessWidget {
  final int options = 3;
  final PageController _pctrl = PageController();

  setupListner() {
    bool listen = true;
    _pctrl.addListener(() {
      (_pctrl.page.round() != OptionsNavigation._selected && listen)
          ? OptionsNavigation.updateSelected(_pctrl.page.round())
          : null;
    });
    OptionsNavigation.currentSelectionStream.listen((onData) async {
      listen = false;
      try {
        await _pctrl.animateToPage(onData,
            duration: Duration(milliseconds: 200), curve: Curves.easeOutQuad);
      } catch (e) {}
      listen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    setupListner();

    return Column(
      children: <Widget>[
        SizedBox(
            height: 300,
            child: PageView(
              controller: _pctrl,
              children: <Widget>[
                for (int index = 0; index < options; index++)
                  SizedBox(
                    child: PageView.builder(
                      pageSnapping: true,
                      itemCount: 3,
                      controller: PageController(viewportFraction: .7),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomPlaceHolder(
                            color: Colors.grey,
                            child: Icon(
                              Icons.dashboard,
                              size: 50,
                            )
                            //Image.asset('assets/bf1.png'),
                            ,
                            title: 'This is  remote',
                            description: ' behold the extremee bla bla.');
                      },
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}

class CustomPlaceHolder extends StatelessWidget {
  final Color color;
  final Widget child;
  final String title, description;
  TextStyle titleStyle =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle descriptionStyle = TextStyle(
      color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600);

  CustomPlaceHolder(
      {Key key, this.color, this.child, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
  
        Padding(
          padding: EdgeInsets.only(right: 50,top: 15),
          child: Material(
            color: Colors.grey[350],
            shape: ItemCardShape(
                MediaQuery.of(context).size.width*.65,
              //MediaQuery.of(context).size.height*.30,
              250
            ),
            elevation: 10,

          ),
        ),

        Padding(
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
          padding: EdgeInsets.all(50),
        ),
        Positioned(
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: titleStyle,
                  ),
                  Text(
                    description,
                    style: descriptionStyle,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}



class Background extends StatelessWidget {
  final double height, width;
  final Color color;

  const Background({Key key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: height,
      width: width,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
         // image: DecorationImage(
          //  image: AssetImage('assets/background.jpg'),fit: BoxFit.cover,
            //  colorFilter: ColorFilter.mode(Colors.white38, BlendMode.lighten)
        //  ),
            color: color,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClayContainer(
            parentColor: Colors.white,
            height: 50,
            width: 50,
            // spread: 0,
            depth: 35,
            borderRadius: 25,
            curveType: CurveType.concave,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0x33647082),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Icon(Icons.menu)),
          ),
          ClayContainer(
            parentColor: Colors.grey,
            height: 50,
            width: 50,
            // spread: 0,
            depth: 35,
            borderRadius: 25,
            curveType: CurveType.concave,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0x33647082),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: words[0],
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
              text: "\n" + words[1],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2))
        ]),
      ),
    );
  }
}

class OptionsNavigation {
  static int _selected = 0;

  static updateSelected(int index) {
    if (index >= 0) _selected = index;
    _controller.sink.add(_selected);
  }

  closeSink() {
    _controller.close();
  }

  static final _controller = StreamController<int>.broadcast(); //.broadcast();

  static Stream<int> get currentSelectionStream => _controller.stream;
}

class _SettingsAndOptions extends StatelessWidget {
  List<Option> options = [
    Option(
        name: "Remote",
        icon: Icon(
          Icons.videogame_asset,
          size: 40,
        )),
    Option(
        name: "TV",
        icon: Icon(
          Icons.tv,
          size: 40,
        )),
    Option(
        name: "Console",
        icon: Icon(
          Icons.keyboard,
          size: 40,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Container(
              width: 50,
              child: Icon(
                Icons.short_text,
                size: 50,
              )),
          _options()
        ],
      ),
      padding: EdgeInsets.only(left: 32),
    );
  }

  Widget _options() {
    return StreamBuilder(
      builder: (_, AsyncSnapshot<int> snap) {
        snap.hasData ? null : OptionsNavigation.updateSelected(-1);
        return snap.hasData
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (int index = 0; index < options.length; index++)
                  GestureDetector(
                    onTap: () {
                      OptionsNavigation.updateSelected(index);
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: snap.data == index
                                ? Colors.white38.withOpacity(.6)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:(snap.data == index)?  [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3))
                            ]:[]),
                        height: 50,
                        width: 50,
                        child: options[index].icon),
                  ),
              ])
            : Container();
      },
      stream: OptionsNavigation.currentSelectionStream,
    );
  }
}

class Option {
  final String name;
  final Icon icon;

  const Option({this.name, this.icon});
}

class Item {
  String name, description, id;
}

class ItemCardShape extends ShapeBorder{
  final double width;
  final double height;

  ItemCardShape(this.width, this.height);
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    Size size= Size(width,height);
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(
        size.width + 1, size.height - 1, size.width, size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(
        size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;

  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }

}