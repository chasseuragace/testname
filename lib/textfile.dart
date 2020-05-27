import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class FileReader{
  Future<Map<String,String>> loadAsset() async {
  String data =  await rootBundle.loadString('assets/1_4');
  String heading= data.split('@h')[0];
  data=data.replaceAll('\n','@x');
  data= data.replaceAll('@n ', "#_#N");
  data= data.replaceAll('@n', "#_#N");
  data=  data.replaceAll('@b ', "#_#B");
  data=  data.replaceAll('@b', "#_#B");
  data=  data.replaceAll('@x ', "#_#X#_#N");
  data=  data.replaceAll('@x', "#_#X#_#N");
  data= data.replaceAll('@i ', "#_#I");
  data= data.replaceAll('@i', "#_#I");
  data= data.replaceAll('@d ', "#_#D");
  data= data.replaceAll('@d', "#_#D");
  data= data.replaceAll('@s ', "#_#S");
  data= data.replaceAll('@s', "#_#S");

  print(heading);
 // print(data);
  return {heading:data};
  }
}