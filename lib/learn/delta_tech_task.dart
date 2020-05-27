import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

var tabHeadings = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

var contentStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50);

class SliderTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 100,
              width: size.width,
              child: Center(
                child: Text(
                  'Top Content\nDelta Tech',
                  textAlign: TextAlign.center,
                ),
              ),
              color: Colors.grey,
            ),//100
            Container(
              height: 50,
              child: Text(
                'Solution 1',
                style: contentStyle.apply(fontSizeFactor: .5),
              ),
            ),//50
            DefaultTabController(
              length: 6,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.black87,
                        isScrollable: true,
                        unselectedLabelColor: Colors.white.withOpacity(.5),
                        tabs: <Widget>[
                          for (int i = 0; i < 6; i++)
                            Container(

                              height: 50,
                              child: Tab(
                                  child: Text(
                                'Tab name ${i + 1}',
                                style: tabHeadings,
                              )),
                            ),
                        ],
                      ),
                      Container(
                        color: Colors.black.withOpacity(.0001),
                        height: 50,
                        width: size.width,
                      )
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 200,
                    child: TabBarView(
                      children: <Widget>[
                        for (int i = 0; i < 6; i++)
                          Container(
                            color: Colors.grey[350],
                            child: Center(
                                child: Text(
                              'Tab content ${i + 1}',
                              style: contentStyle,
                            )),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //250
            Container(
              height: 50,
              child: Center(
                child: Text(
                  'Solution 2',
                  style: contentStyle.apply(fontSizeFactor: .5),
                ),
              ),
            ),//50
            Container(
                height: size.height-100-50-250-50-50,
                width: size.width,
                color: Colors.grey,
                child: SliderPage()),//200
            Container(
              height: 50,
              color: Colors.grey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.print),
                  Icon(Icons.save_alt),
                  Icon(Icons.looks),
                ],
              ),
            )//50
          ],
        ),
      ),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  var _current = 0;
  var size;
  int length = 5;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselSlider(
      enableInfiniteScroll: false,
      scrollDirection: Axis.horizontal,
      items: <Widget>[
        for (int i = 0; i < length; i++)
          AnimatedOpacity(
            opacity: (_current == i) ? 1 : .3,
            //color: (_current==i)? Colors.grey:Colors.grey[400],
            duration: Duration(seconds: 1),
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: (_current == i) ? Colors.grey : Colors.grey[400],
                      borderRadius: (_current == i)
                          ? BorderRadius.only(topLeft: Radius.circular(0),)
                          : BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                    ),
                    padding: EdgeInsets.only(top: 15, left: 10),
                    width: size.width,
                    height: 50,
                    child: Text(
                      'Tab Heading ${i + 1}',
                      style: tabHeadings,
                    )),
                Expanded(
                    child: AnimatedContainer(
                        color:
                            (_current == i) ? Colors.grey : Colors.grey[400],
                        duration: Duration(seconds: 1),
                        child: Center(
                            child: Text('Tab Content ${i + 1}',
                                style: contentStyle))))
              ],
            ),
          ),
      ],
      viewportFraction: 1.0,
      height: double.infinity,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}
