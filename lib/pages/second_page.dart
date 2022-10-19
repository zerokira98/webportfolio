import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:newwebsite/component/skill_card.dart';
import 'package:rive/rive.dart' as rive;

class SecondPage extends StatefulWidget {
  // final ScrollController scrollController;
  final PageController pageController;
  const SecondPage(
      {Key? key,
      // required this.scrollController,
      required this.pageController})
      : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> list = const [
    SkillCard(
      delay: Duration(milliseconds: 450),
      imageIcon: 'res/flutter.png',
      title: 'Dart-Flutter',
      percent: 0.72,
    ),
    SkillCard(
      delay: Duration(milliseconds: 450 * 2),
      imageIcon: 'res/php.png',
      title: 'Php',
      percent: 0.22,
    ),
    SkillCard(
      delay: Duration(milliseconds: 450 * 3),
      imageIcon: 'res/sql.png',
      title: 'Sql',
      percent: 0.32,
    ),
    SkillCard(
      delay: Duration(milliseconds: 450 * 4),
      imageIcon: 'res/html.png',
      title: 'HTML',
      percent: 0.37,
    ),
    SkillCard(
      delay: Duration(milliseconds: 450 * 5),
      imageIcon: 'res/css.png',
      title: 'CSS',
      percent: 0.3,
    ),
    SkillCard(
      delay: Duration(milliseconds: 450 * 6),
      imageIcon: 'res/jquery.png',
      title: 'JQuery',
      percent: 0.2,
    ),
  ];
  GlobalKey gkey = GlobalKey();
  double alignmentY = 1;
  double opacityContent = 0.0;
  double opacityTitle = 0.0;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // RenderBox rb = gkey.currentContext?.findRenderObject() as RenderBox;
      // Offset position = rb.localToGlobal(Offset.zero);
      // debugPrint(position.toString());
      // widget.scrollController.addListener(() {
      //   if (widget.scrollController.offset < 200 ||
      //       widget.scrollController.offset == 0) {
      //     Future.delayed(const Duration(milliseconds: 100), () {
      //       setState(() {
      //         opacityTitle = 0.0;
      //       });
      //       setState(() {
      //         opacityContent = 0.0;
      //       });
      //     });
      //   }
      //   if (widget.scrollController.offset > 200) {
      //     // print(widget.scrollController.offset);
      //     Future.delayed(const Duration(milliseconds: 100), () {
      //       setState(() {
      //         opacityContent = 1.0;
      //       });
      //     });
      //     setState(() {
      //       opacityTitle = 1.0;
      //       alignmentY = ((widget.scrollController.offset - 400) / 200) * -1;
      //     });
      //   }
      // });
      widget.pageController.addListener(() {
        if (widget.pageController.page == 1) {
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              opacityContent = 1.0;
            });
          });
          setState(() {
            opacityTitle = 1.0;
            // alignmentY = ((widget.scrollController.offset - 400) / 200) * -1;
          });
        }
      });
    });
    super.initState();
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: rive.RiveAnimation.asset(
              'res/rive/bg1.riv',
              fit: BoxFit.cover,
              alignment: Alignment(0, alignmentY),
            )),
        Container(
            key: gkey,
            // decoration: BoxDecoration(
            //   // color: Colors.red,
            //   image: DecorationImage(
            //       image: const AssetImage('res/bg2.png'),
            //       fit: BoxFit.cover,
            //       alignment: Alignment(0.0, alignmentY)),
            // ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: 64,
                bottom: 64),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? Padding(padding: EdgeInsets.all(8))
                    : Padding(padding: EdgeInsets.all(4)),
                Container(
                  padding: const EdgeInsets.all(18.0),
                  margin: const EdgeInsets.only(bottom: 32),
                  child: AnimatedOpacity(
                    opacity: opacityTitle,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 450),
                    child: Stack(
                      children: [
                        Text(
                          'Prowess',
                          style: TextStyle(
                            // shadows: [],
                            // background: Paint()
                            //   ..style = PaintingStyle.stroke
                            //   ..color = Colors.white,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 32,
                            // color: Colors.white
                          ),
                        ),
                        const Text(
                          'Prowess',
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? Padding(padding: EdgeInsets.all(12))
                    : SizedBox(),
                Expanded(
                  child: AnimatedOpacity(
                    opacity: opacityContent,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 450),
                    child: Scrollbar(
                      controller: _scrollController,
// notificationPredicate: (notification) {},
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 18, top: 14),
                        controller: _scrollController,
                        child: LayoutGrid(
                          columnSizes:
                              MediaQuery.of(context).orientation.index == 0
                                  ? MediaQuery.of(context).size.width >= 600
                                      ? [1.fr, 1.fr, 1.fr]
                                      : [1.fr, 1.fr]
                                  : MediaQuery.of(context).size.width >= 1080
                                      ? [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr]
                                      : [1.fr, 1.fr, 1.fr, 1.fr],
                          // set all the row sizes to auto (self-sizing height)
                          rowSizes: const [
                            auto,
                            auto,
                            auto,
                          ],
                          rowGap: 40, // equivalent to mainAxisSpacing
                          columnGap: 14, // equivalent to crossAxisSpacing
                          // note: there's no childAspectRatio
                          children: [
                            // render all the cards with *automatic child placement*
                            for (var i = 0; i < 6; i++) list[i],
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
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
                    widget.pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    color: Colors.white,
                  )),
            )),
        Positioned(
            top: 54,
            left: 0,
            right: 0,
            child: Container(
              height: 24,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              // transform: GradientRotation(math.pi / 2))),
              child: InkWell(
                  onTap: () {
                    widget.pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    color: Colors.white,
                  )),
            ))
      ],
    );
  }
}
