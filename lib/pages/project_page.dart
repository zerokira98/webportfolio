import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  String judul;
  String deskripsi;
  String? gitUrl;
  String? dlLink;
  ProjectPage(
      {Key? key,
      required this.judul,
      required this.deskripsi,
      this.gitUrl,
      this.dlLink})
      : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  bool hover = false;
  var styles = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      width: double.maxFinite,
      color: Colors.redAccent,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: const Text(
              'Protofolio',
              // textScaleFactor: 1.7,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: 160,
            width: 220,
            child: MouseRegion(
              onHover: (event) {},
              onEnter: (a) {
                setState(() {
                  hover = true;
                });
                print('a');
              },
              onExit: (a) {
                setState(() {
                  hover = false;
                });
                print('aw');
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green.withOpacity(0.8),
                      child: Text('Images'),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: hover ? 0 : 120,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: hover ? Colors.black54 : Colors.black26,
                      child: !hover
                          ? Text(widget.judul, style: styles)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    widget.deskripsi,
                                    // overflow: TextOverflow.ellipsis,
                                    style: styles,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      MouseRegion(
                                        cursor: widget.gitUrl == null
                                            ? SystemMouseCursors.basic
                                            : SystemMouseCursors.click,
                                        child: Text(
                                          'SourceCode',
                                          style: styles,
                                        ),
                                      ),
                                      MouseRegion(
                                        cursor: widget.dlLink == null
                                            ? SystemMouseCursors.basic
                                            : SystemMouseCursors.click,
                                        child: Text(
                                          'DownloadAPK',
                                          style: styles,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
