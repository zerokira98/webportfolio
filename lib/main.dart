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

class StaringtWidget extends StatelessWidget {
  const StaringtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portfolio',
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
        // Builder(builder: (context) {
        //   return
        SingleChildScrollView(
          controller: scrollController,
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //page1
              FirstPage(scrollController: scrollController),
              //page2
              SecondPage(scrollController: scrollController),
              //page3(?)
              ProjectPage(
                judul: 'Telo goreng',
                deskripsi:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas finibus eu erat quis efficitur. Mauris ac posuere neque. Etiam non ornare ipsum, non tincidunt tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas eu est ultrices, egestas ligula non, efficitur sem. Nam sed suscipit metus, eu tempor risus. Nam sed lobortis libero. Mauris et aliquet lacus, a tincidunt tellus. Donec imperdiet elit ut ligula accumsan, quis tincidunt tellus cursus. Nulla rutrum facilisis sollicitudin. Etiam iaculis cursus turpis, quis blandit ex commodo eu.',
              ),
              //
              const ThirdPage(),
              //Footer
              const Footer(),
            ],
          ),
        ),
        // }
        // ),
        Positioned(top: 0, child: CustomAppBar(scrollc: scrollController)),
      ]),
    );
  }
}
