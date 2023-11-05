import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'dart:html';

// import 'package:flutter_html/flutter_html.dart';

class Footer extends StatefulWidget {
  Footer({Key? key}) : super(key: key) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'test-view-type',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "https://rzaf84.my.id/disqus.html"
          ..style.border = 'solid');
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'ig-embed',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "/igembed.html"
          ..style.border = 'solid');
  }

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer>
    with AutomaticKeepAliveClientMixin<Footer> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.only(bottom: 12.0, top: 64),
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
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 12.0, top: 64),
          height: 12,
          width: MediaQuery.of(context).size.width,
          // child: const Center(
          // child: Text(
          //   'Copyright 2022, by Muhammad Rizal Afifuddin.\nBuilt with Flutter.',
          //   style: TextStyle(color: Colors.white),
          //   textAlign: TextAlign.center,
          // ),
          // ),
        ),
        // const Expanded(child: HtmlElementView(viewType: 'ig')),
        Container(
          color: Colors.blueGrey[200],
          padding: const EdgeInsets.only(bottom: 12.0, top: 12, left: 24),
          width: MediaQuery.of(context).size.width,
          child: const Text(
            'Tinggalkan pesan',
            // style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: HtmlElementView(viewType: 'test-view-type')),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.orientationOf(context).index % 2 == 1
                                ? 8
                                : 0)),
                    MediaQuery.orientationOf(context).index % 2 == 1
                        ? const Expanded(
                            child: HtmlElementView(viewType: 'ig-embed'))
                        : const SizedBox(),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              MediaQuery.orientationOf(context).index % 2 == 0
                  ? const Expanded(child: HtmlElementView(viewType: 'ig-embed'))
                  : const SizedBox(),
            ],
          ),
        ))
      ],
    );
  }
}
