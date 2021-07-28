import 'dart:math';

import 'package:flutter/material.dart';

/// create by 张风捷特烈 on 2020-03-06
/// contact me by email 1981462002@qq.com
/// 说明: 打个洞
/// offset 洞的偏移量分率 x,y 在 0~1 之间
/// size 洞的大小

class HoleShapeBorder extends ShapeBorder {
  final Offset offset;
  final double size;
  final bool isRadius;

  HoleShapeBorder({this.isRadius = true, this.offset = const Offset(0.1, 0.1), this.size = 20});

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();
    if(!isRadius)
    path.addRect(rect);
    else
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(40)));
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();
    if(!isRadius)
      path.addRect(rect);
    else
      ///绘制圆角
      path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)));

    var w = rect.width;
    var h = rect.height;
    // var offsetXY = Offset(offset.dx * w, offset.dy * h);
    var d = size;
    _getHold(path, rect);
    _getOval(path, w, h, d/2);
    _getRightHold(path, w, h, d/2);
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  _getOval(Path path,double w,double h,double d){
    var left = - d;
    var top = h - d;
    var right = d;
    var bottom = h + d;
    path.addOval(Rect.fromLTRB(left, top, right, bottom)/*, -pi/2, pi*/);
  }

  _getHold(Path path, Rect rect) {
    var left = rect.width - 10;
    var top = rect.height - 10;
    var right = rect.width + 10;
    var bottom = rect.height + 10;
    path.addArc(Rect.fromLTRB(left, top, right, bottom), pi / 2, pi);
    // path.addOval(Rect.fromLTRB(left, top, right, bottom)/*, -pi/2, pi*/);
  }

  _getRightHold(Path path,double w,double h,double d) {
    var left = w - d;
    var top = h /2 - d;
    var right = w + d;
    var bottom = h/2 + d;
    path.addOval(Rect.fromLTRB(left, top, right, bottom));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }
}
