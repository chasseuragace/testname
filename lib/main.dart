import 'package:flutter/material.dart';
import 'package:materialapp/tabBarView.dart';

import 'learn/animations/animations_new.dart';
import 'learn/state_management/streams_for_controls.dart';
import 'learn/state_management/with_change_notifier.dart';
import 'organized_screen_browsing/organized_Display.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: OrganizedSelection(),
    ));

//// plant wala app
class Homex extends StatefulWidget {
  @override
  _HomexState createState() => _HomexState();
}

class _HomexState extends State<Homex> with SingleTickerProviderStateMixin {
  ScrollController sc;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: <Widget>[
    /*    Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 17,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),*/
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Top Picks',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 09),
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black87,
            isScrollable: true,
            unselectedLabelColor: Colors.grey.withOpacity(.5),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Top',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'indoor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'outdoor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'awesome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              PlantList(),
              PlantList(),
              PlantList(),
              PlantList(),
            ],
          ),
        )
      ],
    ));
  }
}
