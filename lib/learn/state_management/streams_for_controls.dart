import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidthManager {
  double _width=0;
  final _controller = StreamController<double>.broadcast();

  changeWidthto(double width){
    print(width);
    _width =width;
    _controller.sink.add(_width);
  }

  Stream<double> get widthStream=> _controller.stream;
}

class Sliderx extends StatelessWidget {
  WidthManager manager= WidthManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(

         // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(

              children: <Widget>[
                SizedBox(width: 200,),
                StreamBuilder(
                  stream: manager.widthStream,
                  builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                    return AnimatedPositioned(
                      top: snapshot.hasData?

                      200-snapshot.data*2:0,
                      curve: Curves.bounceOut,
left: snapshot.hasData?

200-snapshot.data*2:0,

                      height: 200,
                      duration: Duration(milliseconds: 200),
                      child: Container(width: 200,height: 200,color: Colors.orange,child: Text('this thinfg'),),

                    );
                  },
                ),

                Container(
                  height: 200,
                  //color: Colors.black,
                  width: 200,
                  child: StreamBuilder(builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                  return  RotatedBox(quarterTurns: 3,


                    child: Slider(

                        activeColor: Colors.transparent,
                        inactiveColor: Colors.transparent,
                        value: snapshot.hasData?snapshot.data:0, onChanged: (va){
                      manager.changeWidthto(va);

                      },max: 100,min: 0,),
                  );
                  },stream: manager.widthStream,


                  ),
                ),

              ],
            ),
            Container(height: 200,
              color: Colors.black,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
