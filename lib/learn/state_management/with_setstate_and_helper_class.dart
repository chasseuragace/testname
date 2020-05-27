import 'package:flutter/material.dart';

class HelperClass{
  Function callback;
  int value=0;
  increment(Function call){
    this.callback =call;
    value++;
    callback();
  }



}

class ChangeObserver extends StatefulWidget {
  @override
  _ChangeObserverState createState() => _ChangeObserverState();
}

class _ChangeObserverState extends State<ChangeObserver> {
  HelperClass helper =HelperClass();

  Function call() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
        child: Column(
        children: <Widget>[
          Text(helper.value.toString()),
          FlatButton(
            child: Text('update' + UniqueKey().toString()),
            onPressed: (){

              helper.increment(call);

            },
          )
        ])));
  }
}
