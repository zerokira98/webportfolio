import 'package:flutter/material.dart';
import 'package:newwebsite/custom_dependency/scrollbgst.dart';
import 'package:newwebsite/pages/first_page.dart';
import 'package:newwebsite/pages/second_page.dart';
import 'package:newwebsite/pages/third_page.dart';
// import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import 'component/appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const StaringtWidget());
}

class StaringtWidget extends StatelessWidget {
  const StaringtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black12,
      //   // title: const Text('Hello'),
      // ),
      body: Stack(children: [
        SmoothScrollWeb(
          controller: scrollController,
          child: Builder(builder: (context) {
            return SingleChildScrollView(
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //page1
                  FirstPage(scrollController: scrollController),
                  //page2
                  const SecondPage(),
                  //page3(?)
                  const ThirdPage()
                ],
              ),
            );
          }),
        ),
        const Positioned(top: 0, child: CustomAppBar()),
      ]),
    );
  }
}
