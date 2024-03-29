// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newwebsite/global_var.dart' as global;

class CustomAppBar extends StatefulWidget {
  final PageController pageController;
  const CustomAppBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late List appBarText = [
    // {
    //   'nama': 'Atas',
    //   'method': () {
    //     widget.scrollc.animateTo(0,
    //         duration: const Duration(milliseconds: 450),
    //         curve: Curves.easeInOut);
    //   }
    // },
    // {
    //   'nama': 'Bawah',
    //   'method': () {
    //     widget.scrollc.animateTo(widget.scrollc.position.maxScrollExtent,
    //         duration: const Duration(milliseconds: 450),
    //         curve: Curves.easeInOut);
    //   }
    // }
  ];
  final TextStyle ts = const TextStyle(
      color: Colors.white,
      shadows: [Shadow(blurRadius: 8, color: Colors.black)]);

  final double scaleTxt = 1.2;
  Color col = Colors.transparent;
  teloListener() {
    var a = (widget.pageController.page!);
    // print(a.toString());
    if (a >= 0 && a < 1 && col != Colors.purple) {
      setState(() {
        col = Colors.purple;
      });
    }
    if (a >= 1 && a < 2 && col != Colors.red.shade900) {
      setState(() {
        col = Colors.blue.shade900;
      });
    }
    if (a >= 2 && a < 3 && col != Colors.green.shade900) {
      setState(() {
        col = Colors.green.shade900;
      });
    }
    // else {
    //   setState(() {
    //     col = Colors.purple;
    //   });
    // }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          col = Colors.purple;
        });
      });
      widget.pageController.addListener(teloListener);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: col,
      height: global.appbarHeight,
      width: MediaQuery.of(context).size.width,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        width: MediaQuery.of(context).size.width,
        // height: 52,
        color: col,
        // alignment: ,
        // decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //     colors: [Colors.black, Colors.black],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter),
        // ),
        child: Row(
          children: [
            const Icon(
              Icons.person_outline_sharp,
              color: Colors.white,
            ),
            Flexible(flex: 2, child: Container()),
            Flexible(
              flex: MediaQuery.of(context).orientation.index == 0 ? 2 : 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < appBarText.length; i++)
                    InkWell(
                      onTap: appBarText[i]['method'],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          appBarText[i]['nama'],
                          style: ts,
                          textScaleFactor: scaleTxt,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
