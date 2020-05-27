import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(child: Center(
        child: FlatButton(child: Text('to page 2'),onPressed: (){
          Navigator.push(context, PageRouteBuilder(

            pageBuilder: (context,anim1,anim2){

              return Container(child: PageTwo(anim1));
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {

              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation.drive(
                    Tween(begin: 0.5, end: 1.0).chain(
                      CurveTween(curve: Curves.easeOutCubic),
                    ),
                  ),
                  child: child
                ),

              );
            },
          ));
        },),
      ),),
    );
  }
}

class PageTwo extends StatelessWidget {
  final Animation<double> initialAnimation;

  const PageTwo(this.initialAnimation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: initialAnimation,
      builder: (context, value, child) {
        return Theme(
          data: ThemeData(
              canvasColor:
              ColorTween(begin: Color(0x00FFFFFF), end: Colors.red)
                  .transform(value)),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Text('this is page 2'),

          ],
        ),
      ),
    );
  }
}
