import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final ScrollController scrollController;
  const FirstPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double alignmentY = -1.0;
  // late AnimationController ac;
  // late Animation<double> ani;
  // onScroll() {
  //   if (widget.scrollController.hasClients) {
  //     print(widget.scrollController.hasListeners);
  //   }
  // }

  @override
  void initState() {
    // ac = AnimationController(
    //     vsync: this,
    //     duration: const Duration(milliseconds: 450),
    //     lowerBound: 0.0,
    //     upperBound: 1,
    //     animationBehavior: AnimationBehavior.preserve);
    // ani = Tween<double>(begin: -1, end: 1).animate(ac)
    //   ..addListener(() {
    //     print(ani.value);
    //     setState(() {});
    //   });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget.scrollController.addListener(() {
        // ac.addListener(() {
        //   setState(() {});
        // });
        if (widget.scrollController.offset < 400) {
          setState(() {
            // ac.animateTo(
            //   (widget.scrollController.offset / 400),
            // );
            // ani.value;
            alignmentY = (widget.scrollController.offset / 800) - 1;
          });
        }
        // print(widget.scrollController.offset);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // curve: Curves.easeInOut,
      // duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        image: DecorationImage(
          image: const AssetImage('res/bg1.png'),
          fit: BoxFit.cover,
          alignment: Alignment(0, alignmentY),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      height: 440,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius:
                      MediaQuery.of(context).orientation.index == 0 ? 44 : 72,
                  backgroundImage: const AssetImage('res/pp.jpg'),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muhammad Rizal Afifuddin',
                        textScaleFactor:
                            MediaQuery.of(context).orientation.index == 0
                                ? 2.0
                                : 2.5,
                      ),
                      Text(
                        'Deskripsi tentang diri',
                        textScaleFactor:
                            MediaQuery.of(context).orientation.index == 0
                                ? 1.0
                                : 1.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(),
          )
        ],
      ),
    );
  }
}
