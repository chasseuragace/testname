import 'package:flutter/material.dart';

class HomePageFOrSlider extends StatelessWidget {
  String selected ='';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (_){
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        _selected('option1');
                      },
                      title: Text('option 1'),
                      leading: Icon(Icons.home),
                    ),

                  ],
                );
              });
            },
            child: Text('show sheet'),
          ),
          Text('selected : $selected')
        ],
      ),
    );
  }

  void _selected(String s) {
    this.selected=s;
   // Navigator.pop(context);

  }
}
