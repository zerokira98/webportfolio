// import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
// import 'dart:math' as math;

class FirstPage extends StatefulWidget {
  // final ScrollController scrollController;
  final PageController pageController;
  const FirstPage({
    Key? key,
    // required this.scrollController,
    required this.pageController,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  double alignmentY = -1;
  double opacityV = 0.0;
  double degree = -45.0;
  // RiveAnimationController a = SimpleAnimation('');
  // a
  late final AnimationController _acontroller = AnimationController(
    lowerBound: 0.0,
    upperBound: 1,
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final AnimationController _acontroller2 = AnimationController(
    lowerBound: 0.0,
    upperBound: 1,
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _acontroller,
    curve: Curves.bounceInOut,
  );
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _acontroller2,
    curve: Curves.bounceInOut,
  );
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        _acontroller2.repeat(reverse: true);
        setState(() {
          opacityV = 1.0;
          degree = 0.0;
        });
      });
      _acontroller2.addListener(() {
        setState(() {});
      });
      final isWebMobile = kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android);
      if (isWebMobile) {
        Future.delayed(
          Duration(seconds: 2),
          () {
            _acontroller.forward();
          },
        );
      }
    });
    super.initState();
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var awaw = MediaQuery.of(context).size.height;
    double avatarPadding =
        MediaQuery.of(context).orientation.index == 0 ? 4.0 : 8.0;
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: awaw,
            // height: (MediaQuery.of(context).orientation.index == 0 ? 400 : 640),
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(Colors.purple.shade700, BlendMode.color),
              child: Opacity(
                opacity: 1,
                child: rive.RiveAnimation.asset(
                  'res/rive/firstpage.riv',
                  // onInit: (artboard) {},
                  fit: BoxFit.cover,
                  alignment: Alignment(0, alignmentY),
                ),
              ),
            )),
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            // height: 440,
            child: AnimatedOpacity(
              opacity: opacityV,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 450),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex:
                          MediaQuery.of(context).orientation.index == 0 ? 0 : 1,
                      child: Container()),
                  Flexible(
                    flex: 10,
                    child: AnimatedContainer(
                      // padding: EdgeInsets.only(top: 200),
                      curve: Curves.bounceOut,
                      duration: const Duration(milliseconds: 950),
                      transform: Matrix4.identity()
                        ..rotateZ(degree)
                        ..translate(0.0, degree),
                      child: Container(
                        margin: MediaQuery.of(context).orientation.index == 0
                            ? const EdgeInsets.only(top: 148)
                            : const EdgeInsets.only(top: 0),
                        padding: EdgeInsets.only(
                            right: (avatarPadding +
                                (MediaQuery.of(context).orientation.index == 0
                                    ? 0
                                    : 106)),
                            top: MediaQuery.of(context).orientation.index == 0
                                ? 100
                                : avatarPadding,
                            left: avatarPadding,
                            bottom: avatarPadding),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(
                                    _animation2.value * 0.2 + 0.35),
                                width: 4),
                            // border: Border(

                            //   bottom: BorderSide(
                            //       color: Colors.purple.shade200, width: 4),
                            //   top: BorderSide(
                            //       color: Colors.purple.shade200, width: 4),
                            //   left: BorderSide(
                            //       color: Colors.purple.shade200, width: 4),
                            //   right: BorderSide(
                            //       color: Colors.purple.shade200, width: 4),
                            // ),
                            color: Colors.purple.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(avatarPadding +
                                (MediaQuery.of(context).orientation.index == 0
                                    ? 44
                                    : 126))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediaQuery.of(context).orientation.index == 1
                                ? Container(
                                    height: 126 * 2 + 4,
                                    width: 126 * 2 + 4,
                                    padding: const EdgeInsets.all(4.0),
                                    // alignment: Alignment(0, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(126),
                                      // MediaQuery.of(context)
                                      //             .orientation
                                      //             .index ==
                                      //         0
                                      //     ? 48
                                      //     : 126),
                                      color: Colors.purple.shade100,
                                    ),
                                    child: MouseRegion(
                                      onEnter: (event) {
                                        //
                                        _acontroller.forward();
                                      },
                                      onExit: (event) {
                                        //
                                        _acontroller.reverse();
                                      },
                                      child: RotationTransition(
                                        turns: _animation,
                                        child: CircleAvatar(
                                          minRadius: MediaQuery.of(context)
                                                      .orientation
                                                      .index ==
                                                  0
                                              ? 48
                                              : 126,
                                          backgroundImage:
                                              const AssetImage('res/pp.jpg'),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            // const Padding(padding: EdgeInsets.all(4.0)),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: MediaQuery.of(context)
                                              .orientation
                                              .index ==
                                          1
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Transform.translate(
                                            offset: const Offset(0, 0),
                                            // offset: MediaQuery.of(context)
                                            //             .orientation
                                            //             .index ==
                                            //         0
                                            //     ? const Offset(0, 0)
                                            //     : const Offset(-15, 0),
                                            child: AutoSizeText(
                                              'Hi! I\'m Muhammad Rizal Afifuddin',
                                              minFontSize: 16,
                                              maxLines: 2,
                                              textAlign: MediaQuery.of(context)
                                                          .orientation
                                                          .index ==
                                                      0
                                                  ? TextAlign.center
                                                  : TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                            .orientation
                                                            .index ==
                                                        0
                                                    ? 24
                                                    : 36,
                                                color: Colors.white,
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.black,
                                                      blurRadius: 4.0)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        'Ain\'t front end dev, i\'m nobody.',
                                        textScaleFactor: MediaQuery.of(context)
                                                    .orientation
                                                    .index ==
                                                0
                                            ? 1.15
                                            : 1.5,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: MediaQuery.of(context).orientation.index == 0 ? 0 : 1,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
        ),
        //pp
        MediaQuery.of(context).orientation.index == 0
            ? Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1050),
                    curve: Curves.fastOutSlowIn,
                    opacity: opacityV,
                    child: AnimatedContainer(
                      curve: Curves.bounceOut,
                      duration: const Duration(milliseconds: 950),
                      transform: Matrix4.identity()
                        ..rotateZ(degree)
                        ..translate(0.0, degree),
                      margin: const EdgeInsets.only(bottom: 100),
                      height: 126 * 2 + 4,
                      width: 126 * 2 + 4,
                      padding: const EdgeInsets.all(4.0),
                      // alignment: Alignment(0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(126),
                        // MediaQuery.of(context)
                        //             .orientation
                        //             .index ==
                        //         0
                        //     ? 48
                        //     : 126),
                        color: Colors.purple.shade200,
                      ),
                      child: MouseRegion(
                        onEnter: (event) {
                          //
                          _acontroller.forward();
                        },
                        onExit: (event) {
                          //
                          _acontroller.reverse();
                        },
                        child: RotationTransition(
                          turns: _animation,
                          child: CircleAvatar(
                            minRadius:
                                MediaQuery.of(context).orientation.index == 0
                                    ? 48
                                    : 126,
                            backgroundImage: const AssetImage('res/pp.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 24,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              // transform: GradientRotation(math.pi / 2))),
              child: InkWell(
                  onTap: () {
                    widget.pageController.animateToPage(1,
                        duration: const Duration(
                          milliseconds: 450,
                        ),
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    color: Colors.white,
                  )),
            ))
      ],
    );
  }
}
