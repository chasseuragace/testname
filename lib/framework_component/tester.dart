
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:materialapp/framework_component/vertical_tabs.dart';

import 'gradient_app_bar.dart';

class TestMyTabbar extends StatefulWidget {
  @override
  _TestMyTabbarState createState() => _TestMyTabbarState();
}

class _TestMyTabbarState extends State<TestMyTabbar> {
  List<String> snapshotCache;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VerticalTabs(
          color:Colors.white,
          /* gradient: LinearGradient(
          colors: [Colors.red, Colors.orange],
          end: Alignment.bottomLeft,
          begin: Alignment.bottomRight),*/
          tabNames: [
            'Home',
            'Browse',
          ],
          children: [
            StreamBuilder(
              stream: stream ,
              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {


                if (!snapshot.hasData && !updating)   updateData();
                if(snapshot.hasData) snapshotCache=snapshot.data;
                return   Column(
                  children: <Widget>[
                    GradientAppBar(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.black12],
                          end: Alignment.bottomLeft,
                          begin: Alignment.bottomRight),
                      title: Text(
                        'Corona Updates Nepal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      centerTitle: true,
                      elevation: 6,


                    ),
                    SizedBox(height:30),
                    if (snapshotCache!=null)   Text('updated on : ' + snapshotCache[6].substring(10,16)),
                    Spacer(),


                    if(snapshotCache!=null)    Column(
                      children: <Widget>[
                        Text(snapshotCache[4]??'unknown',style: TextStyle(fontSize: 55,fontWeight: FontWeight.w600),),
                        Text('Active Cases',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Spacer(flex:1),
                    if(snapshotCache!=null)     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Text(snapshotCache[0]??'unknown',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
                            Text('Total Cases',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(snapshotCache[1]??'unknown',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
                            Text('Recovered',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Text(snapshotCache[2]??'unknown',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
                            Text('Death ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                    Spacer(flex:1),
                    if(snapshotCache!=null)     Column(
                      children: <Widget>[
                        Text(snapshotCache[5]??'unknown',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
                        Text('New Cases Today',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Spacer(flex:1)

                    //  Spacer(flex: 1,),

                  ],
                );
              },
            ),
            Center(child: Text('Aaru Tira Ko Ta Matlab Vayena Ni',textAlign: TextAlign.center,style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w600
            ),),)
          ],
        ));
  }

  Future<List<String>> fetch_stasts() async {
    var url = 'https://api.thevirustracker.com/free-api?countryTotal=NP';
    List<String> data =[];
    // Await the http get response, then decode the json-formatted response.
    try{ var response = await http.get(url).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        print('timed out');
        return null;
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      data.add(jsonResponse['countrydata'][0]['total_cases'].toString());
      data.add (jsonResponse['countrydata'][0]['total_recovered'].toString());
      data.add ( jsonResponse['countrydata'][0]['total_deaths'].toString());
      data.add ( jsonResponse['countrydata'][0]['total_new_cases_today'].toString());
      data.add (jsonResponse['countrydata'][0]['total_active_cases'].toString());
      data.add(jsonResponse['countrydata'][0]['total_new_cases_today'].toString());
      data.add(DateTime.now().toString());
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
    }catch(e){}

  }



  List<String> data =[];
  bool updating =false;
  updateData() async {
    print('updating data called ');
    updating =true;
    do{
      print('updating data ');
      data = await fetch_stasts();

      _controller.sink.add(data);
      await Future.delayed(Duration(seconds:20));

    }while(updating);

  }
  closeSink(){
    updating=false;
    _controller.close();
  }

  final _controller = StreamController<List<String>>.broadcast();//.broadcast();

  Stream<List<String>> get stream =>_controller.stream;

}
