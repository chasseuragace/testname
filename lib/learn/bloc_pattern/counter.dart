import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materialapp/framework_component/gradient_app_bar.dart';
import 'package:provider/provider.dart';

class CounterBloc extends ChangeNotifier {
  int _counter = 0;

  int get counterValue => _counter;

  set counterValue(int val)   {
    _counter = val;
    notifyListeners();
  }

  void setvalue(int val) {
    counterValue = val;
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterBloc>.value(value: CounterBloc()),
      ],
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc count = Provider.of<CounterBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            count.setvalue((count.counterValue) + 1);
          },
        ),
        body: Column(
          children: <Widget>[
            GradientAppBar(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.red, Colors.orange],
                  end: Alignment.topRight,
                  begin: Alignment.bottomLeft,
                  stops: [.2, .5, 1]),
             title:Text( 'sdlk'),
            ),
            Container(
              height: 200,

              //  color: Colors.pink,
              child: Center(
                child: Text(
                  count.counterValue.toString(),
                  style: TextStyle(fontSize: 45),
                ),
              ),
            ),
          ],
        ));
  }
}
