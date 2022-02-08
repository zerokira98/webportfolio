// library smooth_scroll_web;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const int defaultAnimationLengthMs = 250;
// const int defaultAnimationLengthMs = 250;
const int defaultScrollSpeed = 130;

class SmoothScrollWeb extends StatefulWidget {
  ///Same ScrollController as the child widget's.
  final ScrollController controller;

  ///Child scrollable widget.
  final Widget child;

  ///Scroll speed px/scroll.
  final int scrollSpeed;

  ///Scroll animation length in milliseconds.
  final int scrollAnimationLength;

  ///Curve of the animation.
  final Curve curve;

  const SmoothScrollWeb({
    Key? key,
    required this.controller,
    required this.child,
    this.scrollSpeed = defaultScrollSpeed,
    this.scrollAnimationLength = defaultAnimationLengthMs,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  State<SmoothScrollWeb> createState() => _SmoothScrollWebState();
}

class _SmoothScrollWebState extends State<SmoothScrollWeb> {
  double _scroll = 0;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      if (widget.controller.position.activity is IdleScrollActivity) {
        _scroll = widget.controller.position.extentBefore;
      }
    });

    return Listener(
      onPointerSignal: (pointerSignal) {
        int millis = widget.scrollAnimationLength;
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            _scroll += widget.scrollSpeed;
          } else {
            _scroll -= widget.scrollSpeed;
          }
          if (_scroll > widget.controller.position.maxScrollExtent) {
            _scroll = widget.controller.position.maxScrollExtent;
            millis = widget.scrollAnimationLength ~/ 2;
          }
          if (_scroll < 0) {
            _scroll = 0;
            millis = widget.scrollAnimationLength ~/ 2;
          }

          widget.controller.animateTo(
            _scroll,
            duration: Duration(milliseconds: millis),
            curve: widget.curve,
          );
        }
      },
      child: widget.child,
    );
  }
}
