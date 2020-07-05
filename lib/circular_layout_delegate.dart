import 'dart:math' as Math;

import 'package:flutter/widgets.dart';

const double _radiansPerDegree = Math.pi / 180;
final double _startAngle = -90.0 * _radiansPerDegree;

class CircularLayoutDelegate extends MultiChildLayoutDelegate {
  static const String actionButton = 'BUTTON';

  final int itemCount;
  final double radius;

  CircularLayoutDelegate({
    @required this.itemCount,
    @required this.radius,
  });

  Offset center;

  @override
  void performLayout(Size size) {
    center = new Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < itemCount; i++) {
      final String actionButtonId = '$actionButton$i';

      if (hasChild(actionButtonId)) {
        final Size buttonSize = layoutChild(actionButtonId, new BoxConstraints.loose(size));

        final double itemAngle = _calculateItemAngle(i);

        positionChild(
          actionButtonId,
          new Offset(
            (center.dx - buttonSize.width / 2) + (radius) * Math.cos(itemAngle),
            (center.dy - buttonSize.height / 2) + (radius) * Math.sin(itemAngle),
          ),
        );
      }
    }
  }

  @override
  bool shouldRelayout(CircularLayoutDelegate oldDelegate) => itemCount != oldDelegate.itemCount || radius != oldDelegate.radius;

  double _calculateItemAngle(int index) {
    double _itemSpacing = 360.0 / itemCount;
    return _startAngle + index * _itemSpacing * _radiansPerDegree;
  }
}
