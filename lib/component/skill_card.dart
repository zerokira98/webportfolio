import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    Key? key,
    required this.imageIcon,
    required this.title,
    required this.percent,
  }) : super(key: key);
  final String title;
  final String imageIcon;

  ///set the value to 0.0 - 1.0
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.white54),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Image.asset(imageIcon, fit: BoxFit.cover),
          const Text('Skill level'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: percent,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '50%',
                    textScaleFactor: 0.8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
