import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: NoGLow(),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: 50,height: 50,decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(18)),),
                Container(width: 50,height: 50,decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search),
                )),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 40),
            child: Text(
              'Hara Hetta Nae!',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ScrollConfiguration(
              behavior: NoGLow(),
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, ind) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              if (ind == 2)
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 3),
                                    blurRadius: 5)
                            ],
                            gradient: LinearGradient(
                                colors: (ind == 2)
                                    ? [
                                        Colors.brown[500],
                                        Colors.brown[400],
                                        Colors.brown[500]
                                      ]
                                    : [Colors.grey[200], Colors.grey[200]],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(6)),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.ac_unit,
                          color: (ind == 2) ? Colors.yellow : Colors.black54,
                        )),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ScrollConfiguration(
              behavior: NoGLow(),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (__, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          SizedBox(
                            width: 160,
                          ),
                          Positioned(
                            bottom: 3,
                            child: Container(
                              padding: EdgeInsets.only(left: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Astra Mordan Chair',
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Local Stores',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Rs. 200.5',
                                        style:
                                            Theme.of(context).textTheme.body1,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.brown[800],
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.yellow,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                              width: 155,
                              height: 185,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 1,
                                        offset: Offset(0, 2)),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red.withOpacity(.5),
                                        blurRadius: 5,
                                        offset: Offset(0, 3))
                                  ]),
                              width: 25,
                              height: 25,
                              child: Center(
                                  child: Icon(
                                Icons.star,
                                color: Colors.white,
                              )),
                            ),
                            width: 135,
                            height: 150,
                            decoration: BoxDecoration(
                                /*image: DecorationImage(
                                  image: NetworkImage(
                                  'https://cdn.imgbin.com/8/7/16/imgbin-3d-computer-graphics-chair-couch-furniture-3d'
                                      '-modeling-hand-painted-sofa-3d-cartoon-decoration-iewYD22wQ78qK7pA8Qi2bF3mk.jpg'),fit: BoxFit.cover),*/
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'Featured',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            margin: EdgeInsets.all(6),
            height: 85,
            width: MediaQuery.of(context).size.width,

            child: ScrollConfiguration(
              behavior: NoGLow(),
              child: ListView.separated(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        elevation: 1,
                        child: Container(
                          height: 85,
                          width: MediaQuery.of(context).size.width / 1.45,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(width: 80,height: 80,color: Colors.green,),

                              Row(
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: <Widget>[
                                      Text(
                                        'Astra Mordan Chair',
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Local Stores',
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Rs. 200.5',
                                        style:
                                        Theme.of(context).textTheme.body1,
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 15,),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.brown[800],
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {return SizedBox(width: 16,height: 85,);},),
            ),
          )
        ],
      ),
    ));
  }
}

class NoGLow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
