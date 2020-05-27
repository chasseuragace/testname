import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  int show;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {

        return Container(

          margin: EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
              color: Colors.white,
          //  boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(1,1),blurRadius: 1)]

          ),
          child: ListTile(
            trailing: (show==index)?SizedBox(child: InkWell(child: Icon(Icons.delete),onTap: (){
              showAlertDialogue(context);
            },),height: 70,width: 30,):null,
            onTap: (){

              setState(() {
                show=   (show==index)?-1:
                index;
              });
            },
            onLongPress: () {
              print('action');
            },
            leading: Icon(
              Icons.person,
              size: 50,
            ),
            title: Text('Someonr Name'),
            subtitle: (((show??-1)==index))?Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Email'),
                    Text('somerandomemail@.com'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Phone'),
                    Text('9812457568'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Selected Product'),
                    Text('Some random Product'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Images in gallery'),
                    Text('25'),
                  ],
                ),
              ],
            ):Container()
          ),
        );
      }),
    );
  }

   showAlertDialogue(BuildContext c) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      child: AlertDialog(
        
        title: Text('Delete this user'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){Navigator.pop(context);},
            child: Text('No'),
          ),FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Yes'),
          )
        ],

      ),
    );
  }
}
