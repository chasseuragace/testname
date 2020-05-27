import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preferences saving loding and using a future method for it

 class SharedPreferencesWrapper extends StatefulWidget {
  @override
  _SharedPreferencesWrapperState createState() => _SharedPreferencesWrapperState();
}

class _SharedPreferencesWrapperState extends State<SharedPreferencesWrapper> {
   String data,recievedData;

   SharedPreferences _sharedPreferences;

   @override
   Widget build(BuildContext context) {

     return Scaffold(body: Column(
       children: <Widget>[
        TextFormField(
          onChanged: (input){
            data=input;
          },
        ),
         Text("the data is :${recievedData??' '} "),
         FlatButton(child: Text('Save it'),
         onPressed: ()async{
           save(data);
       recievedData =await getData();
       setState(() {

       });

         },)
       ],
     ),
     );
   }

   Future<bool> save(String data)async{
     SharedPreferences pref= await SharedPreferences.getInstance();
    return pref.setString("key", data);

   }

   Future<String> getData()async{
     SharedPreferences pref= await SharedPreferences.getInstance();
     return pref.getString("key");

   }
}
