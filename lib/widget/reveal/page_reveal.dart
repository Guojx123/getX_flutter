import 'package:flutter/material.dart';
import 'dart:math';

class PageClipper extends StatelessWidget {
  PageClipper({this.revealPercent, this.child});

  final double revealPercent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// 将展示的页面进行圆弧裁切
    return ClipOval(
      clipper: CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

/// 自定义的裁切方式
class CircleRevealClipper extends CustomClipper<Rect> {
  CircleRevealClipper(this.revealPercent);

  final double revealPercent;

  @override
  Rect getClip(Size size) {
    /// a.定位到屏幕底部中间
    final epicenter = Offset(size.width / 2, size.height * 1.1);

    /// b.使用两个三角函数确定需要剪切弧度的半径
    double theta = atan(epicenter.dy / epicenter.dx);

    /// c.计算当前位置到屏幕左上角的距离
    final distanceToCorner = epicenter.dy / sin(theta);

    /// d.根据百分比渐长的半径
    final radius = distanceToCorner * revealPercent * 2;
    final diameter = 2 * radius;
    return Rect.fromLTWH(epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
