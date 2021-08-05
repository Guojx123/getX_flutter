import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({Key key}) : super(key: key);

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Paper();
  }
}

class Paper extends StatelessWidget {
  const Paper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: GridPaperPainter(),
      ),
    );
  }
}

class GridPaperPainter extends CustomPainter {
  Paint _gridPaint; //画笔
  final double step = 20; // 小格边长
  final double strokeWidth = 0.5; // 线宽
  final Color color = Colors.black; // 线颜色

  final List<Offset> points = [
    Offset(120, -20),
    Offset(80, -80),
    Offset(-40, -40),
    Offset(0, -100),
    Offset(40, -120),
    Offset(80, -160),
    Offset(120, -100),
  ];

  GridPaperPainter() {
    _gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.teal;

    // 画布起点移动到屏幕中心
    canvas.translate(size.width / 2, size.height / 2);

    _drawGrid(canvas, size);
    _drawAxis(canvas, size, paint);

    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.drawLine(
        Offset(10, 10),
        Offset(60, 60),
        paint
          ..color = Colors.orange
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);

    _drawDot(canvas, paint);
    _drawPoint(canvas, paint);
    _drawRawPoint(canvas, paint);
  }

  /// 绘制网格
  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size); //先绘制右下角的网格

    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1); //沿原点镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  /// 绘制坐标轴
  void _drawAxis(Canvas canvas, Size size, Paint paint) {
    paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
    canvas.drawLine(Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(0 - 7.0, size.height / 2 - 10), paint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(0 + 7.0, size.height / 2 - 10), paint);
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), paint);
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), paint);
  }

  /// 绘制右下方的网格
  void _drawBottomRight(Canvas canvas, Size size) {
    /// a.保存画布原点
    canvas.save();

    /// b.由上往下画横线，相对于画布往上移动step
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPaint);
      canvas.translate(0, step);
    }

    /// c.恢复画布原点
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPaint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  /// 绘制钟表刻度
  void _drawDot(Canvas canvas, Paint paint) {
    final int count = 12;
    paint
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;
    canvas.save();
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      canvas.drawLine(Offset(90, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void _drawPoint(Canvas canvas, Paint paint) {
    paint
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    /// switch: 绘制点
    // canvas.drawPoints(PointMode.points, points, paint);
    /// switch: 绘制线段，最末尾的单个点会舍弃
    canvas.drawPoints(PointMode.lines, points, paint);

    /// switch: 绘制多边形，所有的点依次连接
    // canvas.drawPoints(PointMode.polygon, points, paint);
  }

  /// 绘点集: drawRawPoints
  void _drawRawPoint(Canvas canvas, Paint paint) {
    Float32List pos = Float32List.fromList(
        [-120, -20, -80, -80, -40, -40, 0, -100, 40, -140, 80, -160, 120, -100]);
    paint
      ..color = Colors.blueGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    canvas.drawRawPoints(PointMode.points, pos, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
