import 'package:flutter/material.dart';
import 'package:newwebsite/component/skill_card.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        // height: 400,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18.0),
              margin: const EdgeInsets.only(bottom: 32),
              child: const Text(
                'Prowess',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SkillCard(
                        imageIcon: 'res/flutter.png',
                        title: 'Dart-Flutter',
                        percent: 0.8,
                      ),
                      SkillCard(
                        imageIcon: 'res/php.png',
                        title: 'Php',
                        percent: 0.25,
                      ),
                      SkillCard(
                        imageIcon: 'res/sql.png',
                        title: 'Sql',
                        percent: 0.32,
                      ),
                    ],
                  ),
                ),
                MediaQuery.of(context).orientation.index != 0
                    ? Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SkillCard(
                              imageIcon: 'res/html.png',
                              title: 'HTML',
                              percent: 0.38,
                            ),
                            SkillCard(
                              imageIcon: 'res/css.png',
                              title: 'CSS',
                              percent: 0.35,
                            ),
                            SkillCard(
                              imageIcon: 'res/jquery.png',
                              title: 'JQuery',
                              percent: 0.2,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink()
                // Text('Dart-Flutter'),
                // Text('Php'),
                // Text('Sql'),
                // Text('HTML'),
                // Text('CSS'),
                // Text('Jquery'),
              ],
            ),
            MediaQuery.of(context).orientation.index == 0
                ? Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SkillCard(
                          imageIcon: 'res/html.png',
                          title: 'HTML',
                          percent: 0.38,
                        ),
                        SkillCard(
                          imageIcon: 'res/css.png',
                          title: 'CSS',
                          percent: 0.35,
                        ),
                        SkillCard(
                          imageIcon: 'res/jquery.png',
                          title: 'JQuery',
                          percent: 0.2,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ));
  }
}
