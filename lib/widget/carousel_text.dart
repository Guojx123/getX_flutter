import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselTextPage extends StatefulWidget {
  const CarouselTextPage({Key key}) : super(key: key);

  @override
  _CarouselTextPageState createState() => _CarouselTextPageState();
}

class _CarouselTextPageState extends State<CarouselTextPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CarouselText(
          '这是一个文字轮播组件。 这是一个文字轮播组件。 这是一个文字轮播组件。',
          cWidth: 120,
          cHeight: 60,
          fontSize: 16,
        ),
      ),
    );
  }
}

class CarouselText extends StatefulWidget {
  CarouselText(this.text,
      {this.cWidth = 56.0, this.cHeight = 16.0, this.fontSize = 8.5, this.rate = 5, Key key})
      : super(key: key);

  final String text;
  final double cWidth;
  final double cHeight;
  final double fontSize;
  final int rate;

  @override
  _CarouselTextState createState() => _CarouselTextState();
}

class _CarouselTextState extends State<CarouselText> with TickerProviderStateMixin {
  TextPainter textPainter;
  Animation<Offset> _positionAnimation;
  AnimationController _animationController;

  String get _text => widget.text;

  double get _cWidth => widget.cWidth;

  double get _cHeight => widget.cHeight;

  double get _fontSize => widget.fontSize;

  int get _rate => widget.rate;

  bool isScroll;

  @override
  void initState() {
    super.initState();
    _handleData();
    _addStatusListener();
  }

  void _handleData() {
    textPainter = calculateTextWidth(_text, TextStyle(fontSize: _fontSize));
    double tWidth = textPainter.width;
    isScroll = tWidth > _cWidth;
    double xPoint = (tWidth - (_cWidth / 2)) / tWidth;
    double yPoint = 1 - xPoint;
    int rate = _text.length ~/ _rate;
    _animationController = AnimationController(duration: Duration(seconds: rate), vsync: this)
      ..forward();
    _positionAnimation = Tween<Offset>(
      begin: Offset(yPoint, 0.0),
      end: Offset(-xPoint, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _animationController, curve: Interval(0.0, 1.0, curve: Curves.linear)),
    );
  }

  void _addStatusListener() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  static TextPainter calculateTextWidth(String value, TextStyle style) {
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: value.toLowerCase().replaceAll(' ', ''), style: style)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: _cWidth,
          height: _cHeight,
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
          decoration: BoxDecoration(
              color: Color(0xFFFF3E2F),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              )),
        ),
        Positioned(
          top: (_cHeight - textPainter.height) / 2,
          left: 0,
          child: SlideTransition(
            textDirection: TextDirection.ltr,
            transformHitTests: true,
            position: isScroll
                ? _positionAnimation
                : Tween<Offset>(
                    begin: Offset(0.1, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(
                    CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(1.0, 1.0, curve: Curves.linear)),
                  ),
            child: Text(
              '$_text',
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: _fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
