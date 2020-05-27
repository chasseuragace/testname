import 'dart:async';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateManagerWithStream {



  var count =1;
  addnumber(){
    _controller.sink.add(count++);
  }
  closeSink(){
    _controller.close();
  }
  final _controller = StreamController<int>.broadcast();//.broadcast();
 Stream<int> get stream =>_controller.stream;
}

class StreamListenerUi extends StatelessWidget {


  StateManagerWithStream manager= StateManagerWithStream();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder(builder: (_,AsyncSnapshot<dynamic> snap){

              return Text( (snap.connectionState==ConnectionState.waiting)? 'no data ': snap.data.toString() );
            },stream: manager.stream,
            ),
            StreamProvider.value(
                value: manager.stream,
                child: DataFromProvider()),
            FlatButton(
              onPressed: (){
                manager.addnumber();
              },
              child: Text('new data ${UniqueKey().toString()}'),
            ), FlatButton(
              onPressed: (){
                manager.closeSink();
              },
              child: Text('close sink ${UniqueKey().toString()}'),
            )
          ],
        ),
      ),
    );
  }
}
class DataFromProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data =Provider.of<int>(context);

    return Text("from provider class"+(data??'no data').toString());
  }
}

