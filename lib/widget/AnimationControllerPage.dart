import 'package:flutter/material.dart';

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({Key key}) : super(key: key);

  @override
  _AnimationControllerPageState createState() => _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), lowerBound: 100, upperBound: 200);
    addListener();
  }

  addListener() {
    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
        debugPrint('Gino' + status.toString());
      })
      ..addListener(() {
        if (mounted)
          setState(() {
            _size = _animationController.value;
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _animationController.forward();
            });
          },
          child: Container(
            height: _size,
            width: _size * 2,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: Color.fromRGBO(123, 104, 238, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(123, 104, 238, 1),
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ]),
            alignment: Alignment.center,
            child: Text(
              '点击',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        _buildOpacityWidget(),
      ],
    );
  }

  var _opacity = 1.0;

  _buildOpacityWidget() {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _opacity = 0;
          });
        },
        child: Container(
          height: 40,
          width: 80,
          color: Colors.teal,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
