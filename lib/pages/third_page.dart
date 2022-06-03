import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 56),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                'Contact',
                // textScaleFactor: 1.7,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ContactCard(
                  title: 'Github',
                  iconColor: Colors.white,
                  assetImage: 'res/github.png',
                  url: 'http://www.github.com/zerokira98',
                  bgColor: Colors.black,
                  txtColor: Colors.white),
              Padding(padding: EdgeInsets.all(18.0)),
              ContactCard(
                  title: 'LinkedIn',
                  iconColor: Colors.white,
                  assetImage: 'res/linkedin.png',
                  url:
                      'https://www.linkedin.com/in/muhammad-rizal-afifuddin-880361193/',
                  bgColor: Colors.white,
                  txtColor: Colors.black),
              Padding(padding: EdgeInsets.all(18.0)),
              ContactCard(
                  title: 'Facebook',
                  assetImage: 'res/fb.png',
                  // iconColor: Colors.black,
                  url: 'https://www.facebook.com/messavb',
                  bgColor: Colors.white,
                  txtColor: Colors.black),
            ],
          ),
          const Padding(padding: EdgeInsets.all(12.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ContactCard(
                  title: 'Twitter',
                  assetImage: 'res/twitter.png',
                  url: 'https://www.twitter.com/RizalAfifuddin',
                  bgColor: Colors.white,
                  txtColor: Colors.black),
              Padding(padding: EdgeInsets.all(18.0)),
              ContactCard(
                  title: 'Instagram',
                  assetImage: 'res/ig.png',
                  url: 'https://www.instagram.com/rizalafif84',
                  bgColor: Colors.white,
                  txtColor: Colors.black),
            ],
          )
        ],
      ),
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
        if (await canLaunch(widget.url)) {
          launch(widget.url);
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
