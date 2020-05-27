import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialapp/learn/animations/animation_implicit.dart';
import 'package:materialapp/learn/state_management/with_change_notifier.dart';
import 'package:materialapp/organized_screen_browsing/state_bloc.dart';
import 'package:materialapp/shopProject/catalogue.dart';

import 'animation_designer.dart';
import 'food_app/food_menu.dart';

class OrganizedSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('liquid swipes'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FoodMenu();
              }));
            },
          ),
          ListTile(
            title: Text('ANimations '),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AnimationDesigner();
              }));
            },
          ),
          ListTile(
            title: Text('ExplicitAnimationsTest '),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ExplicitAnimationsTest();
              }));
            },
          ),
          ListTile(
            title: Text('test prov '),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return MyCustomBlocUI();
                }),
              );
            },
          ),
        ],
      ),
    ));
  }
}
