import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'page_indicator.dart';

class PageDrag extends StatefulWidget {
  PageDrag({this.streamController, this.canDragToRight, this.canDragToLeft});

  final StreamController<SlideUpdate> streamController;
  final bool canDragToRight;
  final bool canDragToLeft;

  @override
  State<StatefulWidget> createState() => _PageDragState();
}

class _PageDragState extends State<PageDrag> {
  static const FULL_TRANSITION_PX = 300.0;

  Offset dragStart;
  SlideDirection slideDirection;
  double slidePercent = 0.0;

  onHorizontalDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  onHorizontalDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final dx = dragStart.dx - newPosition.dx;
      if (dx < 0.0 && widget.canDragToRight) {
        slideDirection = SlideDirection.LeftToRight;
      } else if (dx > 0.0 && widget.canDragToLeft) {
        slideDirection = SlideDirection.RightToLeft;
      } else {
        slideDirection = SlideDirection.none;
      }

      if (slideDirection != SlideDirection.none) {
        slidePercent = (dx / FULL_TRANSITION_PX).abs().clamp(0.0, 1.0);
      } else {
        slidePercent = 0.0;
      }

      widget.streamController.add(SlideUpdate(UpdateType.dragging, slideDirection, slidePercent));
    }
  }

  onHorizontalDragEnd(DragEndDetails details) {
    widget.streamController.add(SlideUpdate(UpdateType.doneDragging, SlideDirection.none, 0.0));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
    );
  }
}

class AnimatedPageDrag {
  static const PERCENT_PER_MILLISECOND = 0.005;
  final slideDirection;
  final transitionGoal;

  AnimationController completeAnimationController;

  AnimatedPageDrag(
      {this.slideDirection,
      this.transitionGoal,
      slidePercent,
      StreamController<SlideUpdate> slideUpdateStream,
      TickerProvider vSync}) {
    var startSlidePercent = slidePercent;
    var endSlidePercent;
    var duration;
    if (transitionGoal == TransitionGoal.open) {
      endSlidePercent = 1.0;
      final slideRemaining = 1.0 - slidePercent;
      duration = Duration(milliseconds: (slideRemaining / PERCENT_PER_MILLISECOND).round());
    } else {
      endSlidePercent = 0.0;
      duration = Duration(milliseconds: (slidePercent / PERCENT_PER_MILLISECOND).round());
    }

    completeAnimationController = AnimationController(vsync: vSync, duration: duration)
      ..addListener(() {
        slidePercent =
            lerpDouble(startSlidePercent, endSlidePercent, completeAnimationController.value);

        slideUpdateStream.add(SlideUpdate(UpdateType.doneAnimation, slideDirection, slidePercent));
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          SlideUpdate(UpdateType.doneDragging, slideDirection, endSlidePercent);
        }
      });
  }

  run() {
    completeAnimationController.forward(from: 0.0);
  }

  dispose() {
    if (completeAnimationController != null) completeAnimationController.dispose();
  }
}

enum TransitionGoal { open, close }

enum UpdateType { dragging, doneDragging, animation, doneAnimation }

class SlideUpdate {
  final UpdateType updateType;
  final slideDirection;
  final slidePercent;

  SlideUpdate(this.updateType, this.slideDirection, this.slidePercent);
}
