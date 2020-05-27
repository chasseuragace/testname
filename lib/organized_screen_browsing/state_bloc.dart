import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DataManager {
  var _count = 0;
  Stream<int> get stream => _controller.stream;
  updatecount({bool update = false, int count}) {
    // datatype
    if (!update) {
      ///Todo : manipulation
      this._count = count;
    }
    _controller.sink.add(this._count);
  }

  closeSink() {
    _controller.close();
  }

  final _controller = StreamController<int>.broadcast(  );


}

class CounterPagex extends StatelessWidget {
  DataManager handler;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider.value(value: DataManager())],
      child: Scaffold(body: Widget1()),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('widget1'),
          Widget1_1(),
        ],
      ),
    );
  }
}

class Widget1_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text('widget1_!'),
        Consumer<DataManager>(
          builder: (BuildContext context, DataManager value, Widget child) {

            return Column(
              children: <Widget>[
                StreamBuilder(
                  stream: value.stream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                 //   snapshot.connectionState == ConnectionState.waiting ? value.updatecount(update: true) : null;
                    print(snapshot.connectionState);
                    return Text('data is ${snapshot.data}');
                  },
                ),
                FlatButton(
                    child: Text('update'),
                    onPressed: () {
                      value.updatecount(update: true);
                    })
              ],
            );
          },
        ),
      ],
    ));
  }
}

//

class WrapperForBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: CounterPage(),
    );
  }
}

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        key: UniqueKey(),
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'kds',
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'ks',
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}


//------------------------

enum UpdateEvents {raise,lower,updateTo, }

class MyCustomBloc extends ChangeNotifier{
  int _value=0;
  get currentValue=> _value;
    set currentValue (int val){
    _value=val;
    notifyListeners();
  }

  dispatch(UpdateEvents event,{ int data}){
      switch (event){
        case UpdateEvents.raise:
          currentValue++;
          break;
        case UpdateEvents.lower:
          currentValue--;
          break;
        case UpdateEvents.updateTo:
          currentValue=data;
          break;
      }
  }


}

class MyCustomBlocUI extends StatelessWidget {
  MyCustomBloc managerX;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCustomBloc>.value(
      value: MyCustomBloc(),


      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Consumer<MyCustomBloc>(
                builder: (context,manager,w){
                  managerX=manager;
                  return Text(" from consumer"+manager.currentValue.toString());},
                // child: Text('')
              ),

             // DataFromProvider(),

              FlatButton(
                onPressed: (){
                  managerX.dispatch(UpdateEvents.raise);
                },
                child: Text('up'),
              ), FlatButton(
                onPressed: (){
                  managerX.dispatch(UpdateEvents.lower);
                },
                child: Text('down'),
              ), FlatButton(
                onPressed: (){
                  managerX.dispatch(UpdateEvents.updateTo,data: 36);
                },
                child: Text('to'),
              ),
              Consumer<MyCustomBloc>(
                builder: (context,manager,w){
                  managerX=manager;
                  return Text(" from consumer"+manager.currentValue.toString());},
                // child: Text('')
              ),
            ],
          ),
        ),
      ),
    );
  }
}