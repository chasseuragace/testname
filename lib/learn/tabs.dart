
import 'package:flutter/material.dart';


class CarouselWithIndicator extends StatefulWidget {

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> with SingleTickerProviderStateMixin {
  TabController controller;
 ScrollController _sController;
  int length =3;
  int _current = 0;
  var size;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sController =ScrollController(initialScrollOffset: 0,);
    _sController.addListener((){xanimate(_sController.offset);});
   controller =TabController(vsync: this,length: length);
  controller.addListener((){
    print('listened');
  });
  }
  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[

          Column(
            children: <Widget>[
              SizedBox(height: 200,),
             /* CarouselSlider(

                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                items:[for(int i=0;i<length;i++) Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      Container(width: MediaQuery.of(context).size.width,
                          //color: Colors.black45,
                          height: 50,
                          child: Text('Tab Heading $i',style: TextStyle(color:(_current==i)?Colors.black45: Colors.black12,fontSize: 35)
                            ,)),



                    ],
                  ),
                  //  color: Colors.orange,
                ),],

                viewportFraction: 1.0,
                height: 50,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                    controller.animateTo(index);
                  });
                },
              ),*/
              Container(height: 100,width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: _sController,
                  children:<Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            labelColor: Colors.black87,
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey.withOpacity(.5),
                            controller: controller,
                            tabs: <Widget>[
                              for(int i=0;i<length;i++)
                                Tab(
                                    child:Container(width :200.0,height: 200,color: Colors.pink, child: Text('tab name $i'),)
                                ),

                            ],

                          ),
                        ),
                        Container(width: 200.0*2*length,height: 50,color: Colors.red.withOpacity(.5),),


                      ],
                    ), ]
                ),
              ),
              Container(
                height: 200,
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    for(int i=0;i<length;i++)
                   Container(width: double.infinity,height: 200,child: Text('tab $i'),),


                  ],

                ),
              ),
              FlatButton(
                onPressed: (){xanimate(2);},
                child: Text('ani'),
              )
            ],
          ),
        ],
      ),
    );
  }

  void xanimate(offset) {

 print (offset);
  int index =(offset/180).round();
 if(index<length) controller.animateTo(index);
  }




}