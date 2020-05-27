import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  String desc;
 double scalex=1;
  int focusedOn;
  ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController =ScrollController();
    _scrollController.addListener(changeDesc);
    setState(() {
      desc='initial desc';

    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

          height: 400,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context,index){
              return getPlantCard(
                index:index,
                  price: "150",
                  imagepath:
                  "https://www.freepnglogos.com/uploads/plant-png/plant-png-transparent-plant-images-pluspng-26.png", plantName: 'Green Plant',
                  plantType: 'I dont know');
            },
            controller: _scrollController,
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,

          ),
        ),
       Row(
         children: <Widget>[
           SizedBox(width: 20,),
           Text('Description', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.w600,fontSize: 25)
           ),
         ],
       ),
       Padding(
         padding: EdgeInsets.only(left: 20,top: 10),
         child:
           Text(desc,
               style: TextStyle(color: Colors.black ,fontSize: 20)
           ),

       ),

      ],
    );
  }

  getPlantCard(
      {String price, String imagepath, String plantType, String plantName, int index}) {

    return Container(
      margin: EdgeInsets.only(right: 18),
      child: Stack(

        children: <Widget>[
          SizedBox(height: 400,),
          AnimatedContainer(
          height: 350,
          width: 255,


            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 1,offset: Offset(1,1),spreadRadius: 1)],
                borderRadius: BorderRadius.circular(10),
                color: (focusedOn==index)?Colors.green:Colors.green[400]),


            child: Column(

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FROM',
                          style:
                              TextStyle(color: Colors.white38, fontSize: 18),
                        ),
                        Text(
                          '\$' + price,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                     /* color: Colors.pink,*/
                        height: 140,
                        width: 100,
                        child: Image.network(
                       imagepath,
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('TAB NAME',
                            style: TextStyle(
                                color: Colors.white38, fontSize: 14)),
                        Text(
                          plantName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        /*Container(

                        child: ListView(
                          children: <Widget>[

                            Text('item1')
                          ],
                        ),
                      )*/
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 255 - 25.0,
                      height: 35,
                      child: ListView(

                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                          margin: EdgeInsets.only(right: 10),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white38,style: BorderStyle.solid)),

                            child: Center(
                              child: Icon(
                                Icons.wb_sunny,
                                size: 20,
                                color: Colors.white38,
                              ),
                            ),
                          ),  Container(
                          margin: EdgeInsets.only(right: 10),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white38,style: BorderStyle.solid)),

                            child: Center(
                              child: Icon(
                                Icons.drive_eta,
                                size: 20,
                                color: Colors.white38,
                              ),
                            ),
                          ),  Container(
                          margin: EdgeInsets.only(right: 10),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white38,style: BorderStyle.solid)),

                            child: Center(
                              child: Icon(
                                Icons.grain,
                                size: 20,
                                color: Colors.white38,
                              ),
                            ),
                          ),  InkWell(
                            onTap: (){},
                            child: Container(
                            margin: EdgeInsets.only(right: 10),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),

                              ),

                              child: Center(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 325, left: 102),
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25)

                ),

                child: Icon(Icons.shopping_cart,color: Colors.white,),

          ),
            )
          ) ],
      ),

    );
  }

  void changeDesc() {

    var value =_scrollController.offset.round();

    var desIndex=(value/260.0).round();

    setState(() {
      focusedOn = desIndex;
      desc='plant desc ${desIndex+1}';
    });
  }
}
