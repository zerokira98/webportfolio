// import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextStyle ts = const TextStyle(color: Colors.white);
  final double scaleTxt = 1.2;
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 42,
      // alignment: ,
      decoration: const BoxDecoration(
          // color: Colors.black45,
          // gradient: LinearGradient(
          //     colors: [Colors.black, Colors.black],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter),
          ),
      child: Row(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: MediaQuery.of(context).orientation.index == 0 ? 2 : 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black45)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'Home',
                        style: ts,
                        textScaleFactor: scaleTxt,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black45)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Work',
                        style: ts,
                        textScaleFactor: scaleTxt,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black45)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'About',
                        style: ts,
                        textScaleFactor: scaleTxt,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black45)
                      ],
                      color: Colors.blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contact',
                        style: ts,
                        textScaleFactor: scaleTxt,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
