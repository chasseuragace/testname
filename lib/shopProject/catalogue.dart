import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteShopCatalogue extends StatelessWidget {
  final TabNavigation navigator = TabNavigation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body:/* Transform.scale(

scale: 1,          child: ScrollConfiguration(
            child: SingleChildScrollView(
                child: Row(
              children: <Widget>[
                VerticalTabs(navigator: navigator),
                Expanded(flex: 1, child: TabsContent(navigator: navigator)),
              ],
            )),
            behavior: NoGlowBehaviour(),
          ),
        )*/
      Center(
        child: ListWheelScrollView(itemExtent: 32,
          magnification: 1.2,

          useMagnifier: true,
          diameterRatio: 1,
          children: <Widget>[
          Container(
              height: 250,width: 200,
              color: Colors.pink,
              child: Text('hello')),
            Container(
              height: 300,width: 200,
              color: Colors.orange,
              child: Text('hello')),
            Container(
              height: 400,width: 200,
              color: Colors.black,
              child: Text('hello')),

 Container(
              height: 250,width: 200,
              color: Colors.pink,
              child: Text('hello')),
            Container(
              height: 300,width: 200,
              color: Colors.orange,
              child: Text('hello')),
            Container(
              height: 400,width: 200,
              color: Colors.black,
              child: Text('hello')),



        ],

        ),
      )
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class TabsContent extends StatelessWidget {
  final TabNavigation navigator;

  const TabsContent({Key key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18, right: 18.0),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          )),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, left: 20),
                      child: Text(
                        'Foods',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    HorizontalSlider(
                      height: MediaQuery.of(context).size.height * .6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, left: 20),
                      child: Text(
                        'Combos',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    HorizontalSlider(
                      height:50,
                      combo: true,
                    ), SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalSlider extends StatelessWidget {
  final double height;
  final bool combo;

  const HorizontalSlider({Key key, this.height, this.combo = false})
      : super(key: key);

  _foodCard({String image, String name, transparent = true}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: height * .6,
      height: height,
      // color: Colors.black,
      child: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            bottom: 16,
            child: Card(
              elevation: 10,

              child: Container(
                height: .56 * height,
                width: height*.55,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: height * .4 * .38),
                      child: Text(name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: height * .05,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              height: 1.15)),
                    ),
                    Text(
                      'Rs. 240',
                      style: TextStyle(
                          fontSize: height * .042,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: height * .0254,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: height * .6 * .081,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: height * .6 * .081,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: height * .6 * .081,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: height * .6 * .081,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: height * .6 * .081,
                        ),
                        false
                            ? Container(
                                padding: EdgeInsets.all(2),
                                height: height * .6 * .203,
                                width: height * .6 * .203,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.redAccent.withOpacity(.6),
                                        blurRadius: 12,
                                        offset: Offset(0, 4))
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  size: height * .6 * .1,
                                  color: Colors.white,
                                ))
                            : SizedBox(
                                height: height * .6 * .203,
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            width: height * .495,
            height: height * .525,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(height * .625 * .06),
              child: Container(
                child: Image.asset(
                  transparent ? "" : image,
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[200],
              ),
            ),
          ),
          if (transparent)
            Positioned(
              top: 0,
                width: height * .6,
                height: height * .5,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return combo? Container(

      height:height+10,
      width: MediaQuery.of(context).size.width,
      //color: Colors.pink,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
         _comboCard(image:'assets/banner.jpg',description:'Orang juice and Banana Pulb ',),
         _comboCard(image:'assets/banner.jpg',description:'Orang juice and Banana Pulb ',),
         _comboCard(image:'assets/banner.jpg',description:'Orang juice and Banana Pulb ',),
        ],
      ),
    ) : Container(
      height:   max(height+10,180.0),
      width: MediaQuery.of(context).size.width,
      //color: Colors.pink,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _foodCard(name: 'Pepsi', image: 'assets/pepsi.png'),
          _foodCard(name: 'Pepsi', image: 'assets/pizza.png'),
          _foodCard(name: 'Momp Plate', image: 'assets/plate.png'),
          _foodCard(
              name: 'Momp Plate',
              image: 'assets/plate.png',
              transparent: false),
        ],
      ),
    );
  }

  _comboCard({String image, String description}) {
    return (
      Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        color:Colors.white,
        child: Container(

          constraints: BoxConstraints(
            minWidth: 260,

          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          width: height*3.5,
          height: height+3,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: max(height*3.5,260)*.6,child: Text(description,style: TextStyle(color: Colors.black,fontSize:  height*.286,fontWeight: FontWeight.w400,letterSpacing: .126),textAlign: TextAlign.center,)),
              Text('@ Rs 500',style: TextStyle(color: Colors.black  ,fontSize: height*.286),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    ));
  }
}

class VerticalTabs extends StatelessWidget {
  final TabNavigation navigator;

  const VerticalTabs({Key key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * .12;
    return Container(
      margin: EdgeInsets.only(right: 1),
      color: Colors.white,
      width: width,
      height: height,
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: width * .50,
            ),
            Icon(Icons.menu),
            Spacer(
              flex: 1,
            ),
            Tabs(
              naivgator: navigator,
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final TabNavigation naivgator;
  final TextStyle labels = const TextStyle(
    color: Colors.grey,
  );
  final TextStyle selectedlabels = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1);

  const Tabs({Key key, this.naivgator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = .7 * MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: naivgator.stream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (!snapshot.hasData) {
          naivgator.updateselectedTab(update: true);
          return SizedBox();
        } else
          return Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * .12,
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        naivgator.updateselectedTab(selectedTab: 0);
                      },
                      child: Container(
                          color: Colors.white.withOpacity(0.001),
                          width: maxWidth / 3,
                          child: Center(
                            child: Text(
                              'Explore',
                              style: snapshot.data == 0 ? selectedlabels : labels,
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        naivgator.updateselectedTab(selectedTab: 1);
                      },
                      child: Container(
                        color: Colors.white.withOpacity(0.001),
                        width: maxWidth / 3,
                        child: Center(
                            child: Text(
                              'Specials',
                              style: snapshot.data == 1 ? selectedlabels : labels,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        naivgator.updateselectedTab(selectedTab: 2);
                      },
                      child: Container(
                        color: Colors.white.withOpacity(0.001),
                        width: maxWidth / 3,
                        child: Center(
                            child: Text(
                              'Top pick',overflow: TextOverflow.ellipsis,
                              style: snapshot.data == 2 ? selectedlabels : labels,
                            )),
                      ),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  bottom: 2,
                  left:snapshot.data* maxWidth/3+(maxWidth/3)/2-(maxWidth * .015)/2,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    height: maxWidth * .015,
                    width: maxWidth * .015,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                )
              ],
            ),
          );
      },
    );
  }
}

class TabNavigation {
  var currentTabIndex = 2; // name then initial value
  updateselectedTab({bool update = false, int selectedTab}) {
    // datatype
    print('updating');
    if (!update) {
      // Todo : manipulation
      currentTabIndex = selectedTab;
    }
    _controller.sink.add(currentTabIndex);
  }

  closeSink() {
    _controller.close();
  }

  final _controller = StreamController<int>.broadcast();

  Stream<int> get stream => _controller.stream;
}
