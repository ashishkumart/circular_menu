import 'dart:math' as Math;

import 'package:circularmenu/circular_layout_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularLayout extends StatefulWidget {
  CircularLayout(this.menuItems);

  final List<Widget> menuItems;

  @override
  State<StatefulWidget> createState() => _CircularLayoutState();
}

class _CircularLayoutState extends State<CircularLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildCircularWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcons(int index) {
    final Widget item = widget.menuItems[index];

    return new LayoutId(
      id: 'BUTTON$index',
      child: item,
    );
  }

  Widget _buildCircularWidget() {
    final List<Widget> beverages = <Widget>[];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double outerRadius = Math.min(width * 3 / 4.5, height * 3 / 4.5);
    double innerWhiteRadius = outerRadius * 3 / 4.5;

    for (int i = 0; i < widget.menuItems.length; i++) {
      beverages.add(_buildIcons(i));
    }

    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new CustomMultiChildLayout(
              delegate: CircularLayoutDelegate(
                itemCount: widget.menuItems.length,
                radius: outerRadius / 2,
              ),
              children: beverages,
            ),
            GestureDetector(
              onTap: () {
                //Navigator.of(context).pushNamed("/ask/capture");
              },
              child: Container(
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.blue,
                ),
                height: innerWhiteRadius,
                width: innerWhiteRadius,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
