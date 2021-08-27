import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;

class CanvasImagePage extends StatefulWidget {
  const CanvasImagePage({Key key}) : super(key: key);

  @override
  _CanvasImagePageState createState() => _CanvasImagePageState();
}

class _CanvasImagePageState extends State<CanvasImagePage> {

  ui.Image _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async{
    _image = await loadImageFromAssets('assets/img_1.png');

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
    );
  }

  //读取 assets 中的图片
  Future<ui.Image> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return decodeImageFromList(bytes);
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint; // 画笔
    final double _strokeWidth = 0.5; // 线宽
    final Color _color = Colors.grey; // 线颜色
    _paint = Paint()
      ..strokeWidth = _strokeWidth
      ..color = _color;
    // 画布起点移动到屏幕中心
    canvas.translate(size.width / 2, size.height / 2);
  }

  _drawImage(Canvas canvas) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
