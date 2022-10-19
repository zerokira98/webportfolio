import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newwebsite/component/footer.dart';
// import 'package:newwebsite/custom_dependency/scrollbgst.dart';
import 'package:newwebsite/pages/first_page.dart';
import 'package:newwebsite/pages/project_page.dart';
import 'package:newwebsite/pages/second_page.dart';
import 'package:newwebsite/pages/third_page.dart';
// import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import 'component/appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const StaringtWidget());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    // When modifying this function, consider modifying the implementation in
    // the base class as well.
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        return child;
    }
  }

  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class StaringtWidget extends StatelessWidget {
  const StaringtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          highlightColor: Colors.lightBlue,
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.blueGrey[500]),
          )),
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'MyHome',
      home: const Home(),
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
  late PageController pageController;
  @override
  void initState() {
    scrollController = ScrollController();
    pageController = PageController();
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
        // Builder(builder: (context) {
        //   return
        PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            //page1
            FirstPage(pageController: pageController),
            //page2
            SecondPage(pageController: pageController),
            //page3(?)
            ProjectPage(pageController: pageController),
            //
            // const ThirdPage(),
            //Footer
            Footer(),
          ],
        ),

        // }
        // ),
        Positioned(top: 0, child: CustomAppBar(pageController: pageController)),
      ]),
    );
  }
}
