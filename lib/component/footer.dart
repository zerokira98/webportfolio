import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'test-view-type',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "https://rzafg.my.id/disqus.html"
          ..style.border = 'solid');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          padding: EdgeInsets.only(bottom: 12.0, top: 64),
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text(
              'Copyright 2022, by Muhammad Rizal Afifuddin.\nBuilt with Flutter.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          color: Colors.blueGrey[200],
          padding: EdgeInsets.only(bottom: 12.0, top: 12, left: 24),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Tinggalkan pesan',
            // style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        const Expanded(child: HtmlElementView(viewType: 'test-view-type'))
      ],
    );
  }
}
