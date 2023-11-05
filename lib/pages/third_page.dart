import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController ac;
  late Animation<double> telo;
  late Animation<double> ani;
  // late Animation<Alignment> ani2;
  @override
  void initState() {
    ac = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4450),
    );
    telo = CurvedAnimation(curve: Curves.easeInOut, parent: ac);
    ani = Tween(begin: 50.0, end: 255.0).animate(telo)
      ..addListener(() {
        setState(() {
          // debugPrint(ani.value.toString());
        });
      });
    ac.forward();
    super.initState();
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Color.fromRGBO(
              (ani.value / 3).floor(),
              (ani.value / 5).floor(),
              (ani.value / 1.2).floor(),
              1,
            ),
            // b,
            Color.fromRGBO(
              (ani.value / 2).floor(),
              (ani.value / 4).floor(),
              (ani.value / 1.2).floor(),
              1,
            ),
            Colors.black,
          ], stops: const [
            0.0,
            0.2,
            // 0.5,
            0.8,
            1.0
          ])),
          // padding: const EdgeInsets.only(bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Contact',
                    // textScaleFactor: 1.7,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.white),
                  )),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContactCard(
                        title: 'Github',
                        iconColor: Colors.white,
                        assetImage: 'res/github.png',
                        url: 'http://www.github.com/zerokira98',
                        bgColor: Colors.black,
                        txtColor: Colors.white),
                    Padding(padding: EdgeInsets.all(12.0)),
                    ContactCard(
                        title: 'LinkedIn',
                        iconColor: Colors.white,
                        assetImage: 'res/linkedin.png',
                        url:
                            'https://www.linkedin.com/in/muhammad-rizal-afifuddin-880361193/',
                        bgColor: Colors.white,
                        txtColor: Colors.black),
                    Padding(padding: EdgeInsets.all(12.0)),
                    ContactCard(
                        title: 'Facebook',
                        assetImage: 'res/fb.png',
                        // iconColor: Colors.black,
                        url: 'https://www.facebook.com/messavb',
                        bgColor: Colors.white,
                        txtColor: Colors.black)
                  ],
                ),
              ),
              // const Padding(padding: EdgeInsets.all(12.0)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactCard(
                      title: 'Twitter',
                      assetImage: 'res/twitter.png',
                      url: 'https://www.twitter.com/RizalAfifuddin',
                      bgColor: Colors.white,
                      txtColor: Colors.black),
                  Padding(padding: EdgeInsets.all(12.0)),
                  ContactCard(
                      title: 'Instagram',
                      assetImage: 'res/ig.png',
                      url: 'https://www.instagram.com/rizalafif84',
                      bgColor: Colors.white,
                      txtColor: Colors.black),
                ],
              ),
              // const Padding(padding: EdgeInsets.all(12.0)),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     MediaQuery.of(context).orientation.index == 0
              //         ? const ContactCard(
              //             title: 'Facebook',
              //             assetImage: 'res/fb.png',
              //             // iconColor: Colors.black,
              //             url: 'https://www.facebook.com/messavb',
              //             bgColor: Colors.white,
              //             txtColor: Colors.black)
              //         : Container(),
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}

class ContactCard extends StatefulWidget {
  final Color bgColor, txtColor;
  final Color? iconColor;
  final String title, assetImage, url;
  const ContactCard(
      {Key? key,
      required this.bgColor,
      required this.txtColor,
      this.iconColor,
      required this.title,
      required this.assetImage,
      required this.url})
      : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  Color shadow = Colors.black45;
  // var iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrlString(widget.url)) {
          launchUrlString(widget.url);
        }
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            shadow = Colors.purple;
          });
        },
        onExit: (event) {
          setState(() {
            shadow = Colors.black45;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [BoxShadow(blurRadius: 4.0, color: shadow)]),
          child: Row(
            children: [
              // ColorFiltered(
              //   colorFilter: const ColorFilter.mode(
              //     Colors.white,
              //     BlendMode.modulate,
              //   ),
              //   child:
              Image.asset(widget.assetImage, height: 24),
              // ImageIcon(
              //   AssetImage(assetImage),
              //   color: iconColor,
              // ),
              const Padding(padding: EdgeInsets.all(2.0)),
              // ),
              Text(
                widget.title,
                style: TextStyle(color: widget.txtColor),
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
