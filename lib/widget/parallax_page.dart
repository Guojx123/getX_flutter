import 'package:flutter/material.dart';

class ParallaxPage extends StatefulWidget {
  const ParallaxPage({Key key}) : super(key: key);

  @override
  _ParallaxPageState createState() => _ParallaxPageState();
}

class _ParallaxPageState extends State<ParallaxPage> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  // 插值，值越大视觉差距越不明显
  double interpolationValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => NotificationListener(
          onNotification: (ScrollNotification note) {
            setState(() {
              _currentPage = _pageController.page;
            });
            return true;
          },
          child: PageView.custom(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => SimplePage(
                '$index',
                parallaxOffset: constraints.maxWidth / interpolationValue * (index - _currentPage),
              ),
              childCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  SimplePage(this.data, {Key key, this.parallaxOffset = 0.0}) : super(key: key);

  final String data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) => Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                data,
                style: const TextStyle(fontSize: 60.0),
              ),
              SizedBox(height: 40.0),
              Transform(
                transform: Matrix4.translationValues(parallaxOffset, 0.0, 0.0),
                child: const Text('Yet another line of text'),
              ),
            ],
          ),
        ),
      );
}
