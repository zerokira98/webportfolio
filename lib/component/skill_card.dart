import 'package:flutter/material.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    Key? key,
    required this.imageIcon,
    required this.title,
    required this.percent,
    required this.delay,
  }) : super(key: key);
  final String title;
  final Duration delay;
  final String imageIcon;

  ///set the value to 0.0 - 1.0
  final double percent;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  double opacity = 0.0;
  Color shadowColor = Colors.white54;
  double y = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(widget.delay, () {
        setState(() {
          opacity = 1.0;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (owo) {},
      onEnter: (event) {
        setState(() {
          shadowColor = Colors.purple;
          y = -12;
        });
      },
      onExit: (event) {
        setState(() {
          shadowColor = Colors.white54;
          y = 0;
        });
      },
      // cursor: SystemMouseCursors.click,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 450),
        opacity: opacity,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          // width: 160,
          // height: 360,
          transform: Matrix4.identity()..translate(0, y),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(blurRadius: 10, color: shadowColor),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(18))),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                  height: (MediaQuery.of(context).orientation.index == 0
                      ? 96
                      : 140),
                  child: Image.asset(
                    widget.imageIcon,
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                  )),
              const Text('Skill confidence level'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: widget.percent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${widget.percent * 100}%',
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
