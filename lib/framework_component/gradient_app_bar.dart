
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  /// The attribute that created the need to this widget
  final LinearGradient gradient;
  /// Items displayed on the right
  final List<Widget> actions;
  /// Title of the appbar
  final Text title;
  /// Makes the title appear on center
  final bool centerTitle;
  /// Use this to specify leading icon / widget , hint : to pop context , to show dashboard etc
  final Widget prefix;
  /// Specify elevation of the appBar
  final double elevation;
  /// will place an appBar with supplied gradient
  const GradientAppBar({Key key, @required this.gradient, this.actions, this.title, this.centerTitle=false, this.prefix, this.elevation=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar bar=AppBar();
    // TODO: implement build
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: elevation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                height: bar.preferredSize.height,
                decoration: BoxDecoration(gradient: gradient,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if(prefix!=null) prefix,
                    (centerTitle)? Spacer():SizedBox(width: 6,),
                  if(title!=null) title,
                    Spacer(),
                    if(actions!=null) for(int index=0;index<actions.length;index++) actions[index]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
