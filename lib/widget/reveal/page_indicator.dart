import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'pages.dart';

/// 主要有四个因素：
/// 1.大小的变化
/// 2.选中图标的透明效果
/// 3.选中图标的左侧显示实心效果，右侧显示空心效果
/// 4.选中图标一直在中间
class PageIndicator extends StatelessWidget {
  PageIndicator({this.pageIndicatorViewModel});

  final PageIndicatorViewModel pageIndicatorViewModel;

  @override
  Widget build(BuildContext context) {
    List<PagerBubble> bubbles = [];
    for (int i = 0; i < pageIndicatorViewModel.pages.length; i++) {
      final page = pageIndicatorViewModel.pages[i];

      var percentActive;
      if (i == pageIndicatorViewModel.activeIndex) {
        percentActive = 1.0 - pageIndicatorViewModel.slidePercent;
      } else if (i == pageIndicatorViewModel.activeIndex - 1 &&
          pageIndicatorViewModel.slideDirection == SlideDirection.LeftToRight) {
        percentActive = pageIndicatorViewModel.slidePercent;
      } else if (i == pageIndicatorViewModel.activeIndex + 1 &&
          pageIndicatorViewModel.slideDirection == SlideDirection.RightToLeft) {
        percentActive = pageIndicatorViewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > pageIndicatorViewModel.activeIndex ||
          (i == pageIndicatorViewModel.activeIndex &&
              pageIndicatorViewModel.slideDirection == SlideDirection.LeftToRight);

      bubbles.add(PagerBubble(
          pagerBubbleViewModel:
              PagerBubbleViewModel(page.iconAssetIcon, page.color, isHollow, percentActive)));
    }

    final bubbleWidth = 45.0;
    final baseTransition =
        ((pageIndicatorViewModel.pages.length * bubbleWidth) / 2) - (bubbleWidth / 2);
    var transition = baseTransition - (pageIndicatorViewModel.activeIndex * bubbleWidth);
    if (pageIndicatorViewModel.slideDirection == SlideDirection.LeftToRight) {
      transition += pageIndicatorViewModel.slidePercent * bubbleWidth;
    } else if (pageIndicatorViewModel.slideDirection == SlideDirection.RightToLeft) {
      transition -= pageIndicatorViewModel.slidePercent * bubbleWidth;
    }

    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        // 保持指示器在屏幕中间
        Container(
          child: Transform(
            transform: Matrix4.translationValues(transition, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bubbles,
            ),
          ),
        ),
      ],
    );
  }
}

class PageIndicatorViewModel {
  List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndicatorViewModel(this.pages, this.activeIndex, this.slideDirection, this.slidePercent);
}

enum SlideDirection { LeftToRight, RightToLeft, none }

class PagerBubble extends StatelessWidget {
  PagerBubble({this.pagerBubbleViewModel});

  final PagerBubbleViewModel pagerBubbleViewModel;

  @override
  Widget build(BuildContext context) {
    double itemSize = 45.0;

    return Container(
      width: itemSize,
      height: itemSize,
      child: Center(
        child: Container(
          width: ui.lerpDouble(20.0, 25.0, pagerBubbleViewModel.activePercent),
          height: ui.lerpDouble(20.0, 25.0, pagerBubbleViewModel.activePercent),
          decoration: BoxDecoration(
              color: pagerBubbleViewModel.isHollow
                  ? Color(0x88FFFFFF).withAlpha((0x88 * pagerBubbleViewModel.activePercent).round())
                  : Color(0x88FFFFFF),
              border: Border.all(
                  color: pagerBubbleViewModel.isHollow
                      ? Color(0x88FFFFFF)
                          .withAlpha((0x88 * (1.0 - pagerBubbleViewModel.activePercent)).round())
                      : Colors.transparent,
                  width: 3.0),
              shape: BoxShape.circle),
          child: Opacity(
            opacity: pagerBubbleViewModel.activePercent,
            child: Image.asset(
              pagerBubbleViewModel.iconAssetsPath,
              color: pagerBubbleViewModel.color,
            ),
          ),
        ),
      ),
    );
  }
}

class PagerBubbleViewModel {
  final String iconAssetsPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel(this.iconAssetsPath, this.color, this.isHollow, this.activePercent);
}
