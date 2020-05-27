import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:materialapp/textfile.dart';

class TestText extends StatelessWidget {
  Description des = new Description();
  FileReader fr = FileReader();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: FutureBuilder(
        future: fr.loadAsset(), builder: (BuildContext context, AsyncSnapshot<Map<String,String>> snapshot) {


          return snapshot.hasData? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: des.DesPara(
                heading: snapshot.data.keys.first,
                image: '571.jpg',
                content:snapshot.data.values.first
              ),
            ),
          ):Container();
      },
      ),
    );
  }
}

class Description {


  DesBold(String heading) {
    return TextSpan(
      text: heading,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
  DesDots(String heading) {
    return TextSpan(
      text: heading,
      style: TextStyle(
        fontWeight: FontWeight.w800,fontSize: 18
      ),
    );
  } DesItalics(String heading) {
    return TextSpan(
      text: heading,
      style: TextStyle(
        fontWeight: FontWeight.w800,fontSize: 18,fontStyle: FontStyle.italic
      ),
    );
  }
  DesImage({String name, bool long = false}) {
    return Image.asset(
      'assets/' + name,
      //height: long ? 600 : 200,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }

  DesNormal(String text) {
    return TextSpan(
      text: text,style: TextStyle(

    )
    );
  }



  Widget DesPara(
      {String heading,
      String content,
      String image,
      bool showImageFirst = true}) {
    List<Widget> layout = [
      SafeArea(
        child: Center(
            child: Text(heading.trim(),textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )),
      ),
     // image != null ? DesImage(name: image) : SizedBox(),
    ];

    List<TextSpan> styledText = [];

    List<String> parts = content.split('#_');
    bool first = true;
    parts.forEach((part) {
      if (!first) {

        if (part.substring(0, 2) == '#N')
          styledText.add(DesNormal(part.substring(2)));
        else if (part.substring(0, 2) == '#B')
          styledText.add(DesBold(part.substring(2)));
        else if (part.substring(0, 2) == '#X')
          styledText.add(DesBold('\n'));
        else if (part.substring(0, 2) == '#I') {

          layout.add(
              RichTextInLayout(styledText));
          styledText = [];
          layout.add(DesImage(name: part.substring(2).trim()));
        }else if (part.substring(0, 2) == '#D')
          styledText.add(DesDots(part.substring(2)));
        else if (part.substring(0, 2) == '#S')
          styledText.add(DesItalics(part.substring(2)));
      }
      first = false;
    });

    layout.add(RichTextInLayout(styledText));


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: layout,
    );
  }

  RichTextInLayout( final styledText){
  return  RichText(
    textAlign: TextAlign.justify,
      text: TextSpan(
          text: '',
          children: styledText,
          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400)),
    );

  }

}
