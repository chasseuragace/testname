
import 'package:flutter/material.dart';

class HeartWidget extends StatelessWidget {
  final double height;
  final Color color;
  final LinearGradient gradient;
  final double elevation;
  final Color shadowColor;

  const HeartWidget({Key key, @required this.height, this.color, this.gradient, this.elevation, this.shadowColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Material(
      shape: HeartShape(height,height),
      color: (color!=null)?color:Colors.transparent,
      elevation: elevation??0,
      shadowColor: shadowColor??Colors.black,
      child: ClipPath(
        clipper:HeartPath(),
        child: Container(
          height: height,width: height,

          decoration:color!=null? BoxDecoration(
              color: color

          ):BoxDecoration(
              gradient: gradient
          ),
        ),
      ),

    );
  }
}
class HeartShape extends ShapeBorder{
  final double width;
  final double height;

  HeartShape(this.width, this.height);
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath


    return generatePath();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }

  generatePath(){
    Path path=Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);
    return path;
  }

}
class HeartPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    return HeartShape(size.width,size.height).generatePath();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
