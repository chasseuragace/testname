import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountChangeNotifier extends ChangeNotifier {
  int _counter = 0;
  int get counterValue => _counter;
  set counterValue(int val)   {
    _counter = val;
    notifyListeners();
  }
  void setvalue() {
    counterValue++;
  }
}

class ChangeListenerUi extends StatelessWidget {
  CountChangeNotifier manager =CountChangeNotifier();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountChangeNotifier>.value(
      value: manager,
     
      
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Consumer<CountChangeNotifier>(
                builder: (context,manager,w){return Text(" from consumer"+manager.counterValue.toString());},
                 // child: Text('')
              ),

              DataFromProvider(),

              FlatButton(
                onPressed: (){
                  manager.setvalue();
                },
                child: Text('change value'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataFromProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data =Provider.of<CountChangeNotifier>(context);
    return Text(
     "from provider class "+ data.counterValue.toString()
    );
  }
}
