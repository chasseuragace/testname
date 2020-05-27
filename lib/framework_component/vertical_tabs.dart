import 'dart:async';
import 'package:flutter/material.dart';

class VerticalTabs extends StatefulWidget {
  /// background Color for  the body
  final Color bodyBackgroundColor;

  /// which tab in the children should be default
  final int initialTab;

  /// textStyle for Unselected Labels
  final TextStyle unselectedLabelStyle;

  /// The color of the TabBar and the indicator, should not be used together with [gradient]
  final Color color;

  /// TextStyle that defines how the text in selected tab looks, attribute [color : ] can't be white when using [gradient]
  final TextStyle labelStyle;

  /// The gradient of the TabBar and the indicator, should not be used together with [color]
  final LinearGradient gradient;

  /// Tab headings, don't forget the to capatlize the first letter
  final List<String> tabNames;

  /// Contents corresponding to Tab headings,
  /// hint: begin with Listview inside a Padding widget
  final List<Widget> children;

  ///Creates a vertical tabBar with [tabNames] headings using corresponding [children] as TabBarView

  const VerticalTabs({Key key,
    this.gradient,
    @required this.tabNames,
    @required this.children,
    this.color,
    this.labelStyle =
    const TextStyle(color: Colors.black,
        fontWeight: FontWeight
            .bold), this.initialTab, this.unselectedLabelStyle = const TextStyle(
        color: Colors.black45,
        fontWeight: FontWeight.bold), this.bodyBackgroundColor})
      : assert(tabNames.length == children.length,
  "couldn't find label to content match, check if  each tabName has a view in [children] "),
        assert((color != null) != (gradient != null),
        "use either of the [color] or [gradient] properties, neither both nor none "),
        super(key: key);

  @override
  _VerticalTabsState createState() => _VerticalTabsState();
}

class _VerticalTabsState extends State<VerticalTabs> {
  PageController _pc;
  int currentIndex;
  final _controller = StreamController<int>.broadcast(); //.broadcast();
  Stream<int> get stream => _controller.stream;

  @override
  void initState() {
    super.initState();
    _pc = PageController(
      keepPage: true,
      initialPage: widget.initialTab ?? 0,
    );
    currentIndex = widget.initialTab ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    stream.listen((onData) {
      _pc.animateToPage(onData,
          curve: Curves.easeInCirc, duration: Duration(milliseconds: 200));
    });

    return Row(
      children: <Widget>[

        RotatedBox(quarterTurns: 3, child: stack()),
        Expanded(
          flex: 1,
          child: Transform.scale(
            scale: 0.905,
            child: Material(
              borderRadius: BorderRadius.circular(24),
              color: widget.bodyBackgroundColor?? widget.color?? widget.gradient.colors[0],
              elevation: 24,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.children.length,
                  controller: _pc,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    return widget.children[index];
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pc.dispose();
    _controller.close();
    super.dispose();
  }

  stack() {
    bool useGrad = widget.color == null;
    Widget stack = Stack(
      children: [
        Positioned(
          top: // 35/2  -3
          0,
          // width: 6,
          child: Material(
            shadowColor: Colors.black,
            elevation: 12,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .height,
              height: 32,
              color: widget.color ?? Colors.transparent,
            ),
          ),
        ),
        Container(
          height: 45,
          width: MediaQuery
              .of(context)
              .size
              .height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder(
                stream: stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (!snapshot.hasData) updateIndex(-1);
                  return snapshot.hasData
                      ? Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (int index = 0;
                            index < widget.tabNames.length;
                            index++)
                              GestureDetector(
                                  onTap: () {
                                    (MediaQuery
                                        .of(context)
                                        .size
                                        .height -
                                        widget.tabNames.length *
                                            100) /
                                        2;
                                    updateIndex(index);
                                  },
                                  child: Container(
                                    width: 100,
                                    color: Colors.white.withOpacity(0),
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          widget.tabNames[index],
                                          textAlign: TextAlign.center,
                                          style: index == snapshot.data
                                              ? widget.labelStyle
                                              : widget.unselectedLabelStyle,
                                        )),
                                  )),
                          ],
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.bounceOut,
                        bottom: 3,
                        width: 50,
                        duration: Duration(milliseconds: 300),
                        left: snapshot.data * 100.0 +
                            100 * widget.tabNames.length / 2 -
                            widget.tabNames.length * 100 / 2 +
                            25,
                        child: ClipPath(
                          clipper: _IndicatorClipper(),
                          child: Container(
                            width: 50,
                            height: 10,
                            color: useGrad ? Colors.white : widget.color,
                          ),
                        ),
                      ),
                    ],
                  )
                      : Container();
                }),
          ),
        )
      ],
    );

    return useGrad
        ? ShaderMask(
        shaderCallback: (Rect bounds) =>
            widget.gradient.createShader(bounds),
        child: stack)
        : stack;
  }

  updateIndex(int i) {
    if (i >= 0) currentIndex = i;
    _controller.sink.add(currentIndex);
  }

  closeSink() {}
}

class _IndicatorClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = size.width,
        y = size.height;
    path.lineTo(x, 0);
    path.quadraticBezierTo(x * .75, y * .2, x / 2, y);
    path.quadraticBezierTo(x * .25, y * .2, 0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
