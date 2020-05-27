import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset;
  double _page;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class MainPage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>PageOffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
           StackBackground(),
            PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
               // LeopardPage(),
                Container(),
                VulturePage()
              ],
            ),
           ],
        ),
      ),
    );
  }
}

class StackBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Size size= MediaQuery.of(context).size;
    return Consumer<PageOffsetNotifier>(
      builder: (context,notifier,child){
        return Positioned(
            left: -(notifier.offset??0)*.8,

          width: size.width *1.5,
          //top: MediaQuery.of(context).size.height/2-230/2,
          child: child,
        );},
      child: Image.network(
          'https://github.com/MarcinusX/sy_expedition_travel_challenge/blob/master/assets/leopard.png?raw=true',height: 250,),
    );

  }
}

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://github.com/MarcinusX/sy_expedition_travel_challenge/blob/master/assets/leopard.png?raw=true');

  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(

          'https://github.com/MarcinusX/sy_expedition_travel_'
              'challenge/blob/master/assets/vulture.png?raw=true',height: 200,),
    )
    ;
  }
}
