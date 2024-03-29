import 'dart:async';
import 'package:flutter/material.dart';
import 'pages.dart';
import 'page_reveal.dart';
import 'page_indicator.dart';
import 'page_dragger.dart';

class RevealPage extends StatefulWidget {
  const RevealPage({Key key}) : super(key: key);

  @override
  _RevealPageState createState() => _RevealPageState();
}

class _RevealPageState extends State<RevealPage> with TickerProviderStateMixin {
  StreamController<SlideUpdate> streamController;
  AnimatedPageDrag animatedPageDragger;

  int activeIndex = 0;
  int nextIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  _RevealPageState() {
    streamController = StreamController();
    streamController.stream.listen((SlideUpdate event) {
      if (event.updateType == UpdateType.dragging || event.updateType == UpdateType.animation) {
        slideDirection = event.slideDirection;
        slidePercent = event.slidePercent;
        if (slideDirection == SlideDirection.LeftToRight) {
          nextIndex = activeIndex - 1;
        } else if (slideDirection == SlideDirection.RightToLeft) {
          nextIndex = activeIndex + 1;
        } else {
          nextIndex = activeIndex;
        }
      } else if (event.updateType == UpdateType.doneDragging) {
        var transitionGoal;
        if (slidePercent > 0.5) {
          transitionGoal = TransitionGoal.open;
        } else {
          transitionGoal = TransitionGoal.close;
        }
        animatedPageDragger = AnimatedPageDrag(
            slideDirection: slideDirection,
            transitionGoal: transitionGoal,
            slidePercent: slidePercent,
            slideUpdateStream: streamController,
            vSync: this);
        animatedPageDragger.run();
      } else if (event.updateType == UpdateType.doneAnimation) {
        activeIndex = nextIndex;
        slidePercent = 0.0;
        slideDirection = SlideDirection.none;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animatedPageDragger.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /// 页面主体
          PageControl(
            pageViewModel: pages[activeIndex],
            percentVisible: 0.8,
          ),

          /// 滑动时，覆盖且展示的内容
          PageClipper(
              revealPercent: slidePercent,
              child: PageControl(
                pageViewModel: pages[nextIndex],
                percentVisible: slidePercent,
              )),

          /// 页面底部的指示器
          PageIndicator(
              pageIndicatorViewModel:
                  PageIndicatorViewModel(pages, activeIndex, slideDirection, slidePercent)),

          /// 页面拖动的手势监听
          PageDrag(
            canDragToLeft: activeIndex < pages.length - 1,
            canDragToRight: activeIndex > 0,
            streamController: streamController,
          )
        ],
      ),
    );
  }
}
