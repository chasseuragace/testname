import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  Random r =Random();
  Offset endvalue=Offset(0,12);
  bool flip=true;
  @override
  Widget build(BuildContext context) {
  Widget c1= Center(child: Container(
  height: 100,width: 100,color: Colors.orange,
  child: Text('this will be animated')),key: UniqueKey(),);
  Widget c2=Center(child: Container(
  width: 100,height: 100,color: Colors.brown,child: Text('this will be animated to this')
  ,key: UniqueKey(), ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TweenAnimationBuilder(


curve: Curves.easeInOutQuart,
        duration: Duration(milliseconds: 1000),
        child: c1,
        tween: Tween<Offset>(begin: Offset(0,0),end: endvalue),
        onEnd: (){
          setState(() {

             endvalue=Offset(r.nextDouble()*36.0*sqrt(22/7),r.nextDouble()*24.0*r.nextDouble());
          });
        },
        builder: (_,Offset dx,child){
         // print(angle);

          return Transform.translate(offset:  dx,child: child,);
        },
      ),
            FlatButton(child: Text('switch'),onPressed: (){setState(() {

              flip=!flip;

            });},)
          ],
        ),
      ),
    );
  }
}

class ExplicitAnimationsTest extends StatefulWidget {
  @override
  _ExplicitAnimationsTestState createState() => _ExplicitAnimationsTestState();
}

class _ExplicitAnimationsTestState extends State<ExplicitAnimationsTest> with SingleTickerProviderStateMixin {

  AnimationController _c;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _c=AnimationController(vsync: this,duration: Duration(seconds: 4));

  // _c.repeat();

  }
Random r =Random();
  int x=0,y=0;
  double z=0;
  double factor =0.0001;
  double zrot =0;
  double xrot =0;
  double yrot =0;
  bool show=false;
  double op=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      /*  Center(child: AnimatedBuilder(
          child: Container(height: 100,width:120,
              color:Colors.pink,
        child:
        Image.network('https://img.pngio.com/soccer-ball-'
            'png-flat-soccer-ball-outline-png-transparent-png-ball-outline-png-920_659.png')
    ),


          builder: (BuildContext context, Widget child) {
          return  Transform(
              alignment: Alignment.center,
              child: child,transform:
        // Matrix4.identity()..setEntry( x,y,z   )..rotateZ(_c.value*44/7)..rotateY(_c.value*44/7));
         Matrix4.identity()..setEntry( x,y,z   )..rotateY( angle*pi/180));



        }, animation: _c,)

          ,),
        RaisedButton(
          child: Text('for'),
          onPressed: (){

           x= r.nextInt(3)
           ;y= r.nextInt(3)
           ;z=r.nextDouble()*5;
           print("x: "+x.toString()+' y: '+y.toString()+' z: '+z.toString());
           setState(() {

           });
           // _c.repeat();
          },
        ),*/
        Text('translate x : $factor'),
        Slider(
          onChanged: (double d){
            setState(() {
              factor= d;
            });
          }, value: factor,
          min: -200,
          max: 200,

        ),
        Text('x rot $xrot'),
        Slider(
          onChanged: (double d){
            setState(() {
              xrot= d;
            });
          }, value: xrot,
          min: 0,
          max: 360,

        ),
        Text('y rot $yrot'),
        Slider(
          onChanged: (double d){
            setState(() {
              yrot= d;
            });
          }, value: yrot,
          min: 0,
          max: 360,

        ),
        Text('z rot $zrot'),
        Slider(
          onChanged: (double d){
            setState(() {
              zrot= d;
            });
          }, value: zrot,
          min: 0,
          max: 360,

        ),
      /*  Container(
          width:100,
          height:100,
          child: Material(
            elevation: 21,
            child: Container(
              height:100,
              width:100,
              child: Text('Text',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            ),
          ),
          alignment: Alignment.center,

          color: Colors.red,
          transform: Matrix4.identity()..setEntry(3, 2, factor)..rotateY(yrot* pi/180)..rotateZ(zrot*pi/180)..rotateX(xrot*pi/180),
        ),*/
        Stack(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.easeOutQuart,
              duration: Duration(milliseconds: 400),
              width:60,
              height:60,
              child: Material(
                color:Colors.orange,
                shadowColor: Colors.grey,
                elevation:show?1:38,
                child: Container(
                  height:60,
                  width:60,
                  child: AnimatedOpacity(
                      duration: Duration(milliseconds: 50) ,opacity: op,
                      child: Text('Text',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                ),
              ),
              alignment: Alignment.center,

              color: Colors.red,
              transform: show?( Matrix4.identity()..rotateY(0)..rotateZ(0)..rotateX(0) ):( Matrix4.identity()..rotateY(yrot* pi/180)..rotateZ(zrot*pi/180)..rotateX(xrot*pi/180)..translate(factor)),
            ),

          ],
        ),
        FlatButton(child: Text('animate'),onPressed:(){ setState(() {
          show=!show;
          show? op=1:op=0;
        });})




      ],
    ));
  }
}
