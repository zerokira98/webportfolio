import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Contact',
                textScaleFactor: 1.7,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ContactCard(
                  title: 'Github',
                  assetImage: 'res/github.png',
                  url: 'http://www.github.com/zerokira98',
                  bgColor: Colors.black,
                  txtColor: Colors.white),
              Padding(padding: EdgeInsets.all(18.0)),
              ContactCard(
                  title: 'LinkedIn',
                  assetImage: 'res/linkedin.png',
                  url:
                      'https://www.linkedin.com/in/muhammad-rizal-afifuddin-880361193/',
                  bgColor: Colors.blue,
                  txtColor: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Color bgColor, txtColor;
  final String title, assetImage, url;
  const ContactCard(
      {Key? key,
      required this.bgColor,
      required this.txtColor,
      required this.title,
      required this.assetImage,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) {
          launch(url);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(blurRadius: 4.0, color: Colors.black45)
            ]),
        child: Row(
          children: [
            // ColorFiltered(
            //   colorFilter: const ColorFilter.mode(
            //     Colors.white,
            //     BlendMode.modulate,
            //   ),
            //   child:
            ImageIcon(
              AssetImage(assetImage),
              color: Colors.white,
            ),
            const Padding(padding: EdgeInsets.all(2.0)),
            // ),
            Text(
              title,
              style: TextStyle(color: txtColor),
              textScaleFactor: 1.2,
            ),
          ],
        ),
      ),
    );
  }
}
