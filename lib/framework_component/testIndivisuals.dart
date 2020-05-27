import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materialapp/framework_component/stylish/bubbles.dart';

import 'package:materialapp/framework_component/vertical_tabs.dart';

import 'customIndicatorTabs.dart';

class TestClass extends StatelessWidget {
  Color holderBg = Colors.grey;
  Color tabColor = Colors.black45;
  double extraSpace ;
  double tabWidth ;
  double tabHeight ;
  double scale=1;
  @override
  Widget build(BuildContext context) {

extraSpace = MediaQuery.of(context).size.height * .4;
    tabWidth = MediaQuery.of(context).size.height;
    tabHeight = MediaQuery.of(context).size.width * .15;
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Transform.scale(
          child: Stack(
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Container(

                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.height,
                  child: DefaultTabController(


                    length: 5,
                    child: Column(
                      //alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        _tabTitles(),
                        _tabContents(context),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          scale: scale,
        ));
  }
  var showBubbles =true;
  triggerBubbles(){
    showBubbles=!showBubbles;
    _controller.sink.add(showBubbles);
  }
  closeSink(){
    _controller.close();
  }
  final _controller = StreamController<bool>.broadcast();//.broadcast();
  Stream<bool> get stream =>_controller.stream;

  Widget _tabTitles() {


    return  Container(

      decoration: BoxDecoration(
          color: holderBg,

      ),
      child: Row(
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(right:tabHeight/4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight:  Radius.circular(tabHeight/2),
                //topRight:  Radius.circular(36),
                bottomRight:  Radius.circular(tabHeight/2),

              ),
              color: tabColor,
            ),
            width: tabWidth - extraSpace,
            height: tabHeight,
            child:_tabBarDisplaySetup()// _viewPagerSetup()
              /// todo :
            /// naya stateful widget
            /// gesture detector container
            /// on click animate textsstyle
            /// seteup stream to scroll body with heading

          ),
          Container(
            width: extraSpace,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Notice(height: tabHeight,stream:stream),
                Spacer(),
                GestureDetector(onTap: (){

                  triggerBubbles();

                },child: Text("4:36 PM",style: TextStyle(color: Colors.black54,fontSize: tabWidth*.025,fontWeight: FontWeight.w600,letterSpacing: 2),)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.settings,color: Colors.black,size: tabWidth*.040,),
                ),],
            ),
            alignment: Alignment.center,
            height: tabHeight,
          ),
        ],
      ),
    );
  }
  _tabBarDisplaySetup(){
    return TabBar(

        indicatorColor: Colors.orange,
        isScrollable: true,
        tabs: <Widget>[

          Container(
              alignment: Alignment.center,
              height: tabHeight,
              width: 100,
              child: Text('Home',textAlign: TextAlign.center,)), Container(
              alignment: Alignment.center,
              height: tabHeight,
              width: 100,
              child: Text('Library',textAlign: TextAlign.center,)), Container(
              alignment: Alignment.center,
              height: tabHeight,
              width: 100,
              child: Text('Profile ',textAlign: TextAlign.center,)),
          Container(
              alignment: Alignment.center,
              height: tabHeight,
              width: 100,
              child: Text('Tab 3 sdsd sd s s s ds ',textAlign: TextAlign.center,)),Container(
              alignment: Alignment.center,
              height: tabHeight,
              width: 80,
              child: Text('Tab 3 sdsd sd s s s ds ',textAlign: TextAlign.center,)),
        ]
    );
}
  _viewPagerSetup(){
    PageController _pc= PageController(viewportFraction: .3, initialPage: 0);
    return PageView(
  controller: _pc,
      children: <Widget>[

        Container(
            alignment: Alignment.center,
            height: tabHeight,
            width: 100,
            child: Text('Home',textAlign: TextAlign.center,)), Container(
            alignment: Alignment.center,
            height: tabHeight,
            width: 100,
            child: Text('Library',textAlign: TextAlign.center,)), Container(
            alignment: Alignment.center,
            height: tabHeight,
            width: 100,
            child: Text('Profile ',textAlign: TextAlign.center,)),
        Container(
            alignment: Alignment.center,
            height: tabHeight,
            width: 100,
            child: Text('Tab 3 sdsd sd s s s ds ',textAlign: TextAlign.center,)),Container(
            alignment: Alignment.center,
            height: tabHeight,
            width: 80,
            child: Text('Tab 3 sdsd sd s s s ds ',textAlign: TextAlign.center,)),
      ],
    );
  }
  _tabContents(context) {

    return  Container(

      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.width - tabHeight,
    //  height: MediaQuery.of(context).size.width ,//- tabHeight,
      child: TabBarView(
        children: <Widget>[
          tabContent(
              child: Container(
                color: Colors.pink,
                child: Center(child: Text('hello')),
              )),tabContent(
              child: Container(
                color: Colors.pink,
                child: Center(child: Text('hello')),
              )),
          tabContent(
              child: Container(
                color: Colors.green,
              )),tabContent(
            child: Container(
              color: Colors.brown[800].withOpacity(.999),
              child: Image.network('https://pluspng.com/img-png/wine-hd-png-wine-png-image-512.png',fit: BoxFit.cover,),),
          ),
          tabContent(
              child: Container(
                color: Colors.orangeAccent,
              )),
        ],
      ),
    );
  }


}



tabContent({Widget child}) {
  return RotatedBox(
    child: child,
    quarterTurns: 1,
  );
}
/*
VerticalTabs(
color: Color(0xff2F3028),
tabNames: <String>['Home', 'Browse'],
labelStyle: TextStyle(color: Colors.orange, letterSpacing: 2,fontWeight: FontWeight.bold),
unselectedLabelStyle:
TextStyle(color: Colors.white60, letterSpacing: 2),
children: <Widget>[
Column(
children: <Widget>[
Container(
height: 250,
width: 250,
color: Colors.red,
),
],
),
Container(
height: 250,
width: 250,
color: Colors.pink,
),
],
//bodyBackgroundColor: Color(0xff2F4428),
),*/
class Notice extends StatefulWidget {
  final height;
  final Stream stream;

  const Notice({Key key, this.height, this.stream}) : super(key: key);
  @override
  _NoticeState createState() => _NoticeState();
}

bool notify=false;
class _NoticeState extends State<Notice> {
  int current=0;
  bool move=false;
  @override
  Widget build(BuildContext context) {

    return   IndexedStack(
      index: current,
      children: <Widget>[
        AnimatedPositioned(
          onEnd: (){
          if(move==true)  setState(() {
              current=1;
            });
          },
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInCubic,
          left:move?-120:0,
          child: RotatedBox(
              quarterTurns: 1,
              child: GestureDetector(

                  onTap: (){

                    setState(() {
move=!move;
                    });
                  },
                  child: Bubbles(source: widget.stream,height: widget.height*2,))),
        ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    move=!move;
                    current=0;
                  });
                }
                ,child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text('You have\na notification ',textAlign:TextAlign.center,style: TextStyle(color: Colors.black,wordSpacing: 1,fontWeight: FontWeight.bold,fontSize: 16),)),
                ))
      ],
    );
  }
}
