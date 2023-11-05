import 'package:newwebsite/pages/first_page.dart';

import './collision_game.dart';

import 'package:flame/game.dart';

import 'package:flutter/material.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Flame.device.fullScreen();

//   Flame.device.setLandscape();
//   runApp(MaterialApp(home: Scaffold(body: Home())));
// }

class HomeGame extends StatefulWidget {
  final PageController pageController;
  const HomeGame(this.pageController);

  @override
  State<HomeGame> createState() => _HomeState();
}

class _HomeState extends State<HomeGame> {
  late CollisionApp game;
  bool initial = true;
  void initFalse() {
    setState(() {
      initial = false;
    });
  }

  @override
  void initState() {
    game = CollisionApp(initFalse);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 2),
      child: initial
          ? GameWidget(
              game: game,
            )
          : FirstPage(pageController: widget.pageController),
    );
    // return initial
    //     ? GameWidget(
    //         game: game,
    //       )
    //     : Scaffold(
    //         appBar: AppBar(title: Text('Home')),
    //       );
  }
}
