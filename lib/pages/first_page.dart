import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FirstPage extends StatefulWidget {
  final ScrollController scrollController;
  const FirstPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  double alignmentY = 0;
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
  late final Animation<double> _animation = CurvedAnimation(
    parent: _acontroller,
    curve: Curves.bounceInOut,
  );
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          opacityV = 1.0;
          degree = 0.0;
        });
      });
      widget.scrollController.addListener(() {
        if (widget.scrollController.offset < 800) {
          setState(() {
            alignmentY = (widget.scrollController.offset / 800);
          });
        }
        // print(widget.scrollController.offset);
      });
    });
    super.initState();
  }

  void wtf(Artboard a) {}
  @override
  Widget build(BuildContext context) {
    double avatarPadding =
        MediaQuery.of(context).orientation.index == 0 ? 4.0 : 8.0;
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).orientation.index == 0 ? 400 : 640),
            child: Opacity(
              opacity: 1,
              child: RiveAnimation.asset(
                'res/rive/firstpage.riv',
                onInit: (artboard) {},
                fit: BoxFit.cover,
                alignment: Alignment(0, alignmentY),
              ),
            )),
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            height: 440,
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
                      curve: Curves.bounceOut,
                      duration: const Duration(milliseconds: 1050),
                      transform: Matrix4.identity()
                        ..rotateZ(degree)
                        ..translate(0.0, degree),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 92,
                            top: avatarPadding,
                            left: avatarPadding,
                            bottom: avatarPadding),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
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
                            Container(
                              height:
                                  (MediaQuery.of(context).orientation.index == 0
                                              ? 48
                                              : 126) *
                                          2 +
                                      4,
                              width:
                                  (MediaQuery.of(context).orientation.index == 0
                                              ? 48
                                              : 126) *
                                          2 +
                                      4,
                              padding: const EdgeInsets.all(2.0),
                              // alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).orientation.index ==
                                            0
                                        ? 48
                                        : 126),
                                color: Colors.purple,
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
                            ),
                            const Padding(padding: EdgeInsets.all(4.0)),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Transform.translate(
                                    offset: MediaQuery.of(context)
                                                .orientation
                                                .index ==
                                            0
                                        ? Offset(0, 0)
                                        : Offset(-20, 0),
                                    child: const AutoSizeText(
                                      'Muhammad Rizal Afifuddin',
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 18,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 4.0)
                                        ],
                                        // backgroundColor: Colors.white,
                                      ),
                                      // textScaleFactor: MediaQuery.of(context)
                                      //             .orientation
                                      //             .index ==
                                      //         0
                                      //     ? 2.0
                                      //     : 2.5,
                                    ),
                                  ),
                                  Text(
                                    '[Deskripsi tentang diri]',
                                    textScaleFactor: MediaQuery.of(context)
                                                .orientation
                                                .index ==
                                            0
                                        ? 1.0
                                        : 1.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: MediaQuery.of(context).orientation.index == 0 ? 0 : 4,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
